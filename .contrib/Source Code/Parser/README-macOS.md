# Build and run Parser and CSVCleaner on macOS

## Prerequisites

- Install the .NET 8 SDK. A Mac running the built applications also needs the .NET 8 runtime. Check with `dotnet --list-sdks` and `dotnet --list-runtimes`.
- Use the `MacArm64` platform on Apple Silicon or `MacX64` on an Intel Mac. Run the following build commands from the repository root.

## Build

```sh
dotnet build ".contrib/Source Code/Parser/Parser.sln" -f net8.0 -c Debug -p:Platform=MacArm64
dotnet build ".contrib/Source Code/Parser/Parser.sln" -f net8.0 -c Release -p:Platform=MacArm64
```

The `-f net8.0` option selects the .NET 8 target for Parser in the solution. On an Intel Mac, replace `MacArm64` with `MacX64` and build both Debug and Release. The output directories are:

| Project | MacArm64 output | MacX64 output |
| --- | --- | --- |
| Parser | `.contrib/.builds/Parser/net8.0/osx-arm64/<Debug or Release>/` | `.contrib/.builds/Parser/net8.0/osx-x64/<Debug or Release>/` |
| CSVCleaner | `.contrib/.builds/CSVCleaner/net8.0/osx-arm64/<Debug or Release>/` | `.contrib/.builds/CSVCleaner/net8.0/osx-x64/<Debug or Release>/` |

Both projects use the installed .NET 8 runtime. Keep each application's executable, DLL, and runtime configuration files together in its output directory. Parser also needs its dependency assemblies and `liblua54.dylib`.

Parser's data merge order currently depends on the processor count visible to .NET. The command below sets `DOTNET_PROCESSOR_COUNT=4` so the eight versions checked in this migration produce consistent output across macOS Debug and Release, while retaining the same data values as the existing Windows output. Parser still runs without this setting, but the merge result for a few duplicate records may differ. A future code change should define the merge order explicitly.

## Run Retail

Parser reads settings and data relative to its working directory. Change to `.contrib/Parser` before running the built application:

```sh
cd .contrib/Parser
DOTNET_PROCESSOR_COUNT=4 ../.builds/Parser/net8.0/osx-arm64/Release/Parser auto baseconfig=.config/retail/retail.config
```

On an Intel Mac, replace `osx-arm64` with `osx-x64` in the executable path. For a Debug build, replace `Release` with `Debug`.

## Run CSVCleaner

CSVCleaner takes a CSV file followed by a file containing the allowed-line regular expressions. It overwrites the CSV file, so this example cleans a copy:

```sh
cleaner_tmp=$(mktemp -d)
cp ".contrib/.wago/12 - Midnight/ItemBonus.12.1.0.69933.csv" "$cleaner_tmp/ItemBonus.csv"
".contrib/.builds/CSVCleaner/net8.0/osx-arm64/Release/CSVCleaner" "$cleaner_tmp/ItemBonus.csv" ".contrib/.wago/ItemBonus.regex"
```

On an Intel Mac, replace `osx-arm64` with `osx-x64` in the executable path. For a Debug build, replace `Release` with `Debug`. The Windows solution configurations, existing release artifacts, and CI workflow retain their current settings.
