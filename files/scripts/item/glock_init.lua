dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/gun/procedural/gun_action_utils.lua")

local entity_id = GetUpdatedEntityID()

if ModSettingGet("Copis_gun.magnum_bullet") then
    AddGunAction( entity_id, "COPIS_GUN_SILVER_MAGNUM" )
else
    AddGunAction( entity_id, "COPIS_GUN_SILVER_BULLET" )
end