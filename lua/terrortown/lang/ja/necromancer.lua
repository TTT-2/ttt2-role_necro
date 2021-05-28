L = LANG.GetLanguageTableReference("ja")

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
L["necrodefi_hold_key_to_revive"] = "[{key}]長押しでZombieとして蘇生する"
L["necrodefi_revive_progress"] = "蘇生まで:{time}秒"
L["necrodefi_charging"] = "除細動器はチャージ中だ。少し待とう。"
L["necrodefi_player_already_reviving"] = "プレイヤーは既に蘇生されているぞ。"
L["necrodefi_error_no_space"] = "こんな狭い所じゃあ蘇生できないな。"
L["necrodefi_error_too_fast"] = "除細動器は長押ししなきゃあ蘇生できないぞ。"
L["necrodefi_error_lost_target"] = "ターゲットが外れてしまった。もう一度だ。"
L["necrodefi_error_no_valid_ply"] = "こいつはこのサーバーにいないのか、蘇生ができないようだ。"
L["necrodefi_error_already_reviving"] = "一回蘇生された者は蘇生することはできないようだ。"
L["necrodefi_error_failed"] = "蘇生が中断された。もう一度だ。"
L["necrodefi_error_zombie"] = "Zombieを蘇生することはできないようだ。"
-- L["necrodefi_error_player_alive"] = "You can't revive this player, they are already alive."

--L["tooltip_necro_revive_score"] = "Necro revival: {score}"
--L["necro_revive_score"] = "Necro Revival:"
--L["title_event_necro_revive"] = "A player became a zombie"
--L["desc_event_necro_revive"] = "{necro} has revived {zombie} ({zrole} / {zteam}) and turned them into a zombie."
