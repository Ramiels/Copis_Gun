dofile_once("mods/copis_gun/files/scripts/lib/copi_util.lua")

local props = get_data_from_vsc(entity_id)
local ammo = getAmmoManager(entity_id)
local recharge = true
-- Don't recharge while shooting attribute
if props.ammo_system_recharge_while_shooting ~= true then
    local shooterControls = EntityGetComponent(EntityGetRootEntity(GetUpdatedEntityID()), "ControlsComponent")
    if shooterControls then
        if ComponentGetValue2(shooterControls, "mButtonDownFire") then
            recharge = false
        end
    end
end

-- Ammo recharge time attribute
if GameGetFrameNum() % props.ammo_system_recharge_time ~= 0 then
    recharge = false
end

-- Add ammo if possible
if recharge then
    ammo.ammo_system_remaining = math.min(props.ammo_system_remaining + 1, props.ammo_system_capacity)
end
