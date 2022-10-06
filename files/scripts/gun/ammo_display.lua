dofile_once("mods/copis_gun/files/scripts/lib/copi_util.lua")

local function vsc_val( name )
    local vsc = EntityGetFirstComponentIncludingDisabled( entity_id, "VariableStorageComponent", name );
    if vsc ~= nil then
        return 
    end
end
local function vsc_set( name, type, val )
    local vsc = EntityGetFirstComponentIncludingDisabled( entity_id, "VariableStorageComponent", name );
    if vsc ~= nil then
        ComponentSetValue2( vsc, type, val )
    end
end

local props = get_data_from_vsc(entity_id)

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
    vsc_set("ammo_system_remaining", "value_int", math.min(props.ammo_system_remaining + 1, props.ammo_system_capacity))
end


local self = Entity.Current()
local pos_x, pos_y = self:root():transform()
local todisplay = self.var_int.ammo_system_remaining
local capacity = self.var_int.ammo_system_capacity

while (todisplay > 0) do
    GameCreateSpriteForXFrames( "mods/copis_spellbook/files/particles/ammo_temp.png", pos_x + (todisplay * 5) - (capacity * 5) / 2, pos_y - 16, true, 0, 0, 1, true )
    todisplay = todisplay - 1
end
-- IGNORE THE STUFF BELOW HERE ITS LITERALLY JUST FRANKENSTIENED RADAR CODE FOR CIRCLE TRIG BC LAZY
dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )
pos_y = pos_y - 4 -- offset to middle of character

local range = 400
local indicator_distance = 20

-- ping nearby enemies
for _,enemy_id in pairs(EntityGetInRadiusWithTag( pos_x, pos_y, range, "enemy")) do
	local enemy_x, enemy_y = EntityGetFirstHitboxCenter(enemy_id)
	local dir_x = enemy_x - pos_x
	local dir_y = enemy_y - pos_y
	local distance = get_magnitude(dir_x, dir_y)

	local indicator_x = 0
	local indicator_y = 0

    dir_x,dir_y = vec_normalize(dir_x,dir_y)
    indicator_x = pos_x + dir_x * indicator_distance
    indicator_y = pos_y + dir_y * indicator_distance

	-- display sprite based on proximity
	if distance > range * 0.8 then
		GameCreateSpriteForXFrames( "data/particles/radar_enemy_faint.png", indicator_x, indicator_y, true, 0, 0, 1, true )
	elseif distance > range * 0.5 then
		GameCreateSpriteForXFrames( "data/particles/radar_enemy_medium.png", indicator_x, indicator_y, true, 0, 0, 1, true )
	else
		GameCreateSpriteForXFrames( "data/particles/radar_enemy_strong.png", indicator_x, indicator_y, true, 0, 0, 1, true )
	end
end

-- Angle = (props.ammo_system_remaining / props.ammo_system_capacity * 160) + 10