if SERVER then
	AddCSLuaFile()
end

-- creates global var "TEAM_NECROMANCER" and other required things
-- TEAM_[name], data: e.g. icon, color, ...
roles.InitCustomTeam(ROLE.name, {
		icon = "vgui/ttt/dynamic/roles/icon_necro",
		color = Color(131, 55, 85, 255)
})

ROLE.Base = "ttt_role_base"

ROLE.color = Color(131, 55, 85, 255) -- ...
ROLE.dkcolor = Color(73, 8, 33, 255) -- ...
ROLE.bgcolor = Color(100, 137, 58, 255) -- ...
ROLE.abbr = "necro" -- abbreviation
ROLE.defaultTeam = TEAM_NECROMANCER -- the team name: roles with same team name are working together
ROLE.defaultEquipment = SPECIAL_EQUIPMENT -- here you can set up your own default equipment
ROLE.surviveBonus = 0.2 -- bonus multiplier for every survive while another player was killed
ROLE.scoreKillsMultiplier = 2 -- multiplier for kill of player of another team
ROLE.scoreTeamKillsMultiplier = -4 -- multiplier for teamkill

if SERVER then
	ROLE.CustomRadar = function(ply) -- Hero Radar function
		local targets = {}
		local scan_ents = ents.FindByClass("prop_ragdoll")

		for _, t in ipairs(scan_ents) do
			local pos = t:LocalToWorld(t:OBBCenter())

			pos.x = math.Round(pos.x)
			pos.y = math.Round(pos.y)
			pos.z = math.Round(pos.z)

			table.insert(targets, {subrole = -1, pos = pos})
		end

		return targets
	end
end

ROLE.conVarData = {
		pct = 0.15, -- necessary: percentage of getting this role selected (per player)
		maximum = 1, -- maximum amount of roles in a round
		minPlayers = 7, -- minimum amount of players until this role is able to get selected
		random = 40, -- randomness of getting this role selected in a round
		credits = 2, -- the starting credits of a specific role
		togglable = true, -- option to toggle a role for a client if possible (F1 menu)
		shopFallback = "traitor"
}

if CLIENT then -- just on client!
	hook.Add("TTT2FinishedLoading", "NecroInitT", function() -- if sync of roles has finished
		-- setup here is not necessary but if you want to access the role data, you need to start here
		-- setup basic translation !
		LANG.AddToLanguage("English", NECROMANCER.name, "Necromancer")
		LANG.AddToLanguage("English", TEAM_NECROMANCER, "TEAM Necromancers")
		LANG.AddToLanguage("English", "hilite_win_" .. TEAM_NECROMANCER, "THE NECRO WON")
		LANG.AddToLanguage("English", "win_" .. TEAM_NECROMANCER, "The Necromancer has won!") -- teamname
		LANG.AddToLanguage("English", "necroo_popup_" .. NECROMANCER.name, [[Now its your turn! Try to get some mates.]])
		LANG.AddToLanguage("English", "body_found_" .. NECROMANCER.abbr, "They were a Necromancer!")
		LANG.AddToLanguage("English", "search_role_" .. NECROMANCER.abbr, "This person was a Necromancer!")
		LANG.AddToLanguage("English", "ev_win_" .. TEAM_NECROMANCER, "The evil Necromancer won the round!")
		LANG.AddToLanguage("English", "target_" .. NECROMANCER.name, "Necromancer")
		LANG.AddToLanguage("English", "ttt2_desc_" .. NECROMANCER.name, [[The Necromancer needs to revive dead players.
If a player gets revived, the player looks like a zombie and will die if the ammo is empty.]])

		---------------------------------

		-- maybe this language as well...
		LANG.AddToLanguage("Deutsch", NECROMANCER.name, "Geisterbeschwörer")
		LANG.AddToLanguage("Deutsch", TEAM_NECROMANCER, "TEAM Geisterbeschwörer")
		LANG.AddToLanguage("Deutsch", "hilite_win_" .. TEAM_NECROMANCER, "THE NECRO WON")
		LANG.AddToLanguage("Deutsch", "win_" .. TEAM_NECROMANCER, "Der Geisterbeschwörer hat gewonnen!")
		LANG.AddToLanguage("Deutsch", "necroo_popup_" .. NECROMANCER.name, [[Jetzt bist du dran! Versuche, einige Spieler auf deine Seite zu ziehen...]])
		LANG.AddToLanguage("Deutsch", "body_found_" .. NECROMANCER.abbr, "Er war ein Geisterbeschwörer...")
		LANG.AddToLanguage("Deutsch", "search_role_" .. NECROMANCER.abbr, "Diese Person war ein Geisterbeschwörer!")
		LANG.AddToLanguage("Deutsch", "ev_win_" .. TEAM_NECROMANCER, "Der böse Geisterbeschwörer hat die Runde gewonnen!")
		LANG.AddToLanguage("Deutsch", "target_" .. NECROMANCER.name, "Geisterbeschwörer")
		LANG.AddToLanguage("Deutsch", "ttt2_desc_" .. NECROMANCER.name, [[Der Geisterbeschwörer muss tote Spieler wiederbeleben, um zu gewinnen.
Wird ein Spieler wiederbelebt, wird er wie ein Zombie aussehen und sterben, sobald seine Munition leer ist.]])
	end)
else -- SERVER
	-- modify roles table of rolesetup addon
	hook.Add("TTTAModifyRolesTable", "ModifyRoleNecroToInno", function(rolesTable)
		local necromancers = rolesTable[ROLE_NECROMANCER]

		if not necromancers then return end

		rolesTable[ROLE_INNOCENT] = rolesTable[ROLE_INNOCENT] + necromancers
		rolesTable[ROLE_NECROMANCER] = 0
	end)

	-- is called if the role has been selected in the normal way of team setup
	hook.Add("TTT2UpdateSubrole", "TTTHNecroGiveDeagle", function(ply, old, new)
		if new == ROLE_NECROMANCER then
			ply:GiveEquipmentWeapon("weapon_ttth_necrodefi")
			ply:GiveEquipmentItem("item_ttt_radar")
		elseif old == ROLE_NECROMANCER then
			ply:StripWeapon("weapon_ttth_necrodefi")
			ply:RemoveEquipmentItem("item_ttt_radar")
		end
	end)

	-- make sure that the necromancer always receives his loadout
	hook.Add("PlayerSpawn", "RespawnNecromancer", function(ply) -- called on player (re-)spawn
		-- this is an ugly workaround, since on calling of the player respawn hook, the player can not yet receive items
		timer.Simple(0.1, function()
			if GetRoundState() ~= ROUND_ACTIVE then return end
			if ply:GetSubRole() ~= ROLE_SUPERVILLAIN then return end

			ply:GiveEquipmentWeapon("weapon_ttth_necrodefi")
			ply:GiveEquipmentItem("item_ttt_radar")
		end)
    end)

	hook.Add("TTT2ModifySelectableRoles", "TTTHJesOrNecro", function(selectableRoles)
		local necro = false
		local jack = false

		for rd in pairs(selectableRoles) do
			if rd == NECROMANCER then
				necro = true
			end

			if rd == JACKAL then
				jack = true
			end
		end

		if necro and jack then
			if math.random(0, 1) == 1 then
				selectableRoles[NECROMANCER] = nil
			else
				selectableRoles[JACKAL] = nil
			end
		end
	end)
end
