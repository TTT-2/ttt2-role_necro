L = LANG.GetLanguageTableReference("zh_hans")

-- GENERAL ROLE LANGUAGE STRINGS
L[NECROMANCER.name] = "死灵法师"
L[NECROMANCER.defaultTeam] = "死灵法师队伍"
L["hilite_win_" .. NECROMANCER.defaultTeam] = "死灵法师队伍获胜"
L["win_" .. NECROMANCER.defaultTeam] = "死灵法师获胜!"
L["info_popup_" .. NECROMANCER.name] = [[现在轮到你了!试着让一些死去的玩家站在你这边!]]
L["body_found_" .. NECROMANCER.abbr] = "他们是死灵法师!"
L["search_role_" .. NECROMANCER.abbr] = "这个人是死灵法师!"
L["ev_win_" .. NECROMANCER.defaultTeam] = "死灵法师赢了这一轮!"
L["target_" .. NECROMANCER.name] = "死灵法师"
L["ttt2_desc_" .. NECROMANCER.name] = [[亡灵巫师需要复活死去的玩家.如果一个玩家复活了,他看起来像一个僵尸,如果弹药是空的,他会死.]]

L[ZOMBIE.name] = "僵尸"
L["target_" .. ZOMBIE.name] = "僵尸"
L["ttt2_desc_" .. ZOMBIE.name] = [[你需要和你的伴侣一起赢!]]
L["body_found_" .. ZOMBIE.abbr] = "他们是僵尸!"
L["search_role_" .. ZOMBIE.abbr] = "这个人是僵尸!"

-- OTHER ROLE LANGUAGE STRINGS
L["necro_defi_name"] = "Necro's Defi"
L["zombie_pistol_name"] = "僵尸手枪"

L["revived_by_necromancer"] = "你被｛name｝复活为亡灵巫师僵尸.做好准备!"
L["necrodefi_hold_key_to_revive"] = "按住[{key}]将玩家恢复为僵尸"
L["necrodefi_revive_progress"] = "剩下的时间: {time}秒"
L["necrodefi_charging"] = "除颤器正在充电,请稍候"
L["necrodefi_player_already_reviving"] = "玩家已经恢复了"
L["necrodefi_error_no_space"] = "没有足够的空间用于此复兴尝试."
L["necrodefi_error_too_fast"] = "除颤器正在充电.请稍等."
L["necrodefi_error_lost_target"] = "你失去了目标.请再试一次."
L["necrodefi_error_no_valid_ply"] = "您无法恢复此玩家,因为它们不再有效."
L["necrodefi_error_already_reviving"] = "你不能复活这个玩家,因为他们已经复活了."
L["necrodefi_error_failed"] = "复兴尝试失败了.请再试一次."
L["necrodefi_error_zombie"] = "你不能让僵尸复活."
L["necrodefi_error_player_alive"] = "你不能复活这个玩家,他们已经活着了."

L["tooltip_necro_revive_score"] = "死尸复活: {score}"
L["necro_revive_score"] = "死尸复活:"
L["title_event_necro_revive"] = "一个玩家变成了僵尸"
L["desc_event_necro_revive"] = "{necro}复活了{zombie}({zrole}/{zteam}),并将它们变成了僵尸."
