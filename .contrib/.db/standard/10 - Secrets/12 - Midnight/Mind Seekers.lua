-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.MID, {
	header(HEADERS.Achievement, 62189, bubbleDownSelf({ ["timeline"] = { ADDED_12_0_0 } }, {	-- Mind-Seeker
		["description"] = createLocalizationString({
			readable = "Swim out to the coordinates then further out south just until fatigue kicks in, then retreat.\nSwim down until fatigue kicks in again then mad dash towards the glowing orb by the skeleton.\n\nYou will want the Vash'jir seahorse and water breathing to make it in time.",
			constant = "SWIM_OUT_TO_THE_COORDINATES_THEN_FURTHER_OUT",
			export = true,
			text = {
				en = "Swim out to the coordinates then further out south just until fatigue kicks in, then retreat.\nSwim down until fatigue kicks in again then mad dash towards the glowing orb by the skeleton.\n\nYou will want the Vash'jir seahorse and water breathing to make it in time.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "游到该坐标后继续向南游，直到疲劳开始生效，然后返回。\n再向下游直到疲劳再次生效，然后拼命冲向骷髅旁发光的宝珠。\n\n你最好带上瓦丝琪尔海马和水下呼吸，才能及时赶到。",
				-- TODO: tw = "",
			},
		}),
		["coord"] = { 15.0, 90.0, VASHJIR_ABYSSAL_DEPTHS },
		["groups"] = {	-- Everything here is in a mapless place.
			n(256536, {	-- Anakron <Mind-Seeker>
				["description"] = createLocalizationString({
					readable = "Around the room are displays tracking various 'secret' activities you may or may not have completed. If you've completed enough (17+), speak to Anakron to become a Mind Seeker.",
					constant = "AROUND_THE_ROOM_ARE_DISPLAYS_TRACKING_VARIOUS",
					export = true,
					text = {
						en = "Around the room are displays tracking various 'secret' activities you may or may not have completed. If you've completed enough (17+), speak to Anakron to become a Mind Seeker.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "房间四周陈列着各种展品，记录着你可能完成或尚未完成的各种“秘密”活动。如果你完成的数量足够（17 个以上），与阿纳克隆交谈即可成为心灵探寻者。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					hqt(94828, {	-- Become a Mind Seeker
						["name"] = "Become a Mind Seeker",
					}),
					ach(62189, {	-- Mind-Seeker
						["sourceQuest"] = 94828,	-- Become a Mind Seeker
						["groups"] = { title(671) },	-- Mind-Seeker <Name>
					}),
				},
			}),
			n(256667, {	-- Mistress Nagmara
				["groups"] = {
					i(166545),	-- Befuddlin' Brew
					i(232005),	-- Cryptic Crostini
					i(232006),	-- Detective's Delight
					i(232009),	-- Riddle Wraps
					i(232007),	-- Sleuth's Sip
					i(262880),	-- Vintage Purple Stuff
				},
			}),
		},
	})),
}));
