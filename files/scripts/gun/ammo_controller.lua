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
