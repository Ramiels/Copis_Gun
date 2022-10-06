dofile_once("mods/copis_gun/files/scripts/lib/copi_util.lua")

local entity_id = GetUpdatedEntityID()
local ammo = getAmmoManager(entity_id)
local recharge = true

-- Don't recharge while shooting attribute
if ammo.ammo_system_recharge_while_shooting ~= true then
    local shooterControls = EntityGetComponent(EntityGetRootEntity(GetUpdatedEntityID()), "ControlsComponent")
    if shooterControls then
        if ComponentGetValue2(shooterControls, "mButtonDownFire") then
            recharge = false
        end
    end
end

-- Ammo recharge time attribute
if GameGetFrameNum() % ammo.ammo_system_recharge_time ~= 0 then
    recharge = false
end

-- Add ammo if possible
if recharge then
    ammo.ammo_system_remaining = math.min(ammo.ammo_system_remaining + 1, ammo.ammo_system_capacity)
end