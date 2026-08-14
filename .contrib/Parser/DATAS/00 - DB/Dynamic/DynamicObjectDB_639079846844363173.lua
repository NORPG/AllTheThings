local ObjectDB = ObjectDB; for objectID,objectData in pairs({
	[567202] = {
		readable = "Cult Orders",
		model = 5975119,
		text = {
			en = "Cult Orders",
			-- TODO: es = "",
			mx = "Órdenes del culto",
			de = "Befehle für den Kult",
			fr = "Ordres du culte",
			it = "Ordini del Culto",
			pt = "Ordens da Seita",
			ru = "Приказы Культа",
			-- TODO: ko = "",
			-- TODO: cn = "",
			-- TODO: tw = "",
		},
	},
})
do ObjectDB[objectID] = objectData; end
