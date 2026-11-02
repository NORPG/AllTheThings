# Build and run Parser and CSVCleaner on macOS

## Requirements

- Install the .NET 8 SDK. Running the results on another Mac also requires the .NET 8 runtime.
- Select `MacArm64` for Apple Silicon or `MacX64` for an Intel Mac. These platforms target .NET 8; the Parser .NET Framework 4.8 target remains Windows only.
- Run build commands from the repository root.

## Build

```sh
dotnet build .contrib/src/Parser/Parser.sln -f net8.0 -c Debug -p:Platform=MacArm64
dotnet build .contrib/src/Parser/Parser.sln -f net8.0 -c Release -p:Platform=MacArm64
```

The solution builds both applications. For an Intel Mac, replace `MacArm64` with `MacX64`. Output is isolated by architecture and configuration:

| Project | MacArm64 output | MacX64 output |
| --- | --- | --- |
| Parser | `.contrib/.builds/Parser/net8.0/osx-arm64/<Debug or Release>/` | `.contrib/.builds/Parser/net8.0/osx-x64/<Debug or Release>/` |
| CSVCleaner | `.contrib/.builds/CSVCleaner/net8.0/osx-arm64/<Debug or Release>/` | `.contrib/.builds/CSVCleaner/net8.0/osx-x64/<Debug or Release>/` |

Keep each application's DLL, `.deps.json`, `.runtimeconfig.json`, and dependency files together when copying its output. Parser also needs the matching `liblua54.dylib`.

## Run Parser for Retail

Parser reads its configuration and database relative to the working directory. Run from `.contrib/.tools`:

```sh
cd .contrib/.tools
dotnet ../.builds/Parser/net8.0/osx-arm64/Release/Parser.dll auto baseconfig=../.db/standard/.config/retail/retail.config
```

For an Intel Mac, replace `osx-arm64` with `osx-x64`. For a Debug build, replace `Release` with `Debug`.

Parser's data merge can depend on the processor count visible to .NET. Set `DOTNET_PROCESSOR_COUNT=4` for repeatable comparisons across runs that use the same data and configuration. Check exported data when comparing different platforms or builds.

## Run CSVCleaner

CSVCleaner updates the CSV file passed as its first argument. A second argument can name a file of regular expressions for filtering records; omit it to sort all records by the `ID` column. The example uses a temporary CSV so no repository data is changed:

```sh
sample_csv=$(mktemp)
printf 'ID,Name\n2,Second\n1,First\n' > "$sample_csv"
dotnet .contrib/.builds/CSVCleaner/net8.0/osx-arm64/Release/CSVCleaner.dll "$sample_csv"
cat "$sample_csv"
rm "$sample_csv"
```

For an Intel Mac, replace `osx-arm64` with `osx-x64`. For a Debug build, replace `Release` with `Debug`.
