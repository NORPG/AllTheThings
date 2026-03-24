-- App locals
local _, app = ...;
local L = app.L;

-- Window
app:CreateWindow("Export", {
	SettingsName = "Export",
	Commands = {
		"attexport",
		-- "export",	-- TODO uncomment when fixing how commands are defined
	},
	OnInit = function(self, handlers)
		local styleGroup = app.CreateRawText("Style", {
			icon = app.asset("Category_TradingPost"),
			visible = true,
			expanded = true,
			back = 0.5,
			SortType = "Global",
			g = {},
		})
		-- self.StyleGroup = styleGroup
		for key in pairs(app.DataStyleExporters) do
			tinsert(styleGroup.g, app.CreateToggle(key, {
				name = key,
				parent = styleGroup,
				visible = true,
				OnUpdate = app.AlwaysShowUpdate,
				-- TODO OnClickHandler to assign the shared Export style and un-save other rows??/
			}))
		end

		local windowsGroup = app.CreateRawText("Windows", {
			icon = app.asset("Category_WorldDrops"),
			visible = true,
			expanded = true,
			back = 0.5,
			g = {},
			OnUpdate = function(t)
				if not t.expanded then return end

				local rows = t.g
				wipe(rows)
				for windowKey in pairs(app.Windows) do
					-- TODO: save a hash table of existing window-row links and just skip re-adding
					tinsert(rows, app.CreateRawText(windowKey, {
						OnUpdate = app.AlwaysShowUpdate,
						parent = t,
						back = 0.2,
					}))
				end
				t.SortType = "Global"
				return true
			end,
		})

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
