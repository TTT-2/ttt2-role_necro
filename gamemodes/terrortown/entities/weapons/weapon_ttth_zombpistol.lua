AddCSLuaFile()

SWEP.HoldType = "pistol"

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 54

	SWEP.EquipMenuData = {
		type = "item_weapon",
		name = "zombie_pistol_name",
		desc = "zombie_pistol_desc"
	}

	SWEP.Icon = "vgui/ttt/icon_deagle"
end

SWEP.Base = "weapon_tttbase"

SWEP.Kind = WEAPON_PISTOL
SWEP.CanBuy = nil
SWEP.notBuyable = true
SWEP.WeaponID = AMMO_DEAGLE

SWEP.Primary.Ammo = "none"
SWEP.Primary.Recoil = 6
SWEP.Primary.Damage = 37
SWEP.Primary.Delay = 0.6
SWEP.Primary.Cone = 0.02
SWEP.Primary.ClipSize = 7
SWEP.Primary.ClipMax = 35
SWEP.Primary.DefaultClip = 7
SWEP.Primary.Automatic = true
SWEP.Primary.Sound = Sound("Weapon_Deagle.Single")

SWEP.HeadshotMultiplier = 4

SWEP.AutoSpawnable = false
SWEP.Spawnable = false

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cstrike/c_pist_deagle.mdl"
SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"

SWEP.IronSightsPos = Vector(-6.361, -3.701, 2.15)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.AllowDrop = false

function SWEP:PrimaryAttack()
	self:SetNextSecondaryFire(CurTime() + self.Primary.Delay)
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	if not self:CanPrimaryAttack() then return end

	sound.Play(self.Primary.Sound, self:GetPos(), self.Primary.SoundLevel)

	self:ShootBullet(self.Primary.Damage, self.Primary.Recoil, self.Primary.NumShots, self:GetPrimaryCone())
	self:TakePrimaryAmmo(1)

	local owner = self:GetOwner()
	if not IsValid(owner) or owner:IsNPC() or (not owner.ViewPunch) then return end

	owner:ViewPunch(Angle(util.SharedRandom(self:GetClass(), -0.2, -0.1, 0) * self.Primary.Recoil, util.SharedRandom(self:GetClass(), -0.1, 0.1, 1) * self.Primary.Recoil, 0))

	if SERVER and self:Clip1() < 1 then
		self:GetOwner():TakeDamage(99999, game.GetWorld(), self)
	end
end

if SERVER then
	function SWEP:OnDrop()
		local owner = self:GetOwner()

		if IsValid(owner) and owner:IsActive() then
			owner:TakeDamage(99999, game.GetWorld(), self)
		end

		self:Remove()
	end
end
