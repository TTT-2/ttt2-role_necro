L = LANG.GetLanguageTableReference("es")

-- GENERAL ROLE LANGUAGE STRINGS
L[NECROMANCER.name] = "Nigromante"
L[NECROMANCER.defaultTeam] = "Equipo Nigromantes"
L["hilite_win_" .. NECROMANCER.defaultTeam] = "EL NIGROMANTE GANA"
L["win_" .. NECROMANCER.defaultTeam] = "¡El Nigromante ha ganado!"
L["info_popup_" .. NECROMANCER.name] = [[Has venido a traer la muerte a la vida. ¡Consigue muertos que se pongan de tu lado!]]
L["body_found_" .. NECROMANCER.abbr] = "¡Era un Nigromante!"
L["search_role_" .. NECROMANCER.abbr] = "Esta persona era un Nigromante."
L["ev_win_" .. NECROMANCER.defaultTeam] = "¡El Malvado Nigromante ha ganado esta ronda!"
L["target_" .. NECROMANCER.name] = "Nigromante"
L["ttt2_desc_" .. NECROMANCER.name] = [[El Nigromante necesita revivir muertos. Si un jugador es revivido, se verá como un muerto viviente (putrefacto) y morirá al quedarse sin munición.]]

L[ZOMBIE.name] = "Zombie"
L["target_" .. ZOMBIE.name] = "Zombie"
L["ttt2_desc_" .. ZOMBIE.name] = [[¡Debes ganar con tu Nigromante]]
L["body_found_" .. ZOMBIE.abbr] = "¡Era un Zombie!"
L["search_role_" .. ZOMBIE.abbr] = "Esta persona era un Zombie."

-- OTHER ROLE LANGUAGE STRINGS
L["necro_defi_name"] = "Desfribilador"
L["zombie_pistol_name"] = "Deagle Zombie"

L["revived_by_necromancer"] = "Estás siendo revivido por {name} como un Zombie ¡Prepárate!"
L["necrodefi_hold_key_to_revive"] = "Mantén [{key}] para revivir a un jugador como Zombie"
L["necrodefi_revive_progress"] = "Tiempo restante: {time}s"
L["necrodefi_charging"] = "El Desfribilador está recargándose, por favor espera"
L["necrodefi_player_already_reviving"] = "Este jugador ya está siendo revivido"
L["necrodefi_error_no_space"] = "No hay espacio suficiente en la habitación para revivir a esta persona."
L["necrodefi_error_too_fast"] = "El Desfribilador está recargándose, por favor espera."
L["necrodefi_error_lost_target"] = "Perdió de vista a su objetivo. Intenta de nuevo."
L["necrodefi_error_no_valid_ply"] = "No puedes revivir a este jugador ya que su cuerpo no existe o no es válido."
L["necrodefi_error_already_reviving"] = "No puedes revivir a este jugador porque ya lo están reviviendo."
L["necrodefi_error_failed"] = "Intento de revivir fallido. Intenta de nuevo."
L["necrodefi_error_zombie"] = "No puedes revivir a un Zombie."
--L["necrodefi_error_player_alive"] = "You can't revive this player, they are already alive."

--L["tooltip_necro_revive_score"] = "Necro revival: {score}"
--L["necro_revive_score"] = "Necro Revival:"
--L["title_event_necro_revive"] = "A player became a zombie"
--L["desc_event_necro_revive"] = "{necro} has revived {zombie} ({zrole} / {zteam}) and turned them into a zombie."
