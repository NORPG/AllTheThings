const fs = require("fs");

const expectedKeys = [
  "en","de","es","mx",
  "fr","it","ko","pt",
  "ru","cn","tw"
];

const file = process.argv[2];
if (!file) {
  console.error("請提供要處理的檔案路徑");
  process.exit(1);
}

let content = fs.readFileSync(file, "utf8");

// 抓 tableHeader、body、closingBraceLine 與 afterBrace
const tableRegex =
  /(^[ \t]*(text|description)\s*=\s*\{)([\s\S]*?)(^\s*\})([ \t]*[,;]?)/gm;

content = content.replace(
  tableRegex,
  (fullMatch, tableHeader, tableName, body, closingBraceLine, afterBrace) => {

    // 保留原始 header 行
    // e.g. "    text = {"
    const headerIndent = tableHeader.match(/^(\s*)/)[1];

    // 解析 body，保留所有行與原縮排
    const lines = body.split(/\r?\n/).filter((l) => l.trim() !== "");

    const presentKeys = [];
    const valueLines = [];

    for (const line of lines) {
      // 🟦 A. 正常欄位：  en = "text"
      const normal = line.match(/^\s*(\w+)\s*=/);

      // 🟦 B. 註解欄位： -- de = "text" 或 -- TODO: de = "..."
      const commented = line.match(/^\s*--\s*(?:TODO:\s*)?(\w+)\s*=/);

      if (normal) {
        presentKeys.push(normal[1]);
        valueLines.push(line); // 原樣保留
      } else if (commented) {
        presentKeys.push(commented[1]); // 註解欄位視為存在
        valueLines.push(line);          // 原樣保留
      }
    }

    // 若只有 en → 不補欄位、不調整，只調整結尾 brace
    if (presentKeys.length === 1 && presentKeys[0] === "en") {
      return (
        `${tableHeader}\n` +
        valueLines.join("\n") +
        `\n${headerIndent}}${afterBrace}`
      );
    }

    // 找第一個欄位縮排，用於 TODO
    let firstIndent = "";
    if (valueLines.length > 0) {
      const m = valueLines[0].match(/^(\s*)/);
      firstIndent = m ? m[1] : "";
    }

    // 收集所有結果
    const finalLines = [];

    for (const k of expectedKeys) {
      // 找正常欄位
      const existing = valueLines.find((l) =>
        l.trimStart().startsWith(k + " =")
      );

      // 找註解欄位
      const commented = valueLines.find((l) =>
        l.trimStart().startsWith("-- " + k + " =") ||
        l.trimStart().startsWith("-- TODO: " + k + " =")
      );

      if (existing) {
        finalLines.push(existing);
      } else if (commented) {
        finalLines.push(commented); // 保留註解行
      } else {
        // 補 TODO（只有真正缺且未註解）
        finalLines.push(`${firstIndent}-- TODO: ${k} = "",`);
      }
    }

    return (
      `${tableHeader}\n` +
      finalLines.join("\n") +
      `\n${headerIndent}}${afterBrace}`
    );
  }
);

fs.writeFileSync(file, content, "utf8");

console.log("✅ 完成：註解欄位視為存在，完全保留格式並重新排序");