if SERVER then
	AddCSLuaFile()
end

-- CREATE CONVARS
local defi_ammo = CreateConVar("ttt2_necrodefi_ammo", 0.34, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("ttt2_necrodefi_revive_time", 3.0, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("ttt2_necrodefi_error_time", 1.5, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

-- SYNC CONVARS <> GLOBAL VARS
if SERVER then
	hook.Add("TTT2SyncGlobals", "TTT2NecroSyncGlobals", function()
		SetGlobalFloat(defi_ammo:GetName(), defi_ammo:GetFloat())
	end)

	cvars.AddChangeCallback(defi_ammo:GetName(), function(name, old, new)
		SetGlobalFloat(defi_ammo:GetName(), tonumber(new) == 1)
	end, defi_ammo:GetName())
end

roles.InitCustomTeam(ROLE.name, {
	icon = "vgui/ttt/dynamic/roles/icon_necro",
	color = Color(131, 55, 85, 255)
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
		shopFallback = SHOP_FALLBACK_TRAITOR
	}
end

if SERVER then
	hook.Add("TTTOnCorpseCreated", "NecroAddedDeadBody", function(rag, ply)
		if not IsValid(rag) or not IsValid(ply) then return end

		markerVision.RegisterEntity(rag, ROLE_NECROMANCER, VISIBLE_FOR_ROLE)
	end)

	hook.Add("EntityRemoved", "NecroRemovedDeadBody", function(ent)
		if not IsValid(ent) or ent:GetClass() ~= "prop_ragdoll" then return end

		markerVision.RemoveEntity(ent)
	end)

	-- modify roles table of rolesetup addon
	hook.Add("TTTAModifyRolesTable", "ModifyRoleNecroToInno", function(rolesTable)
		local necromancers = rolesTable[ROLE_NECROMANCER]

		if not necromancers then return end

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
		if not selectableRoles[NECROMANCER] or not selectableRoles[JACKAL] then return end

		if math.random(2) == 2 then
			selectableRoles[NECROMANCER] = nil
		else
			selectableRoles[JACKAL] = nil
		end
	end)
end

if CLIENT then
	function ROLE:AddToSettingsMenu(parent)
		local form = vgui.CreateTTT2Form(parent, "header_roles_additional")

		form:MakeSlider({
			serverConvar = "ttt2_necrodefi_ammo",
			label = "label_necrodefi_ammo",
			min = 0,
			max = 5,
			decimal = 2
		})

		form:MakeSlider({
			serverConvar = "ttt2_necrodefi_revive_time",
			label = "label_necrodefi_revive_time",
			min = 0,
			max = 30,
			decimal = 1
		})

		form:MakeSlider({
			serverConvar = "ttt2_necrodefi_error_time",
			label = "label_necrodefi_error_time",
			min = 0,
			max = 30,
			decimal = 1
		})
	end

	local TryT = LANG.TryTranslation
	local ParT = LANG.GetParamTranslation

	local materialCorpse = Material("vgui/ttt/tid/tid_big_corpse")

	hook.Add("TTT2RenderMarkerVisionInfo", "HUDDrawMarkerVisionNecroCorpse", function(mvData)
		local client = LocalPlayer()
		local ent = mvData:GetEntity()

		if not client:IsTerror() or not IsValid(ent) or ent:GetClass() ~= "prop_ragdoll" then return end

		local distance = math.Round(util.HammerUnitsToMeters(mvData:GetEntityDistance()), 1)

		mvData:EnableText()

		mvData:AddIcon(materialCorpse)
		mvData:SetTitle(ParT("necro_corpse_player", {nick = CORPSE.GetPlayerNick(ent, "---")}))

		mvData:AddDescriptionLine(ParT("marker_vision_distance", {distance = distance}))
		mvData:AddDescriptionLine(TryT("marker_vision_visible_for_" .. markerVision.GetVisibleFor(ent)), COLOR_SLATEGRAY)
	end)
end
