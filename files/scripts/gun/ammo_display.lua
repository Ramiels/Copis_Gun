dofile_once("mods/copis_gun/files/scripts/lib/copi_util.lua")

local entity_id = GetUpdatedEntityID()
local ammo = getAmmoManager(entity_id)
local todisplay = ammo.ammo_system_remaining
local iter = tonumber(GlobalsGetValue("copi_gun_display_iter", "0"))

local angle_dist = ammo.ammo_system_remaining / ammo.ammo_system_capacity * 160
local pos_dist = 12

while (todisplay > 0) do
    GameCreateSpriteForXFrames( "mods/copis_spellbook/files/particles/ammo_temp.png", pos_dist * math.cos(10 + angle_dist * todisplay), pos_dist * math.sin(10 + angle_dist * todisplay), true, 0, 0, 1, true )
    todisplay = todisplay - 1
end
GlobalsSetValue("copi_gun_display_iter", tostring(iter + 1))