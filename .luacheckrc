std = "lua51"

-- WoW and ATT provide project-specific globals at runtime.
global = false

-- Generated parser output should be validated at its source instead.
exclude_files = {
	"db/**",
	".contrib/GlobalStrings.lua",
	".contrib/.db/standard/00 - Item DB/.dynamic/**",
	".contrib/.db/shared/objects/Dynamic/DynamicObjectDB_*.lua",
}
