# 在 macOS 建置及執行 Parser

## 準備

- 安裝 .NET 8 SDK；執行產物的 Mac 也需要 .NET 8 runtime。可用 `dotnet --list-sdks` 及 `dotnet --list-runtimes` 檢查。
- Apple Silicon 使用 `MacArm64`，Intel Mac 使用 `MacX64`。以下指令都從儲存庫根目錄執行。

## 建置

```sh
dotnet build ".contrib/Source Code/Parser/Parser.csproj" -f net8.0 -c Debug -p:Platform=MacArm64
dotnet build ".contrib/Source Code/Parser/Parser.csproj" -f net8.0 -c Release -p:Platform=MacArm64
```

Intel Mac 將上述指令的 `MacArm64` 改成 `MacX64`，並分別建置 Debug、Release。輸出目錄如下：

| 平台 | 輸出目錄 |
| --- | --- |
| `MacArm64` | `.contrib/.builds/Parser/net8.0/osx-arm64/<Debug 或 Release>/` |
| `MacX64` | `.contrib/.builds/Parser/net8.0/osx-x64/<Debug 或 Release>/` |

Parser 是依賴已安裝 .NET 8 runtime 的建置；執行時須保留輸出目錄中的 `Parser`、`Parser.dll`、runtime 設定、相依組件及 `liblua54.dylib`。

目前 Parser 的資料合併順序會受 .NET 可見的處理器數影響。以下執行指令設定 `DOTNET_PROCESSOR_COUNT=4`，讓這次驗證的 8 個版本在 macOS Debug、Release 產生一致內容，並與既有 Windows 輸出維持相同資料值。省略此設定仍可執行，但少數重複資料的合併結果可能不同；後續應在程式中明確定義合併順序。

## 執行 Retail

Parser 會從目前工作目錄讀取設定與資料，因此先切換至 `.contrib/Parser`，再執行剛建置的程式：

```sh
cd .contrib/Parser
DOTNET_PROCESSOR_COUNT=4 ../.builds/Parser/net8.0/osx-arm64/Release/Parser auto baseconfig=.config/retail/retail.config
```

Intel Mac 將執行檔路徑中的 `osx-arm64` 改成 `osx-x64`；Debug 建置則將 `Release` 改成 `Debug`。

目前 macOS 建置範圍是 Parser 專案本身。`Parser.sln` 與其中的 CSVCleaner 尚未設為 macOS 建置目標；Windows 的方案、現有發佈產物與 CI 流程維持原設定。
