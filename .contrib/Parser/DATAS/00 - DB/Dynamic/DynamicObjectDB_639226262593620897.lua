
local ObjectDB = ObjectDB; for objectID,objectData in pairs({
	[31] = {
		text = {
			mx = "Estatua de león antigua",
		},
	},
	[32] = {
		text = {
			mx = "Cofre sumergido",
		},
	},
	[33] = {
		text = {
			it = "Cassa Chiusa",
		},
	},
	[47] = {
		text = {
			mx = "¡Se busca!",
			tw = "懸賞！",
		},
	},
	[52] = {
		text = {
			it = "La Caduta di Gurubashi",
		},
	},
	[54] = {
		text = {
			it = "La Tomba dell'Imperatore",
		},
	},
	[55] = {
		text = {
			mx = "Un cadáver medio comido",
			tw = "被吃掉一半的屍體",
		},
	},
	[56] = {
		text = {
			mx = "Cadáver de Rolf",
			tw = "羅爾夫的屍體",
		},
	},
	[57] = {
		text = {
			mx = "Tablilla de conocimiento Sangrapellejo",
			tw = "血頂知識石板",
		},
	},
	[58] = {
		text = {
			mx = "Gri'lek el Trotamundos",
			it = "Gri'lek il Nomade",
			tw = "漫遊者格里雷克",
		},
	},
	[60] = {
		text = {
			mx = "Se busca: Gath'Ilzogg",
			tw = "懸賞:加塞爾佐格",
		},
	},
	[61] = {
		text = {
			mx = "Una tumba erosionada",
			tw = "破舊的墳墓",
		},
	},
	[76] = {
		text = {
			mx = "Un tarro vacío",
			it = "Giara Vuota",
			tw = "空瓶子",
		},
	},
	[119] = {
		text = {
			mx = "Cajón de Abercrombie",
			it = "Cassa di Abercrombie",
			tw = "亞伯克隆比的木箱",
		},
	},
	[256] = {
		text = {
			mx = "¡Se busca!",
			tw = "懸賞！",
		},
	},
	[257] = {
		text = {
			mx = "Barrica sospechosa",
			tw = "可疑的桶子",
		},
	},
	[259] = {
		text = {
			mx = "Barrica semienterrada",
			tw = "半埋的大桶",
		},
	},
	[261] = {
		text = {
			mx = "Cajón dañado",
			tw = "破損的木箱",
		},
	},
	[263] = {
		text = {
			mx = "Suministros Kurzen",
			it = "Rifornimenti di Kurzen",
			tw = "庫爾森補給品",
		},
	},
	[264] = {
		text = {
			mx = "Suministros Kurzen",
			it = "Rifornimenti di Kurzen",
			tw = "庫爾森補給品",
		},
	},
	[269] = {
		text = {
			mx = "Barrica de Cerveza del Trueno custodiado",
			tw = "被看守著的雷霆麥芽酒桶",
		},
	},
	[271] = {
		text = {
			mx = "Cajones de la Liga de Mineros",
			it = "Casse della Lega dei Minatori",
			tw = "礦工聯盟的木箱",
		},
	},
	[272] = {
		text = {
			mx = "Estantería de carne de MacGrann",
			it = "Cassa della Carne di MacGrann",
			cn = "马克格拉恩的储肉柜",
			tw = "馬克格拉恩的儲肉櫃",
		},
	},
	[276] = {
		text = {
			mx = "Cesta de cardaluz",
			it = "Cestino di Erbaluce",
			tw = "微光草籃",
		},
	},
	[290] = {
		text = {
			mx = "Guardarropa de Cejade",
			it = "Guardaroba di Ciglioarcuato",
			tw = "法布隆的櫃子",
		},
	},
	[321] = {
		text = {
			mx = "Lágrima de Tilloa",
			it = "Lacrima di Tilloa",
			tw = "蒂羅亞之淚",
		},
	},
	[324] = {
		text = {
			mx = "Filón pequeño de torio",
			it = "Vena Piccola di Torio",
			tw = "瑟銀礦脈",
		},
	},
	[331] = {
		text = {
			mx = "Suelo blando",
			it = "Terreno Smosso",
			tw = "鬆軟的土壤",
		},
	},
	[333] = {
		text = {
			mx = "Reliquia antigua",
			it = "Reliquia Antica",
			tw = "古代聖物",
		},
	},
	[334] = {
		text = {
			mx = "Reliquia antigua",
			it = "Reliquia Antica",
			tw = "古代聖物",
		},
	},
	[375] = {
		text = {
			mx = "Calabaza de Tirisfal",
			it = "Zucca di Tirisfal",
			tw = "提里斯法南瓜",
		},
	},
	[759] = {
		text = {
			mx = "El manantial sagrado",
			it = "Sorgente Sacra",
			tw = "聖泉",
		},
	},
	[1166] = {
		text = {
			mx = "Cofre de Alexston",
			it = "Cassa di Alexston",
			tw = "艾力克斯頓的箱子",
		},
	},
	[1557] = {
		text = {
			mx = "Mesa de cena de Lillith",
			tw = "莉莉絲的餐桌",
		},
	},
	[1560] = {
		text = {
			mx = "Cofre de almacenamiento",
			it = "Forziere del Magazzino",
			tw = "儲藏箱",
		},
	},
	[1561] = {
		text = {
			mx = "Cajón sellado",
			tw = "密封的木箱",
		},
	},
	[1562] = {
		text = {
			mx = "Cofre del mariscal Haggard",
			it = "Forziere del Maresciallo Haggard",
			tw = "哈迦德的箱子",
		},
	},
	[1586] = {
		text = {
			mx = "Cajón de velas",
			tw = "蠟燭木箱",
		},
	},
	[1609] = {
		text = {
			mx = "Catapulta Faucedraco",
			tw = "龍喉投石車",
		},
	},
})
do ObjectDB[objectID] = objectData; end
