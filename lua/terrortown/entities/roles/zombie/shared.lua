if SERVER then
	AddCSLuaFile()
end

ROLE.Base = "ttt_role_base"

local maxhealth = CreateConVar("ttt2_zomb_maxhealth_new_zomb", 100, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

-- important to add roles with this function,
-- because it does more than just access the array ! e.g. updating other arrays
-- this role doesn't have a team
ROLE.color = Color(68, 28, 44, 255) -- ...
ROLE.dkcolor = Color(32, 3, 15, 255) -- ...
ROLE.bgcolor = Color(53, 72, 30, 255) -- ...
ROLE.abbr = "zomb" -- abbreviation
ROLE.defaultEquipment = SPECIAL_EQUIPMENT -- here you can set up your own default equipment
ROLE.surviveBonus = 1 -- bonus multiplier for every survive while another player was killed
ROLE.scoreKillsMultiplier = 5 -- multiplier for kill of player of another team
ROLE.scoreTeamKillsMultiplier = -16 -- multiplier for teamkill
ROLE.notSelectable = true -- role cant be selected!
ROLE.preventFindCredits = true
ROLE.preventKillCredits = true
ROLE.preventTraitorAloneCredits = true

-- now link this subrole with its baserole
hook.Add("TTT2BaseRoleInit", "TTT2ConBRnWithZrole", function()
	ZOMBIE:SetBaseRole(ROLE_NECROMANCER)
end)

hook.Add("TTT2RolesLoaded", "AddZombTeam", function()
	ZOMBIE.defaultTeam = TEAM_NECROMANCER
end)

hook.Add("TTTUlxDynamicRCVars", "TTTUlxDynamicZombCVars", function(tbl)
	tbl[ROLE_ZOMBIE] = tbl[ROLE_ZOMBIE] or {}

	table.insert(tbl[ROLE_ZOMBIE], {cvar = "ttt2_zomb_maxhealth_new_zomb", slider = true, min = 10, max = 500, desc = "Max Health for all new Zombies (Def. 100)"})
end)

if CLIENT then -- just on client!
	hook.Add("TTT2FinishedLoading", "ZombInitT", function() -- if sync of roles has finished
		-- setup here is not necessary but if you want to access the role data, you need to start here
		-- setup basic translation !
		LANG.AddToLanguage("English", ZOMBIE.name, "Zombie")
		LANG.AddToLanguage("English", "target_" .. ZOMBIE.name, "Zombie")
		LANG.AddToLanguage("English", "ttt2_desc_" .. ZOMBIE.name, [[You need to win with your mate!]])
		LANG.AddToLanguage("English", "body_found_" .. ZOMBIE.abbr, "They were a Zombie!")
		LANG.AddToLanguage("English", "search_role_" .. ZOMBIE.abbr, "This person was a Zombie!")

		---------------------------------

		-- maybe this language as well...
		LANG.AddToLanguage("Deutsch", ZOMBIE.name, "Zombie")
		LANG.AddToLanguage("Deutsch", "target_" .. ZOMBIE.name, "Zombie")
		LANG.AddToLanguage("Deutsch", "ttt2_desc_" .. ZOMBIE.name, [[Du musst mit deinem Mate gewinnen!]])
		LANG.AddToLanguage("Deutsch", "body_found_" .. ZOMBIE.abbr, "Er war ein Zombie...")
		LANG.AddToLanguage("Deutsch", "search_role_" .. ZOMBIE.abbr, "Diese Person war ein Zombie!")
	end)
else -- SERVER
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
			if CanIdle(target) then
				target:EmitSound(zombie_sound_idles[math.random(zombie_sound_idles_len)], SNDLVL_90dB, 100, 1, CHAN_VOICE)

				StartZombieIdle(target, name)
			end
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
		if not IsValid(wep) or not IsValid(ply) then return end

		if ply:GetSubRole() == ROLE_ZOMBIE then
			if ply:IsSpec() and ply.IsGhost and ply:IsGhost() then return end

			local wepClass = WEPS.GetClass(wep)

			if wepClass ~= "weapon_ttth_zombpistol" then
				return false
			end
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
		if subrole == ROLE_ZOMBIE then
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
		end
	end)

	hook.Add("TTT2RolesLoaded", "AddZombPistolToDefaultLoadout", function()
		local wep = weapons.GetStored("weapon_ttth_zombpistol")
		if wep then
			wep.InLoadoutFor = wep.InLoadoutFor or {}

			if not table.HasValue(wep.InLoadoutFor, ROLE_ZOMBIE) then
				table.insert(wep.InLoadoutFor, ROLE_ZOMBIE)
			end
		end
	end)

	hook.Add("TTTPlayerSpeedModifier", "ZombModifySpeed", function(ply, _, _, noLag)
		if IsValid(ply) and ply:GetSubRole() == ROLE_ZOMBIE then
			noLag[1] = noLag[1] * 0.5
		end
	end)
end
