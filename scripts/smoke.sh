#!/usr/bin/env bash
# Builds the SDK and calls the live API: a public endpoint, a form POST,
# and an authenticated one with a bad key (which must fail with 401/403).
set -euo pipefail
cd "$(dirname "$0")/.."
mvn -B -q install -DskipTests -Dmaven.javadoc.skip=true
mvn -B -q dependency:build-classpath -Dmdep.outputFile=target/classpath.txt
cp="target/classes:$(cat target/classpath.txt)"
javac -d target/smoke -cp "$cp" smoke/JavaSmoke.java
java -cp "$cp:target/smoke" JavaSmoke
