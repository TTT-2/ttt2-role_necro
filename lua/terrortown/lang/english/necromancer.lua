L = LANG.GetLanguageTableReference("en")

-- GENERAL ROLE LANGUAGE STRINGS
L[NECROMANCER.name] = "Necromancer"
L[NECROMANCER.defaultTeam] = "Team Necromancer"
L["hilite_win_" .. NECROMANCER.defaultTeam] = "TEAM NECROMANCER WON"
L["win_" .. NECROMANCER.defaultTeam] = "The Necromancer has won!"
L["info_popup_" .. NECROMANCER.name] = [[Now it's your turn! Try to get some dead players to fight on your side!]]
L["body_found_" .. NECROMANCER.abbr] = "They were a Necromancer!"
L["search_role_" .. NECROMANCER.abbr] = "This person was a Necromancer!"
L["ev_win_" .. NECROMANCER.defaultTeam] = "The evil Necromancer won the round!"
L["target_" .. NECROMANCER.name] = "Necromancer"
L["ttt2_desc_" .. NECROMANCER.name] = [[The Necromancer needs to revive dead players. If a player gets revived, the player looks like a zombie and will die if the ammo is empty.]]

L[ZOMBIE.name] = "Zombie"
L["target_" .. ZOMBIE.name] = "Zombie"
L["ttt2_desc_" .. ZOMBIE.name] = [[You need to win with your mate!]]
L["body_found_" .. ZOMBIE.abbr] = "They were a Zombie!"
L["search_role_" .. ZOMBIE.abbr] = "This person was a Zombie!"

-- OTHER ROLE LANGUAGE STRINGS
L["necro_defi_name"] = "Necro's Defi"
L["zombie_pistol_name"] = "Zombie Deagle"

L["revived_by_necromancer"] = "You are revived by {name} as a necromancer zombie. Prepare yourself!"
L["necrodefi_hold_key_to_revive"] = "Hold [{key}] to revive player as a zombie"
L["necrodefi_revive_progress"] = "Time left: {time}s"
L["necrodefi_charging"] = "Defibrillator is recharging, please wait"
L["necrodefi_player_already_reviving"] = "Player is already reviving"
L["necrodefi_error_no_space"] = "There is insufficient room available for this revival attempt."
L["necrodefi_error_too_fast"] = "Defibrillator is recharging. Please wait."
L["necrodefi_error_lost_target"] = "You lost your target. Please try again."
L["necrodefi_error_no_valid_ply"] = "You can't revive this player since they are no longer valid."
L["necrodefi_error_already_reviving"] = "You can't revive this player since they are already reviving."
L["necrodefi_error_failed"] = "Revival attempt failed. Please try again."
L["necrodefi_error_zombie"] = "You can't revive a zombie."

L["tooltip_necro_revive_score"] = "Necro revival: {score}"
L["necro_revive_score"] = "Necro Revival:"
L["title_event_necro_revive"] = "A player became a zombie"
L["desc_event_necro_revive"] = "{necro} has revived {zombie} ({zrole} / {zteam}) and turned them into a zombie."
