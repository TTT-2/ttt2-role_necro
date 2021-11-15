if SERVER then
	AddCSLuaFile()
end

-- CREATE CONVARS
local maxhealth = CreateConVar("ttt2_zomb_maxhealth_new_zomb", 100, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
local walkspeed = CreateConVar("ttt2_zomb_walkspeed", 0.5, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

-- SYNC CONVARS <> GLOBAL VARS
if SERVER then
	hook.Add("TTT2SyncGlobals", "TTT2ZombieSyncGlobals", function()
		SetGlobalFloat(walkspeed:GetName(), walkspeed:GetFloat())
	end)

	cvars.AddChangeCallback(walkspeed:GetName(), function(name, old, new)
		SetGlobalFloat(walkspeed:GetName(), tonumber(new) == 1)
	end, walkspeed:GetName())
end

function ROLE:PreInitialize()
	self.color = Color(68, 28, 44, 255)

	self.abbr = "zomb"
	self.score.surviveBonusMultiplier = 0.2
	self.score.timelimitMultiplier = -0.5
	self.score.killsMultiplier = 2
	self.score.teamKillsMultiplier = -4
	self.score.bodyFoundMuliplier = 0

	self.notSelectable = true
	self.preventFindCredits = true

	self.defaultTeam = TEAM_NECROMANCER
	self.defaultEquipment = SPECIAL_EQUIPMENT

	self.isOmniscientRole = true
end

function ROLE:Initialize()
	roles.SetBaseRole(self, ROLE_NECROMANCER)
end

hook.Add("TTTUlxDynamicRCVars", "TTTUlxDynamicZombCVars", function(tbl)
	tbl[ROLE_ZOMBIE] = tbl[ROLE_ZOMBIE] or {}

	table.insert(tbl[ROLE_ZOMBIE], {cvar = "ttt2_zomb_maxhealth_new_zomb", slider = true, min = 10, max = 500, desc = "Health for new zombies (Def. 100)"})
	table.insert(tbl[ROLE_ZOMBIE], {cvar = "ttt2_zomb_walkspeed", slider = true, min = 0, max = 5, decimal = 2, desc = "Zombie walkspeed multplier (Def. 0.5)"})
end)

if SERVER then
	-- Give Loadout on respawn and rolechange
	function ROLE:GiveRoleLoadout(ply, isRoleChange)
		-- remove normal player loadout
		ply:StripWeapon("weapon_zm_improvised")
		ply:StripWeapon("weapon_zm_carry")
		ply:StripWeapon("weapon_ttt_unarmed")

		-- give zombie deagle
		ply:GiveEquipmentWeapon("weapon_ttth_zombpistol")
	end

	-- Remove Loadout on death and rolechange
	function ROLE:RemoveRoleLoadout(ply, isRoleChange)
		-- give back normal player loadout
		ply:GiveEquipmentWeapon("weapon_zm_improvised")
		ply:GiveEquipmentWeapon("weapon_zm_carry")
		ply:GiveEquipmentWeapon("weapon_ttt_unarmed")

		-- remove zombie deagle
		ply:StripWeapon("weapon_ttth_zombpistol")
	end

	zombie_sound_idles = {
		"npc/zombie/zombie_voice_idle1.wav",
		"npc/zombie/zombie_voice_idle2.wav",
		"npc/zombie/zombie_voice_idle3.wav",
		"npc/zombie/zombie_voice_idle4.wav",
		"npc/zombie/zombie_voice_idle5.wav",
		"npc/zombie/zombie_voice_idle6.wav",
		"npc/zombie/zombie_voice_idle7.wav",
		"npc/zombie/zombie_voice_idle8.wav",
		"npc/zombie/zombie_voice_idle9.wav",
		"npc/zombie/zombie_voice_idle10.wav",
		"npc/zombie/zombie_voice_idle11.wav",
		"npc/zombie/zombie_voice_idle12.wav",
		"npc/zombie/zombie_voice_idle13.wav",
		"npc/zombie/zombie_voice_idle14.wav"
	}

	local zombie_sound_idles_len = #zombie_sound_idles

	local minDelay, maxDelay = 5, 25

	local function CanIdle(ply)
		return IsValid(ply) and ply:IsPlayer() and ply:IsActive() and ply:GetSubRole() == ROLE_ZOMBIE and (not ply.IsGhost or not ply:IsGhost())
	end

	function StartZombieIdle(target, name, startDelay)
		startDelay = startDelay or 0

		if timer.Exists(name) then
			timer.Stop(name)
			timer.Remove(name)
		end

		if not CanIdle(target) then return end

		timer.Create(name, math.random(minDelay, maxDelay) + startDelay, 1, function()
			if not CanIdle(target) then return end

			target:EmitSound(zombie_sound_idles[math.random(zombie_sound_idles_len)], SNDLVL_90dB, 100, 1, CHAN_VOICE)

			StartZombieIdle(target, name)
		end)
	end

	function AddZombie(target, necro)
		events.Trigger(EVENT_NECRO_REVIVE, necro, target)

		target:SetRole(ROLE_ZOMBIE, necro:GetTeam())

		local name = "sound_idle_" .. target:EntIndex()

		timer.Create(name, 10, 1, function()
			StartZombieIdle(target, name)
		end)

		target:SetMaxHealth(maxhealth:GetInt())
		target:SetHealth(maxhealth:GetInt())
		target:ResetConfirmPlayer()

		target.zombieMaster = necro

		SendFullStateUpdate()
	end

	function StopZombieIdle(ply)
		local str = "sound_idle_" .. ply:EntIndex()

		if timer.Exists(str) then
			timer.Stop(str)
			timer.Remove(str)
		end
	end

	hook.Add("TTT2UpdateSubrole", "UpdateZombRoleSelect", function(ply, oldSubrole, newSubrole)
		if newSubrole == ROLE_ZOMBIE then
			ply:SetSubRoleModel("models/player/corpse1.mdl")
		elseif oldSubrole == ROLE_ZOMBIE then
			ply:SetSubRoleModel(nil)
		end
	end)

	hook.Add("PlayerCanPickupWeapon", "ZombModifyPickupWeapon", function(ply, wep)
		if not IsValid(wep) or not IsValid(ply)
		or ply:GetSubRole() ~= ROLE_ZOMBIE
		or ply:IsSpec() and ply.IsGhost and ply:IsGhost() then
			return
		end

		if WEPS.GetClass(wep) ~= "weapon_ttth_zombpistol" then
			return false
		end
	end)

	hook.Add("TTTEndRound", "ZombEndRound", function()
		for _, v in ipairs(player.GetAll()) do
			v:SetMaxHealth(100) -- reset

			StopZombieIdle(v)
		end
	end)

	-- tttc support
	hook.Add("TTTCClassDropNotPickupable", "ZombiePickupClassDrop", function(ply)
		if IsValid(ply) and ply:IsActive() and ply:GetSubRole() == ROLE_ZOMBIE then
			return true
		end
	end)
end

-- walk speed change has to be run on client and server
hook.Add("TTTPlayerSpeedModifier", "ZombModifySpeed", function(ply, _, _, noLag)
	if not IsValid(ply) or ply:GetSubRole() ~= ROLE_ZOMBIE then return end

	noLag[1] = noLag[1] * GetGlobalFloat(walkspeed:GetName(), 0.5)
end)
