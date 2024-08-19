local L = LANG.GetLanguageTableReference("en")

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

L["tooltip_necro_revive_score"] = "Necro revival: {score}"
L["necro_revive_score"] = "Necro Revival:"
L["title_event_necro_revive"] = "A player became a zombie"
L["desc_event_necro_revive"] = "{necro} has revived {zombie} ({zrole} / {zteam}) and turned them into a zombie."

L["label_zomb_maxhealth_new_zomb"] = "Health for new zombies"
L["label_zomb_walkspeed"] = "Zombie walkspeed multiplier"

L["necro_corpse_player"] = "Corpse of {nick}"

L["necrodefi_error_zombie"] = "You can't revive a dead zombie."

L["header_equipment_necrodefi"] = "Additional Necro's Defi Settings"
L["label_necro_defibrillator_revive_zombies"] = "Allow defibrillating dead zombies"
