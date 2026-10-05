-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.SL, {
	header(HEADERS.Item, 192485, bubbleDownSelf({ ["timeline"] = { ADDED_9_2_5 } }, {	-- Stored Wisdom Device
		n(162804, {	-- Ve'nari
			["description"] = createLocalizationString({
				readable = "If you talk to Ve'nari at her usual location in her hideout in the Maw, you'll see that she is an echo and no longer physically present. Talking to her reveals an extra dialogue option, where she will mention that she has finally found Zereth Mortis.",
				constant = "IF_YOU_TALK_TO_VE_NARI_AT_HER_USUAL_LOCATION_IN",
				export = true,
				text = {
					en = "If you talk to Ve'nari at her usual location in her hideout in the Maw, you'll see that she is an echo and no longer physically present. Talking to her reveals an extra dialogue option, where she will mention that she has finally found Zereth Mortis.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "如果你在噬渊她藏身处中维娜丽的惯常位置与她交谈，你会看到她只是一个回响，已不再以实体存在。与她交谈会显示一个额外的对话选项，她会在其中提到她终于找到了扎雷殁提斯。",
					-- TODO: tw = "",
				},
			}),
			["coord"] = { 46.9, 41.7, THE_MAW },
			["questID"] = 65470,
		}),
		n(185083, {	-- Ve'nari
			["description"] = createLocalizationString({
				readable = "After talking to Ve'nari's echo in her hideout, head to the Creation Catalyst in Zereth Mortis. There, you will find Ve'nari's charred corpse in the center of the room. Interact with it, and select the dialogue option to take a closer look.",
				constant = "AFTER_TALKING_TO_VE_NARI_S_ECHO_IN_HER_HIDEOUT",
				export = true,
				text = {
					en = "After talking to Ve'nari's echo in her hideout, head to the Creation Catalyst in Zereth Mortis. There, you will find Ve'nari's charred corpse in the center of the room. Interact with it, and select the dialogue option to take a closer look.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在她的藏身处与维娜丽的回响交谈后，前往扎雷殁提斯的造物催化剂。在那里，你会在房间中央找到维娜丽烧焦的尸体。与它互动，并选择仔细观察的对话选项。",
					-- TODO: tw = "",
				},
			}),
			["sourceQuests"] = { 65470 },
			["coord"] = { 47.4, 88.6, ZERETH_MORTIS },
			["questID"] = 65488,
		}),
		n(MAILBOX, {
			["description"] = createLocalizationString({
				readable = "You should receive a letter from Ve'nari with the toy attached 5 days after interacting with her decoy corpse in Zereth Mortis.",
				constant = "YOU_SHOULD_RECEIVE_A_LETTER_FROM_VE_NARI_WITH",
				export = true,
				text = {
					en = "You should receive a letter from Ve'nari with the toy attached 5 days after interacting with her decoy corpse in Zereth Mortis.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在与扎雷殁提斯的维娜莉的假尸体互动 5 天后，你应该会收到一封来自维娜莉并附有该玩具的信。",
					-- TODO: tw = "",
				},
			}),
			["sourceQuests"] = { 65488 },
			["groups"] = {
				i(192485),	-- Stored Wisdom Device (TOY!)
			},
		}),
	})),
}));
