local entity_id = GetUpdatedEntityID()

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

local props = {}
local vsc_comps = EntityGetComponentIncludingDisabled(GetUpdatedEntityID(), "VariableStorageComponent")
for _, comp in ipairs(vsc_comps) do
    local name = ComponentGetValue2( comp, "name" )
    local value = ComponentGetValue2( comp, "value_int" )
    local prop = {name, value}
    table.insert(props)
end


local recharge = true

-- Don't recharge while shooting attribute
if props.ammo_system_recharge_while_shooting ~= true then
    local shooterControls = self:root().ControlsComponent
    if shooterControls then
        if shooterControls.mButtonDownFire then
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