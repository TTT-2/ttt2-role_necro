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

L["tooltip_necro_revive_score"] = "Некровозрождение: {score}"
L["necro_revive_score"] = "Некровозрождение:"
L["title_event_necro_revive"] = "Игрок стал зомби"
L["desc_event_necro_revive"] = "{necro} возрождает {zombie} ({zrole} / {zteam}) и превращает в зомби."

--L["label_zomb_walkspeed"] = "Zombie walkspeed multiplier"

--L["necro_corpse_player"] = "Corpse of {nick}"
