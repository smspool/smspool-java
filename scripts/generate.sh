#!/usr/bin/env bash
# Regenerates the SDK from the SMSPool OpenAPI spec. Everything listed in
# .openapi-generator-ignore (README, workflows, scripts, smoke test) is kept.
#
#   scripts/generate.sh                    spec from https://api.smspool.net/openapi.json
#   SPEC_FILE=path/openapi.json scripts/generate.sh
#
# Needs Docker. The generator version is pinned below; change it on purpose.
set -euo pipefail
cd "$(dirname "$0")/.."

IMAGE=openapitools/openapi-generator-cli:v7.25.0
SPEC_URL=${SPEC_URL:-https://api.smspool.net/openapi.json}

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
if [ -n "${SPEC_FILE:-}" ]; then
    cp "$SPEC_FILE" "$tmp/openapi.json"
else
    curl -fsSL "$SPEC_URL" -o "$tmp/openapi.json"
fi
# Refuse anything that is not an OpenAPI document before touching files.
python3 -c 'import json,sys; d=json.load(open(sys.argv[1])); assert d.get("openapi") and d.get("paths"), "not an OpenAPI spec"' "$tmp/openapi.json"

# Delete what the previous run generated, so endpoints removed from the
# spec disappear too. Only plain relative paths are removed, never the
# ignore file or hand-written folders.
if [ -f .openapi-generator/FILES ]; then
    while IFS= read -r f; do
        case "$f" in
            ""|/*|*..*|.openapi-generator-ignore|README.md|LICENSE|.github/*|scripts/*|smoke/*) continue ;;
        esac
        rm -f -- "$f"
    done < .openapi-generator/FILES
fi

docker run --rm -u "$(id -u):$(id -g)" \
    -v "$PWD:/local" -v "$tmp:/spec:ro" \
    "$IMAGE" generate -i /spec/openapi.json -c /local/openapi-generator.yaml -o /local \
    > "$tmp/generator.log" 2>&1 || { cat "$tmp/generator.log" >&2; exit 1; }

if [ -x scripts/post-generate.sh ]; then
    scripts/post-generate.sh
fi
echo "Generated from $( [ -n "${SPEC_FILE:-}" ] && echo "$SPEC_FILE" || echo "$SPEC_URL" )."
