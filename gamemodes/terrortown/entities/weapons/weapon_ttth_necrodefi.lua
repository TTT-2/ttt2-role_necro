if SERVER then
    AddCSLuaFile()
end

local flags = { FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED }

DEFINE_BASECLASS("weapon_ttt_defibrillator")

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
    revivalHealth = CreateConVar("ttt_necro_defibrillator_revival_health", "75", flags),
    revivalMaxHealth = CreateConVar("ttt_necro_defibrillator_revival_max_health", "75", flags),
}

local cvReviveZombies = CreateConVar("ttt_necro_defibrillator_revive_zombies", "0", flags)

SWEP.revivalReason = "revived_by_necromancer"

if SERVER then
    function SWEP:OnDrop()
        self:Remove()
    end

    function SWEP:OnRevive(ply, owner)
        AddZombie(ply, owner)
    end

    function SWEP:OnReviveStart(ply, owner)
        if not cvReviveZombies:GetBool() and ply:GetSubRole() == ROLE_ZOMBIE then
            LANG.Msg(owner, "necrodefi_error_zombie", nil, MSG_MSTACK_WARN)

            return false
        end
    end
end

if CLIENT then
    function SWEP:AddToSettingsMenu(parent)
        BaseClass.AddToSettingsMenu(self, parent)

        local form = vgui.CreateTTT2Form(parent, "header_equipment_necrodefi")

        form:MakeCheckBox({
            label = "label_necro_defibrillator_revive_zombies",
            serverConvar = "ttt_necro_defibrillator_revive_zombies",
        })
    end
end
