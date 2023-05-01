dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/gun/procedural/gun_action_utils.lua")

local entity_id = GetUpdatedEntityID()
local type = ModSettingGet("Copis_gun.bullet_type_OFFHAND") or 1            -- default: silver type
local magnum = ModSettingGet("Copis_gun.bullet_magnum_OFFHAND") or false    -- default: non-magnum
local options_m = {
    "COPIS_GUN_SILVER_MAGNUM",
    "COPIS_GUN_ROSE_MAGNUM",
    "COPIS_GUN_BLOODY_MAGNUM",
}
local options_r = {
    "COPIS_GUN_SILVER_BULLET",
    "COPIS_GUN_ROSE_BULLET",
    "COPIS_GUN_BLOODY_BULLET",
}
local result = "COPIS_GUN_SILVER_BULLET"   -- this line was the culprit, without a default bullet set it would try to add the spell with the ID "" (empty) to the wand
if magnum then
    result = options_m[type]
else
    result = options_r[type]
end
AddGunAction( entity_id, result )