#!/usr/bin/env bash
# Prints the package version from openapi-generator.yaml.
set -euo pipefail
cd "$(dirname "$0")/.."
sed -n 's/^ *artifactVersion: *//p' openapi-generator.yaml | tr -d '"' | head -1
