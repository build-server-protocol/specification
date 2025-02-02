# ![bsp logo](resources/buildServerProtocol64.svg) Build Server Protocol

[![Join the chat on Discord](https://badgen.net/badge/icon/discord?icon=discord&label)](https://discord.gg/7tMENrnv8p)

This project is an effort to improve the integration between language
server/editors and build tools. This effort is led by the [Scala
Center](https://scala.epfl.ch/) and [JetBrains](https://www.jetbrains.com/),
together with the help of other tooling developers in the Scala ecosystem and
beyond.

Even though the protocol currently focuses on Scala developer tools, it's
designed to be language-agnostic.

You can read the specification [here](https://build-server-protocol.github.io/docs/specification).

The specification text, docs and support libraries for some of the supported languages are automatically
generated from the [smithy model](spec/src/main/resources/META-INF/smithy/bsp/bsp.smithy).

## Contribution

If you'd like to contribute to the protocol, please check out our
[CONTRIBUTING](./CONTRIBUTING.md) doc.

## Maintainers

_Current Maintainers_

- Adrien Piquerez (Scala Center) - [@adpi2](https://github.com/adpi2)
- Andrzej Głuszak (JetBrains) - [@agluszak](https://github.com/agluszak)
- Justin Kaeser (JetBrains) - [@jastice](https://github.com/jastice)
- Marcin Abramowicz (JetBrains) - [@abrams27](https://github.com/abrams27)
- Łukasz Wawrzyk (VirtusLab) - [@lukaszwawrzyk](https://github.com/lukaszwawrzyk)

_Former Maintainers_

- Chris Kipp (ex-Lunatech) - [@ckipp01](https://github.com/ckipp01)
- Jorge Vicente Cantero (ex-Scala Center) - [@jvican](https://github.com/jvican)
- Ólafur Páll Geirsson (ex-Scala Center) - [@olafurpg](https://github.com/olafurpg)
- Tomasz Pasternak (JetBrains/VirtusLab) - [@tpasternak](https://github.com/tpasternak)

## Protocol Changelog

### 2.2.0 (Unreleased)

- Add unstable `run/printStdout`, `run/printStderr` and `run/readStdin` notifications
- Add an optional `originId` field to `TaskStartParams`, `TaskProgressParams` and `TaskFinishParams`
  and deprecate it in `CompileReport` and `TestReport` to support BSP clients that need to distinguish
  between multiple reports for the same target.
  - Migration: Use the `originId` field in `TaskFinishParams` instead of `CompileReport`/`TestReport`
    to identify the report.
- Add optional support for environment variables and working directory parameters in `buildTarget/run`
  and `buildTarget/test` requests.
  Mark arguments and environment variables lists in ScalaMainClass and ScalaTestSuites deprecated as
  they are replaced by the parameters in the base request.
- Add `cargo` (Rust build tool) protocol extension
- Update diagnostic-related structures to match LSP 3.17
- Add `Rust` protocol extension
- Add `buildToolParams` to compile/test/run requests
- Add an optional `data` field to `SourceItem`
