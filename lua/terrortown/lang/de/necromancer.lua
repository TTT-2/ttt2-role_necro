local L = LANG.GetLanguageTableReference("de")

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

L["tooltip_necro_revive_score"] = "Geisterbeschwörung: {score}"
L["necro_revive_score"] = "Geisterbeschwörung:"
L["title_event_necro_revive"] = "Ein Spieler wurde zu einem Zombie"
L["desc_event_necro_revive"] = "{necro} hat {zombie} ({zrole} / {zteam}) wiederbelebt und ihn dabei zu einem Zombie gemacht."

L["label_zomb_maxhealth_new_zomb"] = "Gesundheit für neue Zombies"
L["label_zomb_walkspeed"] = "Zombie-Gehen Geschwindigkeitsmultiplikator"

L["marker_corpse_player"] = "Leiche von {nick}"
