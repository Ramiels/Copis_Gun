dofile_once("CANADA_PATHcanada_util.lua")
local CanadaCard = {}
function CanadaCard:New(id)
    local o = {}
    o.cardId = id
    setmetatable(o, {
        __index = function(t,k)
            if k == "ammo" then return self:GetAmmo(t.card) end
            return self[k]
        end,
        __newindex = function(t, k, v)
            if k == "ammo" then return self:SetAmmo(t.card, v) end
        end    
    })
    function self:New()
        return nil
    end;
    return o
end

function CreateCard(id)
    return CanadaCard:New(id)
end

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

function CanadaCard:GetAmmo()
    if IsActionUnlimited( GetUpdatedEntityID() ) then
        return 1
    else
        local vsc = EntityGetFirstComponentIncludingDisabled( self.cardId, "VariableStorageComponent", "ammo_system_remaining" );
        if vsc ~= nil then
            return ComponentGetValue2( vsc, "value_int" )
        end
    end
end

function CanadaCard:SetAmmo(count)
    if IsActionUnlimited( GetUpdatedEntityID() ) then
        return
    else
        local vsc = EntityGetFirstComponentIncludingDisabled( self.cardId, "VariableStorageComponent", "ammo_system_remaining" );
        if vsc ~= nil then
            ComponentSetValue2( vsc, "value_int", count )
        end
    end
end
