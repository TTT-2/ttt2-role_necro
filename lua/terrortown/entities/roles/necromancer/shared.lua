if SERVER then
    AddCSLuaFile()
end

roles.InitCustomTeam(ROLE.name, {
    icon = "vgui/ttt/dynamic/roles/icon_necro",
    color = Color(131, 55, 85, 255),
})

function ROLE:PreInitialize()
    self.color = Color(131, 55, 85, 255)

    self.abbr = "necro"
    self.defaultEquipment = SPECIAL_EQUIPMENT
    self.score.surviveBonusMultiplier = 0.2
    self.score.timelimitMultiplier = -0.5
    self.score.killsMultiplier = 2
    self.score.teamKillsMultiplier = -4
    self.score.bodyFoundMuliplier = 0

    self.defaultTeam = TEAM_NECROMANCER
    self.defaultEquipment = SPECIAL_EQUIPMENT

    self.isOmniscientRole = true

    self.conVarData = {
        pct = 0.15,
        maximum = 1,
        minPlayers = 7,
        random = 40,
        togglable = true,
        credits = 2,
        creditsAwardDeadEnable = 1,
        creditsAwardKillEnable = 1,
        shopFallback = SHOP_FALLBACK_TRAITOR,
    }
end

if SERVER then
    hook.Add("TTTOnCorpseCreated", "NecroAddedDeadBody", function(rag, ply)
        if not IsValid(rag) or not IsValid(ply) then
            return
        end

        local mvObject = rag:AddMarkerVision("corpse_necro")
        mvObject:SetOwner(ROLE_NECROMANCER)
        mvObject:SetVisibleFor(VISIBLE_FOR_ROLE)
        mvObject:SyncToClients()
    end)

    hook.Add("EntityRemoved", "NecroRemovedDeadBody", function(ent)
        if not IsValid(ent) or ent:GetClass() ~= "prop_ragdoll" then
            return
        end

        ent:RemoveMarkerVision("corpse_necro")
    end)

    -- modify roles table of rolesetup addon
    hook.Add("TTTAModifyRolesTable", "ModifyRoleNecroToInno", function(rolesTable)
        local necromancers = rolesTable[ROLE_NECROMANCER]

        if not necromancers then
            return
        end

        rolesTable[ROLE_INNOCENT] = rolesTable[ROLE_INNOCENT] + necromancers
        rolesTable[ROLE_NECROMANCER] = 0
    end)

    -- Give Loadout on respawn and rolechange
    function ROLE:GiveRoleLoadout(ply, isRoleChange)
        ply:GiveEquipmentWeapon("weapon_ttth_necrodefi")
    end

    -- Remove Loadout on death and rolechange
    function ROLE:RemoveRoleLoadout(ply, isRoleChange)
        ply:StripWeapon("weapon_ttth_necrodefi")
    end

    -- make sure that jackal and necro can not spawn together
    hook.Add("TTT2ModifySelectableRoles", "TTTHJackOrNecro", function(selectableRoles)
        if not selectableRoles[NECROMANCER] or not selectableRoles[JACKAL] then
            return
        end

        if math.random(2) == 2 then
            selectableRoles[NECROMANCER] = nil
        else
            selectableRoles[JACKAL] = nil
        end
    end)
end

if CLIENT then
    local TryT = LANG.TryTranslation
    local ParT = LANG.GetParamTranslation

    local materialCorpse = Material("vgui/ttt/tid/tid_big_corpse")

    hook.Add("TTT2RenderMarkerVisionInfo", "HUDDrawMarkerVisionNecroCorpse", function(mvData)
        local client = LocalPlayer()
        local ent = mvData:GetEntity()
        local mvObject = mvData:GetMarkerVisionObject()

        if not client:IsTerror() or not mvObject:IsObjectFor(ent, "corpse_necro") then
            return
        end

        local distance = math.Round(util.HammerUnitsToMeters(mvData:GetEntityDistance()), 1)

        mvData:EnableText()

        mvData:AddIcon(materialCorpse)
        mvData:SetTitle(ParT("necro_corpse_player", { nick = CORPSE.GetPlayerNick(ent, "---") }))

        mvData:AddDescriptionLine(ParT("marker_vision_distance", { distance = distance }))
        mvData:AddDescriptionLine(TryT(mvObject:GetVisibleForTranslationKey()), COLOR_SLATEGRAY)
    end)
end
