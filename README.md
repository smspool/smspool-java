# SMSPool Java SDK

Official Java client for the [SMSPool API](https://api.smspool.net/docs): one-time SMS
verification numbers, rentals, pre-orders, eSIMs and more.

Package: [`io.github.smspool:smspool-sdk`](https://central.sonatype.com/artifact/io.github.smspool/smspool-sdk) on Maven Central.

## Install

```xml
<dependency>
  <groupId>io.github.smspool</groupId>
  <artifactId>smspool-sdk</artifactId>
  <version>0.1.0</version>
</dependency>
```

## Quick start

Get your API key from [your settings page](https://www.smspool.net/my/settings).

```java
ApiClient client = new ApiClient();
client.setBearerToken("YOUR_API_KEY");
System.out.println(new InformationApi(client).requestBalance());
Object countries = new InformationApi(client).countryRetrieveAll(null);
```

Responses are Gson-parsed values (`Map` / `List`; numbers come back as `Double`). Errors
(HTTP 4xx/5xx) throw `io.github.smspool.ApiException`, with `getCode()` and `getResponseBody()`.
Requires Java 8+.

## Calling endpoints

Every endpoint in the [API reference](https://api.smspool.net/docs) is a method named after
its path, on the class for its section: `/sms/check` is `smsCheck()` on `SmsApi`. Endpoints that need
your API key send it as a bearer token.

Responses are returned as decoded JSON exactly as the API sends them: many endpoints answer
`200` with `"success": 0` and a `message` when a request is refused, so check `success`.

- Generated reference for every method and parameter: [`docs/`](docs/)
- API reference with examples: https://api.smspool.net/docs

## How this SDK is made

The code is generated from the API's OpenAPI spec
([openapi.json](https://api.smspool.net/openapi.json)) with
[OpenAPI Generator](https://openapi-generator.tech). Do not edit generated files by hand:
a workflow regenerates them every week and opens a pull request when the API changed.
Hand-written files are listed in `.openapi-generator-ignore`.

## Releasing (maintainers)

1. Set the new version in `openapi-generator.yaml` (`artifactVersion`).
2. Run `scripts/generate.sh` (needs Docker) and `scripts/smoke.sh`, then commit.
3. Tag and push: `git tag vX.Y.Z && git push origin vX.Y.Z`.

The Release workflow checks the tag against the version, runs the smoke test and publishes.
Publishing needs the secrets `MAVEN_CENTRAL_USERNAME` and `MAVEN_CENTRAL_PASSWORD` (a Central
Portal user token), `MAVEN_GPG_PRIVATE_KEY` and `MAVEN_GPG_PASSPHRASE`.

## License

MIT
