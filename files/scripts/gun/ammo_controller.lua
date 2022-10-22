dofile_once("mods/copis_gun/files/scripts/lib/copi_util.lua")
dofile_once("mods/copis_gun/CANADA_lib/canada_lib.lua")
local entity_id = GetUpdatedEntityID()
local ammo = CanadaCard(entity_id)
local recharge = true

-- Don't recharge while shooting attribute
if ammo.recharge_while_shooting ~= true then
    local shooterControls = EntityGetComponent(EntityGetRootEntity(GetUpdatedEntityID()), "ControlsComponent")
    if shooterControls then
        if ComponentGetValue2(shooterControls, "mButtonDownFire") then
            recharge = false
        end
    end
end

-- Ammo recharge time attribute
if GameGetFrameNum() % ammo.recharge_time ~= 0 then
    recharge = false
end

-- Add ammo if possible
if recharge then
    ammo.remaining = math.min(ammo.remaining + 1, ammo.capacity)
end