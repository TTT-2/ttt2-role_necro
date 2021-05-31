L = LANG.GetLanguageTableReference("ru")

-- GENERAL ROLE LANGUAGE STRINGS
L[NECROMANCER.name] = "Некромант"
L[NECROMANCER.defaultTeam] = "Команда некромантов"
L["hilite_win_" .. NECROMANCER.defaultTeam] = "ПОБЕДА НЕКРОМАНТОВ"
L["win_" .. NECROMANCER.defaultTeam] = "Некромант победил!"
L["info_popup_" .. NECROMANCER.name] = [[Теперь твоя очередь! Попытайтесь заставить некоторых мёртвых игроков сражаться на вашей стороне!]]
L["body_found_" .. NECROMANCER.abbr] = "Он был некромантом!"
L["search_role_" .. NECROMANCER.abbr] = "Этот человек был некромантом!"
L["ev_win_" .. NECROMANCER.defaultTeam] = "Злой некромант выиграл раунд!"
L["target_" .. NECROMANCER.name] = "Некромант"
L["ttt2_desc_" .. NECROMANCER.name] = [[Некроманту нужно оживлять мёртвых игроков. Если игрока оживят, он будет выглядеть как зомби и умрёт, если боеприпасы будут исчерпаны.]]

L[ZOMBIE.name] = "Зомби"
L["target_" .. ZOMBIE.name] = "Зомби"
L["ttt2_desc_" .. ZOMBIE.name] = [[Вам нужно победить со своим другом!]]
L["body_found_" .. ZOMBIE.abbr] = "Он был зомби!"
L["search_role_" .. ZOMBIE.abbr] = "Этот человек был зомби!"

-- OTHER ROLE LANGUAGE STRINGS
L["necro_defi_name"] = "Некро-дефи"
L["zombie_pistol_name"] = "Deagle зомби"

L["revived_by_necromancer"] = "{name} воскрешает вас как зомби-некроманта. Приготовься!"
L["necrodefi_hold_key_to_revive"] = "Удерживайте [{key}], чтобы оживить игрока как зомби"
L["necrodefi_revive_progress"] = "Осталось времени: {time}с"
L["necrodefi_charging"] = "Дефибриллятор заряжается, подождите."
L["necrodefi_player_already_reviving"] = "Игрок уже оживает"
L["necrodefi_error_no_space"] = "Недостаточно места для этой попытки возрождения."
L["necrodefi_error_too_fast"] = "Дефибриллятор заряжается. Пожалуйста, подождите."
L["necrodefi_error_lost_target"] = "Вы потеряли свою цель. Пожалуйста, попробуйте ещё раз."
L["necrodefi_error_no_valid_ply"] = "Вы не можете оживить этого игрока, так как он больше не действителен."
L["necrodefi_error_already_reviving"] = "Вы не можете оживить этого игрока, так как он уже оживает."
L["necrodefi_error_failed"] = "Попытка возрождения не удалась. Пожалуйста, попробуйте ещё раз."
L["necrodefi_error_zombie"] = "Вы не можете оживить зомби."
--L["necrodefi_error_player_alive"] = "You can't revive this player, they are already alive."

--L["tooltip_necro_revive_score"] = "Necro revival: {score}"
--L["necro_revive_score"] = "Necro Revival:"
--L["title_event_necro_revive"] = "A player became a zombie"
--L["desc_event_necro_revive"] = "{necro} has revived {zombie} ({zrole} / {zteam}) and turned them into a zombie."
