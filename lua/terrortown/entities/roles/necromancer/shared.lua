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
	-- Special Necromancer Radar, it only shows dead bodies
	ROLE.CustomRadar = function(ply)
		local targets = {}
		local scan_ents = ents.FindByClass("prop_ragdoll")
		local mathRound = math.Round

		for _, t in ipairs(scan_ents) do
			if not t.player_ragdoll then continue end

			local pos = t:LocalToWorld(t:OBBCenter())

			pos.x = mathRound(pos.x)
			pos.y = mathRound(pos.y)
			pos.z = mathRound(pos.z)

			targets[#targets + 1] = {
				subrole = -1,
				pos = pos
			}
		end

		return targets
	end

	ROLE.radarTime = 15

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
		ply:GiveEquipmentItem("item_ttt_radar")
	end

	-- Remove Loadout on death and rolechange
	function ROLE:RemoveRoleLoadout(ply, isRoleChange)
		ply:StripWeapon("weapon_ttth_necrodefi")
		ply:RemoveEquipmentItem("item_ttt_radar")
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
end
