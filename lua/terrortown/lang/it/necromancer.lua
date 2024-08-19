local L = LANG.GetLanguageTableReference("it")

-- GENERAL ROLE LANGUAGE STRINGS
L[NECROMANCER.name] = "Negromante"
L[NECROMANCER.defaultTeam] = "Team Negromanti"
L["hilite_win_" .. NECROMANCER.defaultTeam] = "I NEGROMANTI VINCONO"
L["win_" .. NECROMANCER.defaultTeam] = "I Negromanti hanno vinto!"
L["info_popup_" .. NECROMANCER.name] = [[Ora tocca a te! Prova a prendere qualche giocatore morto per farlo combattere dal tuo lato!]]
L["body_found_" .. NECROMANCER.abbr] = "Lui era un Negromante!"
L["search_role_" .. NECROMANCER.abbr] = "Questa persona era un Negromante!"
L["ev_win_" .. NECROMANCER.defaultTeam] = "I malvagi Negromanti hanno vinto il round!"
L["target_" .. NECROMANCER.name] = "Negromante"
L["ttt2_desc_" .. NECROMANCER.name] = [[Il Negromante ha bisogno di rianimare un giocatore morto. Se il giocatore viene rianimato, il giocatore nascerà come zombie e perderà la vita se finirà i colpi.]]

L[ZOMBIE.name] = "Zombie"
L["target_" .. ZOMBIE.name] = "Zombie"
L["ttt2_desc_" .. ZOMBIE.name] = [[Devi vincere con il Negromante e gli altri Zombie!]]
L["body_found_" .. ZOMBIE.abbr] = "Lui era uno Zombie!"
L["search_role_" .. ZOMBIE.abbr] = "Questa persona era uno Zombie!"

-- OTHER ROLE LANGUAGE STRINGS
L["necro_defi_name"] = "Def. Negromante"
L["zombie_pistol_name"] = "Zombie Deagle"

L["revived_by_necromancer"] = "Sei stato rianimato da {name} come Zombie del Negromante. Preparati!"

--L["tooltip_necro_revive_score"] = "Necro revival: {score}"
--L["necro_revive_score"] = "Necro Revival:"
--L["title_event_necro_revive"] = "A player became a zombie"
--L["desc_event_necro_revive"] = "{necro} has revived {zombie} ({zrole} / {zteam}) and turned them into a zombie."

--L["label_zomb_walkspeed"] = "Zombie walkspeed multiplier"

--L["necro_corpse_player"] = "Corpse of {nick}"
