std = "lua51"

-- WoW and ATT provide project-specific globals at runtime.
global = false

-- Generated parser output should be validated at its source instead.
exclude_files = {
	"db/**",
	".contrib/GlobalStrings.lua",
	".contrib/Parser/DATAS/00 - Item DB/.dynamic/**",
	".contrib/Parser/DATAS/00 - DB/Dynamic/DynamicObjectDB_*.lua",
}
