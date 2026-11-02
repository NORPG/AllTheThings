# Build and run Parser on macOS

## Requirements

- Install the .NET 8 SDK. Running the result on another Mac also requires the .NET 8 runtime.
- Select `MacArm64` for Apple Silicon or `MacX64` for an Intel Mac. These platforms target .NET 8; the .NET Framework 4.8 target remains Windows only.
- Run build commands from the repository root.

## Build

```sh
dotnet build .contrib/src/Parser/Parser.csproj -f net8.0 -c Debug -p:Platform=MacArm64
dotnet build .contrib/src/Parser/Parser.csproj -f net8.0 -c Release -p:Platform=MacArm64
```

For an Intel Mac, replace `MacArm64` with `MacX64`. Build output is isolated by architecture and configuration:

| Platform | Output directory |
| --- | --- |
| `MacArm64` | `.contrib/.builds/Parser/net8.0/osx-arm64/<Debug or Release>/` |
| `MacX64` | `.contrib/.builds/Parser/net8.0/osx-x64/<Debug or Release>/` |

Keep `Parser.dll`, `Parser.runtimeconfig.json`, `Parser.deps.json`, dependency assemblies, and the matching `liblua54.dylib` together when copying the build output.

## Run Retail

Parser reads its configuration and database relative to the working directory. Run from `.contrib/.tools`:

```sh
cd .contrib/.tools
dotnet ../.builds/Parser/net8.0/osx-arm64/Release/Parser.dll auto baseconfig=../.db/standard/.config/retail/retail.config
```

For an Intel Mac, replace `osx-arm64` with `osx-x64`. For a Debug build, replace `Release` with `Debug`.

Parser's data merge can depend on the processor count visible to .NET. Set `DOTNET_PROCESSOR_COUNT=4` for repeatable comparisons across runs that use the same data and configuration. Check exported data when comparing different platforms or builds.
