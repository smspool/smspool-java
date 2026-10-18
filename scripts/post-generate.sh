#!/usr/bin/env bash
# Adds Maven Central publishing to the generated pom.xml (sign-artifacts profile).
set -euo pipefail
cd "$(dirname "$0")/.."
python3 - pom.xml <<'EOF'
import sys
path = sys.argv[1]
pom = open(path).read()
if "central-publishing-maven-plugin" not in pom:
    anchor = "<artifactId>maven-gpg-plugin</artifactId>"
    assert anchor in pom, "no maven-gpg-plugin in pom.xml"
    gpg_config = '''<artifactId>maven-gpg-plugin</artifactId>
                        <configuration>
                            <gpgArguments>
                                <arg>--pinentry-mode</arg>
                                <arg>loopback</arg>
                            </gpgArguments>
                        </configuration>'''
    pom = pom.replace(anchor, gpg_config, 1)
    plugin = '''<plugin>
                        <groupId>org.sonatype.central</groupId>
                        <artifactId>central-publishing-maven-plugin</artifactId>
                        <version>0.11.1</version>
                        <extensions>true</extensions>
                        <configuration>
                            <publishingServerId>central</publishingServerId>
                            <autoPublish>true</autoPublish>
                            <waitUntil>published</waitUntil>
                        </configuration>
                    </plugin>
                </plugins>'''
    start = pom.index("<id>sign-artifacts</id>")
    end = pom.index("</plugins>", start)
    pom = pom[:end] + plugin + pom[end + len("</plugins>"):]
    open(path, "w").write(pom)
EOF
