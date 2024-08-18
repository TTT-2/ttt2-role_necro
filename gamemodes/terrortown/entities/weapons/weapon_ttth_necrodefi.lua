if SERVER then
    AddCSLuaFile()
end

local flags = { FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED }

SWEP.Base = "weapon_ttt_defibrillator"

if CLIENT then
    SWEP.EquipMenuData = {
        type = "item_weapon",
        name = "necro_defi_name",
        desc = "necro_defi_desc",
    }

    SWEP.Icon = "vgui/ttt/icon_defi_necro"
end

SWEP.Kind = WEAPON_EQUIP2
SWEP.CanBuy = nil
SWEP.notBuyable = true

SWEP.EnableConfigurableClip = true
SWEP.ConfigurableClip = 3

SWEP.AllowDrop = false

SWEP.cvars = {
    reviveBraindead = CreateConVar("ttt_necro_defibrillator_revive_braindead", "1", flags),
    playSound = CreateConVar("ttt_necro_defibrillator_play_sounds", "0", flags),
    reviveTime = CreateConVar("ttt_necro_defibrillator_revive_time", "3.0", flags),
    errorTime = CreateConVar("ttt_necro_defibrillator_error_time", "1.5", flags),
    successChance = CreateConVar("ttt_necro_defibrillator_success_chance", "100", flags),
    resetConfirmation = CreateConVar("ttt_necro_defibrillator_reset_confirm", "0", flags),
}

SWEP.revivalReason = "revived_by_necromancer"

if SERVER then
    function SWEP:OnDrop()
        self:Remove()
    end

    function SWEP:OnRevive(ply, owner)
        AddZombie(ply, owner)
    end
end
