# 在 macOS 建置及執行 Parser 與 CSVCleaner

## 準備

- 安裝 .NET 8 SDK；執行產物的 Mac 也需要 .NET 8 runtime。可用 `dotnet --list-sdks` 及 `dotnet --list-runtimes` 檢查。
- Apple Silicon 使用 `MacArm64`，Intel Mac 使用 `MacX64`。以下指令都從儲存庫根目錄執行。

## 建置

```sh
dotnet build ".contrib/Source Code/Parser/Parser.sln" -f net8.0 -c Debug -p:Platform=MacArm64
dotnet build ".contrib/Source Code/Parser/Parser.sln" -f net8.0 -c Release -p:Platform=MacArm64
```

`-f net8.0` 讓方案中的 Parser 使用 .NET 8 目標。Intel Mac 將上述指令的 `MacArm64` 改成 `MacX64`，並分別建置 Debug、Release。輸出目錄如下：

| 專案 | MacArm64 輸出目錄 | MacX64 輸出目錄 |
| --- | --- | --- |
| Parser | `.contrib/.builds/Parser/net8.0/osx-arm64/<Debug 或 Release>/` | `.contrib/.builds/Parser/net8.0/osx-x64/<Debug 或 Release>/` |
| CSVCleaner | `.contrib/.builds/CSVCleaner/net8.0/osx-arm64/<Debug 或 Release>/` | `.contrib/.builds/CSVCleaner/net8.0/osx-x64/<Debug 或 Release>/` |

兩個專案都依賴已安裝的 .NET 8 runtime；執行時須保留各自輸出目錄的執行檔、DLL 與 runtime 設定。Parser 還需要相依組件及 `liblua54.dylib`。

目前 Parser 的資料合併順序會受 .NET 可見的處理器數影響。以下執行指令設定 `DOTNET_PROCESSOR_COUNT=4`，讓這次驗證的 8 個版本在 macOS Debug、Release 產生一致內容，並與既有 Windows 輸出維持相同資料值。省略此設定仍可執行，但少數重複資料的合併結果可能不同；後續應在程式中明確定義合併順序。

## 執行 Retail

Parser 會從目前工作目錄讀取設定與資料，因此先切換至 `.contrib/Parser`，再執行剛建置的程式：

```sh
cd .contrib/Parser
DOTNET_PROCESSOR_COUNT=4 ../.builds/Parser/net8.0/osx-arm64/Release/Parser auto baseconfig=.config/retail/retail.config
```

Intel Mac 將執行檔路徑中的 `osx-arm64` 改成 `osx-x64`；Debug 建置則將 `Release` 改成 `Debug`。

## 執行 CSVCleaner

CSVCleaner 需要依序傳入 CSV 檔與正規表示式檔，並會直接覆寫傳入的 CSV。以下範例先複製一份資料再清理：

```sh
cleaner_tmp=$(mktemp -d)
cp ".contrib/.wago/12 - Midnight/ItemBonus.12.1.0.69933.csv" "$cleaner_tmp/ItemBonus.csv"
".contrib/.builds/CSVCleaner/net8.0/osx-arm64/Release/CSVCleaner" "$cleaner_tmp/ItemBonus.csv" ".contrib/.wago/ItemBonus.regex"
```

Intel Mac 將執行檔路徑中的 `osx-arm64` 改成 `osx-x64`；Debug 建置則將 `Release` 改成 `Debug`。Windows 的方案組態、現有發佈產物與 CI 流程維持原設定。
