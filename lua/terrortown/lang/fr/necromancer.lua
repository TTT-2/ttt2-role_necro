local L = LANG.GetLanguageTableReference("fr")

-- GENERAL ROLE LANGUAGE STRINGS
L[NECROMANCER.name] = "Nécromancien"
L[NECROMANCER.defaultTeam] = "Équipe des Nécromanciens"
L["hilite_win_" .. NECROMANCER.defaultTeam] = "LES NÉCROMANCIENS ONT GAGNÉ"
L["win_" .. NECROMANCER.defaultTeam] = "Les Nécromancien ont gagné !"
L["info_popup_" .. NECROMANCER.name] = [[Maintenant, c'est à votre tour ! Essayez de faire combattre des joueurs morts à vos côtés !]]
L["body_found_" .. NECROMANCER.abbr] = "C'était un Nécromancien !"
L["search_role_" .. NECROMANCER.abbr] = "C'était un Nécromancien !"
L["ev_win_" .. NECROMANCER.defaultTeam] = "Les méchants Nécromanciens ont gagné la partie !"
L["target_" .. NECROMANCER.name] = "Nécromancien"
L["ttt2_desc_" .. NECROMANCER.name] = [[Le Nécromancien doit faire revivre les joueurs morts. Si un joueur est réanimé, il devient un zombie et mourra si ses munitions sont vides.]]

L[ZOMBIE.name] = "Zombie"
L["target_" .. ZOMBIE.name] = "Zombie"
L["ttt2_desc_" .. ZOMBIE.name] = [[Vous devez gagner avec vos compagnon!]]
L["body_found_" .. ZOMBIE.abbr] = "C'était un Zombie!"
L["search_role_" .. ZOMBIE.abbr] = "C'était un Zombie!"

-- OTHER ROLE LANGUAGE STRINGS
L["necro_defi_name"] = "Défibrillateur du Nécromancien"
L["zombie_pistol_name"] = "Deagle du Zombie"

L["revived_by_necromancer"] = "Vous êtes réanimé par {name} vous devenez un Zombie du Nécromancien. Préparez-vous!"

L["tooltip_necro_revive_score"] = "Réanimation du Nécro: {score}"
L["necro_revive_score"] = "Réanimation du Nécro:"
L["title_event_necro_revive"] = "Un joueur est devenue un zombie"
L["desc_event_necro_revive"] = "{necro} a réanimé {zombie} ({zrole} / {zteam}) et l'a transformé en zombie."

L["label_zomb_walkspeed"] = "Vitesse de déplacement des zombies"

L["necro_corpse_player"] = "Corps de {nick}"
