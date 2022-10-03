
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

-- Thanks for the help gus!
local function get_data_from_vsc(id)
    local data = {}
    local vsc = EntityGetComponentIncludingDisabled(id, "VariableStorageComponent")
    for _, v in ipairs(vsc) do
        local name = ComponentGetValue2(v, "name")
        local t = ComponentGetValue2(v, "_tags")
        local value = ComponentGetValue2(v, "value_int") or ComponentGetValue2(v, "value_string") or ComponentGetValue2(v, "value_bool") or ComponentGetValue2(v, "value_float")
        if (type(value) == "string") and t ~= "string" then
            if t == "bool" then value = (value == "true" and true or false) end
            if t == "int" or t == "float" then value = tonumber(value) end
        end
        table.insert(data, {
            name = name,
            value = value
        })
    end
    return data
end

local props = get_data_from_vsc(entity_id)

local recharge = true

-- Don't recharge while shooting attribute
if props.ammo_system_recharge_while_shooting ~= true then
    local shooterControls = EntityGetComponent(EntityGetRootEntity(GetUpdatedEntityID()), "ControlsComponent")
    if shooterControls then
        if ComponentGetValue2(shooterControls, mButtonDownFire) then
            recharge = false
        end
    end
end

-- Ammo recharge time attribute
if GameGetFrameNum() % props.ammo_system_recharge_time ~= 0 then
    recharge = false
end

-- Add ammo if possible
if recharge == true then
    vsc_set("ammo_system_remaining", "value_int", math.min(props.ammo_system_remaining + 1, props.ammo_system_capacity))
end
