local L = LANG.GetLanguageTableReference("ru")

-- GENERAL ROLE LANGUAGE STRINGS
L[NECROMANCER.name] = "Некромант"
L[NECROMANCER.defaultTeam] = "Команда некроманта"
L["hilite_win_" .. NECROMANCER.defaultTeam] = "ПОБЕДА НЕКРОМАНТА"
L["win_" .. NECROMANCER.defaultTeam] = "Некромант победил!"
L["info_popup_" .. NECROMANCER.name] = [[Теперь ваша очередь! Постарайтесь заставить нескольких мёртвых игроков сражаться на вашей стороне!]]
L["body_found_" .. NECROMANCER.abbr] = "Он был некромантом!"
L["search_role_" .. NECROMANCER.abbr] = "Этот человек был некромантом!"
L["ev_win_" .. NECROMANCER.defaultTeam] = "Злой некромант выиграл раунд!"
L["target_" .. NECROMANCER.name] = "Некромант"
L["ttt2_desc_" .. NECROMANCER.name] = [[Некроманту нужно возрождать мёртвых игроков. Если игрока возродят, он будет выглядеть как зомби и умрёт, если боеприпасы будут исчерпаны.]]

L[ZOMBIE.name] = "Зомби"
L["target_" .. ZOMBIE.name] = "Зомби"
L["ttt2_desc_" .. ZOMBIE.name] = [[Вам нужно победить со своими товарищами!]]
L["body_found_" .. ZOMBIE.abbr] = "Он был зомби!"
L["search_role_" .. ZOMBIE.abbr] = "Этот человек был зомби!"

-- OTHER ROLE LANGUAGE STRINGS
L["necro_defi_name"] = "Некродефибриллятор"
L["zombie_pistol_name"] = "Deagle зомби"

L["revived_by_necromancer"] = "{name} воскрешает вас как зомби некроманта. Приготовьтесь!"
L["necrodefi_hold_key_to_revive"] = "Удерживайте [{key}], чтобы возродить игрока как зомби."
L["necrodefi_revive_progress"] = "Времени до возрождения: {time} сек."
L["necrodefi_charging"] = "Дефибриллятор заряжается, подождите."
L["necrodefi_player_already_reviving"] = "Игрок уже возрождается."
L["necrodefi_error_no_space"] = "Недостаточно места для возрождения."
L["necrodefi_error_too_fast"] = "Дефибриллятор заряжается. Пожалуйста, подождите."
L["necrodefi_error_lost_target"] = "Цель потеряна. Повторите попытку."
L["necrodefi_error_no_valid_ply"] = "Этого игрока нельзя возродить, поскольку он недействителен."
L["necrodefi_error_already_reviving"] = "Этого игрока нельзя возродить, поскольку он уже возрождается."
L["necrodefi_error_failed"] = "Не удалось возродить. Повторите попытку."
L["necrodefi_error_zombie"] = "Вы не можете возродить зомби."
L["necrodefi_error_player_alive"] = "Этого игрока нельзя возродить, поскольку он уже живой."

L["tooltip_necro_revive_score"] = "Некровозрождение: {score}"
L["necro_revive_score"] = "Некровозрождение:"
L["title_event_necro_revive"] = "Игрок стал зомби"
L["desc_event_necro_revive"] = "{necro} возрождает {zombie} ({zrole} / {zteam}) и превращает в зомби."

--L["label_necrodefi_ammo"] = "Defi ammo multiplier"
--L["label_necrodefi_revive_time"] = "Defi revival time"
--L["label_necrodefi_error_time"] = "Defi recharging time"
--L["label_zomb_maxhealth_new_zomb"] = "Health for new zombies"
--L["label_zomb_walkspeed"] = "Zombie walkspeed multiplier"

--L["necro_corpse_player"] = "Corpse of {nick}"
