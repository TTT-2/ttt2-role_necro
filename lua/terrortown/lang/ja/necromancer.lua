local L = LANG.GetLanguageTableReference("ja")

-- GENERAL ROLE LANGUAGE STRINGS
L[NECROMANCER.name] = "Necromancer"
L[NECROMANCER.defaultTeam] = "Necromancer陣営"
L["hilite_win_" .. NECROMANCER.defaultTeam] = "Necromancerの勝利"
L["win_" .. NECROMANCER.defaultTeam] = "Necromancerの勝利だ！"
L["info_popup_" .. NECROMANCER.name] = [[さあ出番だ！死者を蘇らせて味方につけよう！]]
L["body_found_" .. NECROMANCER.abbr] = "奴はNecromancerだったな！"
L["search_role_" .. NECROMANCER.abbr] = "こいつはNecromancerだったな！"
L["ev_win_" .. NECROMANCER.defaultTeam] = "死体好みのNecromancerが勝利した！"
L["target_" .. NECROMANCER.name] = "Necromancer"
L["ttt2_desc_" .. NECROMANCER.name] = [[Necromancerは死者を蘇生することができる。蘇生されたら、その死者はゾンビのようになり、所持するZombie Deagleの弾が尽く、または死ぬまで戦ってくれる。]]

L[ZOMBIE.name] = "Zombie"
L["target_" .. ZOMBIE.name] = "Zombie"
L["ttt2_desc_" .. ZOMBIE.name] = [[主人を守り、勝利へ導こう！]]
L["body_found_" .. ZOMBIE.abbr] = "奴はZombieだったな！"
L["search_role_" .. ZOMBIE.abbr] = "こいつはZombieだったな！"

-- OTHER ROLE LANGUAGE STRINGS
L["necro_defi_name"] = "Necro's Defi"
L["zombie_pistol_name"] = "Zombie Deagle"

L["revived_by_necromancer"] = "{name}によってZombieとして蘇生中...戦いの準備を！"

--L["tooltip_necro_revive_score"] = "Necro revival: {score}"
--L["necro_revive_score"] = "Necro Revival:"
--L["title_event_necro_revive"] = "A player became a zombie"
--L["desc_event_necro_revive"] = "{necro} has revived {zombie} ({zrole} / {zteam}) and turned them into a zombie."

--L["label_zomb_maxhealth_new_zomb"] = "Health for new zombies"
--L["label_zomb_walkspeed"] = "Zombie walkspeed multiplier"

--L["necro_corpse_player"] = "Corpse of {nick}"
