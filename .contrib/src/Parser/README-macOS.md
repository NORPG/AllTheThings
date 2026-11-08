# Build and run Parser and CSVCleaner on macOS

## Requirements

- Install the .NET 8 and .NET 10 SDKs. Running the results on another Mac requires both runtimes.
- Select `MacArm64` for Apple Silicon or `MacX64` for an Intel Mac. Parser targets .NET 8 and CSVCleaner targets .NET 10 on macOS; the Parser .NET Framework 4.8 target remains Windows only.
- Run build commands from the repository root.

## Build Parser

```sh
dotnet build .contrib/src/Parser/Parser.csproj -f net8.0 -c Debug -p:Platform=MacArm64
dotnet build .contrib/src/Parser/Parser.csproj -f net8.0 -c Release -p:Platform=MacArm64
```

For an Intel Mac, replace `MacArm64` with `MacX64`. Output is isolated by architecture and configuration:

| Platform | Output directory |
| --- | --- |
| MacArm64 | `.contrib/.builds/Parser/net8.0/osx-arm64/<Debug or Release>/` |
| MacX64 | `.contrib/.builds/Parser/net8.0/osx-x64/<Debug or Release>/` |

Keep `Parser.dll`, its `.deps.json` and `.runtimeconfig.json` files, dependencies, and the matching `liblua54.dylib` together when copying the output.

## Run Parser for Retail

Parser reads its configuration and database relative to the working directory. Run from `.contrib/.tools`:

```sh
cd .contrib/.tools
DOTNET_PROCESSOR_COUNT=4 dotnet ../.builds/Parser/net8.0/osx-arm64/Release/Parser.dll auto baseconfig=../.db/standard/.config/retail/retail.config
```

For an Intel Mac, replace `osx-arm64` with `osx-x64`. For a Debug build, replace `Release` with `Debug`.

Parser's data merge can depend on the processor count visible to .NET. Set `DOTNET_PROCESSOR_COUNT=4` for repeatable comparisons across runs that use the same data and configuration. Check exported data when comparing different platforms or builds.

## Build CSVCleaner

```sh
dotnet build .contrib/src/CSVCleaner/CSVCleaner.csproj -c Debug -p:Platform=MacArm64
dotnet build .contrib/src/CSVCleaner/CSVCleaner.csproj -c Release -p:Platform=MacArm64
```

For an Intel Mac, replace `MacArm64` with `MacX64`. CSVCleaner output is isolated by architecture and configuration:

| Platform | Output directory |
| --- | --- |
| MacArm64 | `.contrib/.builds/CSVCleaner/net10.0/osx-arm64/<Debug or Release>/` |
| MacX64 | `.contrib/.builds/CSVCleaner/net10.0/osx-x64/<Debug or Release>/` |

Keep `CSVCleaner.dll`, its `.deps.json` and `.runtimeconfig.json` files, and dependencies together when copying the output.

## Run CSVCleaner

CSVCleaner updates the CSV file passed as its first argument. A second argument can name a file of regular expressions for filtering records; omit it to sort all records by the `ID` column. The example uses a temporary CSV so no repository data is changed:

```sh
sample_csv=$(mktemp)
printf 'ID,Name\n2,Second\n1,First\n' > "$sample_csv"
dotnet .contrib/.builds/CSVCleaner/net10.0/osx-arm64/Release/CSVCleaner.dll "$sample_csv"
cat "$sample_csv"
rm "$sample_csv"
```

For an Intel Mac, replace `osx-arm64` with `osx-x64`. For a Debug build, replace `Release` with `Debug`.
