dofile_once("mods/copis_gun/files/scripts/lib/canada_util.lua")

local ammo = setmetatable({},{
    __index = function(t, k)
    end,
    __newindex = function(t, k, v)
    end
})

function IsActionUnlimited( entity , action )
    local unlimited = false
    if action.permanently_attached then
        unlimited = true
    end
    return unlimited
end

function CurrentCard( entity )
    local wand = GetWand( entity )
    local cards = GetSpells(wand)
    local me = hand[#hand]
    local mycard = cards[me.deck_index + 1]
    return mycard
end

function CardGetAmmo(card)
    if IsActionUnlimited( GetUpdatedEntityID() ) then
        return 1
    else
        local vsc = EntityGetFirstComponentIncludingDisabled( card, "VariableStorageComponent", "ammo_system_remaining" );
        if vsc ~= nil then
            return ComponentGetValue2( vsc, "value_int" )
        end
    end
end

function CardSetAmmo(card, count)
    if IsActionUnlimited( GetUpdatedEntityID() ) then
        return
    else
        local vsc = EntityGetFirstComponentIncludingDisabled( card, "VariableStorageComponent", "ammo_system_remaining" );
        if vsc ~= nil then
            ComponentSetValue2( vsc, "value_int", count )
        end
    end
end



-- card.ammo = ammo 
-- ammo = card.ammo
-- metatable?????? (?)