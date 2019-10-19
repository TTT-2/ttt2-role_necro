if SERVER then
	AddCSLuaFile()
end

local maxhealth = CreateConVar("ttt2_zomb_maxhealth_new_zomb", 100, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

function ROLE:PreInitialize()
	self.color = Color(68, 28, 44, 255)
	self.dkcolor = Color(32, 3, 15, 255)
	self.bgcolor = Color(53, 72, 30, 255)

	self.abbr = "zomb"
	self.surviveBonus = 1
	self.scoreKillsMultiplier = 5
	self.scoreTeamKillsMultiplier = -16
	self.notSelectable = true
	self.preventFindCredits = true
	self.preventKillCredits = true
	self.preventTraitorAloneCredits = true

	self.defaultTeam = TEAM_NECROMANCER
	self.defaultEquipment = SPECIAL_EQUIPMENT
end

function ROLE:Initialize()
	roles.SetBaseRole(self, ROLE_NECROMANCER)

	if CLIENT then
		-- Role specific language elements
		LANG.AddToLanguage("English", ZOMBIE.name, "Zombie")
		LANG.AddToLanguage("English", "target_" .. ZOMBIE.name, "Zombie")
		LANG.AddToLanguage("English", "ttt2_desc_" .. ZOMBIE.name, [[You need to win with your mate!]])
		LANG.AddToLanguage("English", "body_found_" .. ZOMBIE.abbr, "They were a Zombie!")
		LANG.AddToLanguage("English", "search_role_" .. ZOMBIE.abbr, "This person was a Zombie!")

		LANG.AddToLanguage("Deutsch", ZOMBIE.name, "Zombie")
		LANG.AddToLanguage("Deutsch", "target_" .. ZOMBIE.name, "Zombie")
		LANG.AddToLanguage("Deutsch", "ttt2_desc_" .. ZOMBIE.name, [[Du musst mit deinem Mate gewinnen!]])
		LANG.AddToLanguage("Deutsch", "body_found_" .. ZOMBIE.abbr, "Er war ein Zombie...")
		LANG.AddToLanguage("Deutsch", "search_role_" .. ZOMBIE.abbr, "Diese Person war ein Zombie!")
	end
end


hook.Add("TTTUlxDynamicRCVars", "TTTUlxDynamicZombCVars", function(tbl)
	tbl[ROLE_ZOMBIE] = tbl[ROLE_ZOMBIE] or {}

	table.insert(tbl[ROLE_ZOMBIE], {cvar = "ttt2_zomb_maxhealth_new_zomb", slider = true, min = 10, max = 500, desc = "Max Health for all new Zombies (Def. 100)"})
end)

if SERVER then -- SERVER
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

	function AddZombie(target)
		target:StripWeapons()
		target:SetRole(ROLE_ZOMBIE)

		local name = "sound_idle_" .. target:EntIndex()

		timer.Create(name, 10, 1, function()
			StartZombieIdle(target, name)
		end)

		target:SetMaxHealth(maxhealth:GetInt()) -- just for new zombie

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

	-- default loadout is used if the player spawns
	hook.Add("TTT2ModifyDefaultLoadout", "ModifyZombLoadout", function(loadout_weapons, subrole)
		if subrole ~= ROLE_ZOMBIE then return end
		
		local tmp = {}

		for k, v in ipairs(loadout_weapons[subrole]) do
			if v == "weapon_zm_improvised" or v == "weapon_zm_carry" or v == "weapon_ttt_unarmed" then
				table.insert(tmp, 1, k)

				local tbl = weapons.GetStored(v)

				if tbl and tbl.InLoadoutFor then
					for k2, sr in ipairs(tbl.InLoadoutFor) do
						if sr == subrole then
							table.remove(tbl.InLoadoutFor, k2)

							break
						end
					end
				end
			end
		end

		for _, key in ipairs(tmp) do
			table.remove(loadout_weapons[subrole], key)
		end
	end)

	hook.Add("TTT2RolesLoaded", "AddZombPistolToDefaultLoadout", function()
		local wep = weapons.GetStored("weapon_ttth_zombpistol")
		if not wep then return end
		
		wep.InLoadoutFor = wep.InLoadoutFor or {}

		if table.HasValue(wep.InLoadoutFor, ROLE_ZOMBIE) then return end
		
		table.insert(wep.InLoadoutFor, ROLE_ZOMBIE)
	end)

	hook.Add("TTTPlayerSpeedModifier", "ZombModifySpeed", function(ply, _, _, noLag)
		if not IsValid(ply) or ply:GetSubRole() ~= ROLE_ZOMBIE then return end
		
		noLag[1] = noLag[1] * 0.5
	end)
end
