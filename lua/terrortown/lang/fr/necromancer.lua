local L = LANG.GetLanguageTableReference("fr")

-- GENERAL ROLE LANGUAGE STRINGS
L[NECROMANCER.name] = "Nécromancien"
L[NECROMANCER.defaultTeam] = "Team des Nécromanciens"
L["hilite_win_" .. NECROMANCER.defaultTeam] = "LA TEAM NÉCROMANCIENS A GAGNÉ"
L["win_" .. NECROMANCER.defaultTeam] = "Le Nécromancien a gagné!"
L["info_popup_" .. NECROMANCER.name] = [[Maintenant, c'est à votre tour! Essayez de faire combattre des joueurs morts à vos côtés!]]
L["body_found_" .. NECROMANCER.abbr] = "C'était un Nécromancien!"
L["search_role_" .. NECROMANCER.abbr] = "C'était un Nécromancien!"
L["ev_win_" .. NECROMANCER.defaultTeam] = "Le méchant Nécromancien a gagné le round!"
L["target_" .. NECROMANCER.name] = "Nécromancien"
L["ttt2_desc_" .. NECROMANCER.name] = [[Le Nécromancien doit faire revivre les joueurs morts. Si un joueur est réanimé, il ressemble à un zombie et mourra si ses munitions sont vides.]]

L[ZOMBIE.name] = "Zombie"
L["target_" .. ZOMBIE.name] = "Zombie"
L["ttt2_desc_" .. ZOMBIE.name] = [[Vous devez gagner avec vos compagnon!]]
L["body_found_" .. ZOMBIE.abbr] = "C'était un Zombie!"
L["search_role_" .. ZOMBIE.abbr] = "C'était un Zombie!"

-- OTHER ROLE LANGUAGE STRINGS
L["necro_defi_name"] = "Défibrillateur du Nécromancien"
L["zombie_pistol_name"] = "Deagle du Zombie"

L["revived_by_necromancer"] = "Vous êtes réanimé par {name} vous devenez un Zombie du Nécromancien. Préparez-vous!"
L["necrodefi_hold_key_to_revive"] = "Maintenez [{key}] pour réanimer le joueur en tant que Zombie"
L["necrodefi_revive_progress"] = "Temps restant: {time}s"
L["necrodefi_charging"] = "Le défibrillateur est en train de se recharger, veuillez patienter"
L["necrodefi_player_already_reviving"] = "Ce joueur est déjà ressuscité"
L["necrodefi_error_no_space"] = "Il n'y a pas assez de place pour réanimer a cet endroit."
L["necrodefi_error_too_fast"] = "Le défibrillateur est en train de se recharger. Veuillez patienter."
L["necrodefi_error_lost_target"] = "Vous avez perdu votre cible. Veuillez réessayer."
L["necrodefi_error_no_valid_ply"] = "Vous ne pouvez pas réanimer ce joueur car son corps n'existe pas ou n'est plu valide."
L["necrodefi_error_already_reviving"] = "Vous ne pouvez pas réanimer ce joueur parce qu'il est déjà réanimé."
L["necrodefi_error_failed"] = "La tentative de réanimation a échoué. Veuillez réessayer."
L["necrodefi_error_zombie"] = "Vous ne pouvez pas faire revivre un zombie."
L["necrodefi_error_player_alive"] = "Vous ne pouvez pas réanimer ce joueur parce qu'il est déjà réanimé."

L["tooltip_necro_revive_score"] = "Réanimation du Nécro: {score}"
L["necro_revive_score"] = "Réanimation du Nécro:"
L["title_event_necro_revive"] = "Un joueur est devenue un zombie"
L["desc_event_necro_revive"] = "{necro} a réanimé {zombie} ({zrole} / {zteam}) et l'a transformé en zombie."
