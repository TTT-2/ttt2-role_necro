if CLIENT then
	EVENT.icon = Material("vgui/ttt/vskin/events/necro_revive")
	EVENT.title = "title_event_necro_revive"

	function EVENT:GetText()
		return {
			{
				string = "desc_event_necro_revive",
				params = {
					necro = self.event.necro.nick,
					zombie = self.event.zombie.nick,
					zrole = roles.GetByIndex(self.event.zombie.role).name,
					zteam = self.event.zombie.team,
				},
				translateParams = true
			}
		}
	end
end

if SERVER then
	function EVENT:Trigger(necro, zombie)
		self:AddAffectedPlayers(
			{necro:SteamID64(), zombie:SteamID64()},
			{necro:Nick(), zombie:Nick()}
		)

		return self:Add({
			necro = {
				nick = necro:Nick(),
				sid64 = necro:SteamID64()
			},
			zombie = {
				nick = zombie:Nick(),
				sid64 = zombie:SteamID64(),
				role = zombie:GetSubRole(),
				team = zombie:GetTeam(),
			}
		})
	end

	function EVENT:CalculateScore()
		local event = self.event

		self:SetPlayerScore(event.necro.sid64, {
			score = 1
		})
	end
end

function EVENT:Serialize()
	return self.event.necro.nick .. " has revived " .. self.event.zombie.nick .. " as a Zombie."
end
