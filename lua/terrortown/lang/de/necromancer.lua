L = LANG.GetLanguageTableReference("de")

-- GENERAL ROLE LANGUAGE STRINGS
L[NECROMANCER.name] = "Geisterbeschwörer"
L[NECROMANCER.defaultTeam] = "Team Geisterbeschwörer"
L["hilite_win_" .. NECROMANCER.defaultTeam] = "TEAM GEISTERBESCHWÖRER GEWANN"
L["win_" .. NECROMANCER.defaultTeam] = "Der Geisterbeschwörer hat gewonnen!"
L["info_popup_" .. NECROMANCER.name] = [[Jetzt bist du dran! Versuche, einige tote Spieler auf deine Seite zu ziehen!]]
L["body_found_" .. NECROMANCER.abbr] = "Er war ein Geisterbeschwörer..."
L["search_role_" .. NECROMANCER.abbr] = "Diese Person war ein Geisterbeschwörer!"
L["ev_win_" .. NECROMANCER.defaultTeam] = "Der böse Geisterbeschwörer hat die Runde gewonnen!"
L["target_" .. NECROMANCER.name] = "Geisterbeschwörer"
L["ttt2_desc_" .. NECROMANCER.name] = [[Der Geisterbeschwörer muss tote Spieler wiederbeleben, um zu gewinnen. Wird ein Spieler wiederbelebt, wird er wie ein Zombie aussehen und sterben, sobald seine Munition leer ist.]]

L[ZOMBIE.name] = "Zombie"
L["target_" .. ZOMBIE.name] = "Zombie"
L["ttt2_desc_" .. ZOMBIE.name] = [[Du musst mit deinem Kollegen gewinnen!]]
L["body_found_" .. ZOMBIE.abbr] = "Er war ein Zombie..."
L["search_role_" .. ZOMBIE.abbr] = "Diese Person war ein Zombie!"

-- OTHER ROLE LANGUAGE STRINGS
L["necro_defi_name"] = "Geisterbeschwörer Defi"
L["zombie_pistol_name"] = "Zombie Deagle"

L["revived_by_necromancer"] = "Du wirst von {name} als ein Geisterbeschwörer Zombie wiederbelebt. Halte dich bereit!"
L["necrodefi_hold_key_to_revive"] = "Halte [{key}] um Spieler als Zombie wiederzubeleben"
L["necrodefi_revive_progress"] = "Zeit übrig: {time}s"
L["necrodefi_charging"] = "Defibrillator lädt sich auf, bitte warten"
L["necrodefi_player_already_reviving"] = "Dieser Spieler wird bereits wiederbelebt"
L["necrodefi_error_no_space"] = "Es ist nicht genügend Platz vorhanden um den Spieler wiederzubeleben."
L["necrodefi_error_too_fast"] = "Defibrillator lädt sich auf. Bitte warten."
L["necrodefi_error_lost_target"] = "Du hast dein Ziel verloren. Bitte versuche es erneut."
L["necrodefi_error_no_valid_ply"] = "Du kannst diesen Spieler nicht wiederbeleben, da er nicht länger valide ist."
L["necrodefi_error_already_reviving"] = "Du kannst diesen Spieler nicht wiederbeleben, da er bereits wiederbelebt wird."
L["necrodefi_error_failed"] = "Wiederbeleben fehlgeschlagen. Bitte versuche es erneut."
L["necrodefi_error_zombie"] = "Du kannst kein Zombie wiederbeleben."
L["necrodefi_error_player_alive"] = "Du kannst diesen Spieler nicht wiederbeleben, da er bereits lebt."

L["tooltip_necro_revive_score"] = "Geisterbeschwörung: {score}"
L["necro_revive_score"] = "Geisterbeschwörung:"
L["title_event_necro_revive"] = "Ein Spieler wurde zu einem Zombie"
L["desc_event_necro_revive"] = "{necro} hat {zombie} ({zrole} / {zteam}) wiederbelebt und ihn dabei zu einem Zombie gemacht."
