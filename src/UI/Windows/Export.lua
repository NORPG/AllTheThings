-- App locals
local _, app = ...;
local L = app.L;

local ExportStyle
local function UpdateExportStyle(row, button, styleID, active)
	if active then
		ExportStyle = styleID
	else
		ExportStyle = nil
	end
	-- clear other checks
	local styleGroup = row.ref and row.ref.parent
	if not styleGroup then return end

	local g = styleGroup.g
	for i=1,#g do
		if g[i].toggleID ~= styleID then
			g[i].saved = nil
		end
	end
end
local function DoExport(row, button)
	if not ExportStyle then
		app.print("Please select a Style to Export")
		return
	end
	local window = app:GetWindow(row.ref.Suffix)
	app:ExportStylizedData(window, ExportStyle)
	app.print("Exported",window.Suffix,"in",ExportStyle,"style!")
end

-- Excluded windows
local ExcludedWindows = {
	Export = 1,
	Prime = 1,
}

-- Window
app:CreateWindow("Export", {
	Commands = {
		"attexport",
		-- "export",	-- TODO uncomment when fixing how commands are defined
	},
	OnInit = function(self, handlers)
		local styleGroup = app.CreateRawText("Style", {
			icon = app.asset("Category_TradingPost"),
			expanded = true,
			back = 0.5,
			SortType = "Global",
			g = {},
		})
		-- self.StyleGroup = styleGroup
		local styleGroupg = styleGroup.g
		for key in pairs(app.DataStyleExporters) do
			styleGroupg[#styleGroupg + 1] = app.CreateToggle(key, {
				name = key,
				parent = styleGroup,
				visible = true,
				OnUpdate = app.AlwaysShowUpdate,
				OnClickHandler = UpdateExportStyle
			})
		end

		local windowsGroup = app.CreateRawText("Windows", {
			icon = app.asset("Category_WorldDrops"),
			expanded = true,
			back = 0.5,
			SortType = "Global",
			g = {},
		})
		local rows = windowsGroup.g
		for suffix,window in pairs(app.Windows) do
			-- TODO: maybe wrap the window header data instead
			if not ExcludedWindows[suffix] then
				rows[#rows + 1] = app.CreateRawText(suffix, {
					Suffix = suffix,
					OnUpdate = app.AlwaysShowUpdate,
					OnClick = DoExport,
					parent = windowsGroup,
					back = 0.2,
				})
			end
		end
		app.AddEventHandler("OnWindowCreated", function(window, suffix)
			if not ExcludedWindows[suffix] then
				local newWindowGroup = app.CreateRawText(suffix, {
					Suffix = suffix,
					OnUpdate = app.AlwaysShowUpdate,
					OnClick = DoExport,
					parent = windowsGroup,
					back = 0.2,
				})
				rows[#rows + 1] = newWindowGroup
				windowsGroup.SortType = "Global"
				app.DirectGroupUpdate(windowsGroup)
			end
		end)

		self:SetData(app.CreateRawText("Export", {
			-- icon = app.asset("Interface_Vendor"),
			description = "Allows exporting the data of an active window using a specified Style.",
			g = {
				styleGroup,
				windowsGroup,
			},
		}))
	end,
})
