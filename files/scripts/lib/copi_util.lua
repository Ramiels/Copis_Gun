function CollectComponents(entity_id)
    local comps = {}
    local comp_ids = EntityGetAllComponents(entity_id)
    for _, comp in ipairs(comp_ids) do
        table.insert(comps, {
            id = comp,
            members = ComponentGetMembers(comp)
        })
    end
end

-- Thanks for the help gus!
function get_data_from_vsc(id)
    local data = {}
    local vsc = EntityGetComponentIncludingDisabled(id, "VariableStorageComponent")
    if vsc == nil then
        return nil
    end
    for _, v in ipairs(vsc) do
        local name = ComponentGetValue2(v, "name")
        local t = ComponentGetValue2(v, "_tags")
        local value = ComponentGetValue2(v, "value_int") or ComponentGetValue2(v, "value_string") or
                          ComponentGetValue2(v, "value_bool") or ComponentGetValue2(v, "value_float")
        if (type(value) == "string") and t ~= "string" then
            if t == "bool" then
                value = (value == "true" and true or false)
            end
            if t == "int" or t == "float" then
                value = tonumber(value)
            end
        end
        table.insert(data, {
            name = name,
            value = value
        })
    end
    return data
end

local prop_types = {
    ammo_system_recharge_time = "int",
    ammo_system_capacity = "int",
    ammo_system_remaining = "int",
    ammo_system_recharge_while_shooting = "bool",
    ammo_system_locked = "bool",
}

function getAmmoManager(id)
    return setmetatable({}, {
        __index = function(t, k)
            local vsc = EntityGetComponentIncludingDisabled(id, "VariableStorageComponent");
            local comp
            for _=1, #vsc do local v = vsc[_] 
                if ComponentGetValue2(v, "name") == k then 
                    comp = v
                end
            end
            if vsc ~= nil then
                return ComponentGetValue2(comp, ("value_%s"):format(prop_types[k]))
            end
        end,
        __newindex = function(t, k, v)
            local vsc = EntityGetComponentIncludingDisabled(id, "VariableStorageComponent");
            local comp
            for _=1, #vsc do local val = vsc[_] 
                if ComponentGetValue2(v, "name") == k then 
                    comp = val
                end
            end
            if vsc ~= nil then
                ComponentSetValue2(comp, ("value_%s"):format(prop_types[k]), v)
            end
        end
    })
end
