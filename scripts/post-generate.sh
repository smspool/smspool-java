#!/usr/bin/env bash
# Adds Maven Central publishing to the generated pom.xml (sign-artifacts profile):
#  - signs with maven-gpg-plugin's BouncyCastle signer, which reads the key and
#    passphrase from MAVEN_GPG_KEY / MAVEN_GPG_PASSPHRASE. No gpg binary, agent
#    or pinentry, so it works on CI.
#  - uploads with Sonatype's central-publishing-maven-plugin.
set -euo pipefail
cd "$(dirname "$0")/.."
python3 - pom.xml <<'PY'
import re, sys
path = sys.argv[1]
pom = open(path).read()
if "central-publishing-maven-plugin" not in pom:
    profile_start = pom.index("<id>sign-artifacts</id>")
    head, profile = pom[:profile_start], pom[profile_start:]
    profile, n = re.subn(
        r"<artifactId>maven-gpg-plugin</artifactId>(\s*)<version>[^<]+</version>",
        r"<artifactId>maven-gpg-plugin</artifactId>\1<version>3.2.8</version>\1<configuration>\1    <signer>bc</signer>\1</configuration>",
        profile, count=1)
    assert n == 1, "maven-gpg-plugin not found in the sign-artifacts profile"
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
    end = profile.index("</plugins>")
    profile = profile[:end] + plugin + profile[end + len("</plugins>"):]
    open(path, "w").write(head + profile)
PY
