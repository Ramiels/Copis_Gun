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

function getAmmoManager(id)
    return setmetatable({}, {
        __index = function(t, k)
            local vsc = EntityGetFirstComponentIncludingDisabled(id, "VariableStorageComponent", k);
            if vsc ~= nil then
                return
            end
        end,
        __newindex = function(t, k, v)
            local type
            if k == "ammo_system_recharge_time" or k == "ammo_system_capacity" or k == "ammo_system_remaining" then
                type = "value_int"
            elseif k == "ammo_system_recharge_while_shooting" or k == "ammo_system_locked" then
                type = "value_bool"
            end
            local vsc = EntityGetFirstComponentIncludingDisabled(id, "VariableStorageComponent", k);
            if vsc ~= nil then
                ComponentSetValue2(vsc, type, v)
            end
        end
    })
end
