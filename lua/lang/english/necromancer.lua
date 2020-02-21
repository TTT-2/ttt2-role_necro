L = LANG.GetLanguageTableReference("english")

-- GENERAL ROLE LANGUAGE STRINGS
L[NECROMANCER.name] = "Necromancer"
L[NECROMANCER.defaultTeam] = "TEAM Necromancers"
L["hilite_win_" .. NECROMANCER.defaultTeam] = "THE NECRO WON"
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
