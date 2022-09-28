local function get_wand( entity )
    local inv2_comp = EntityGetFirstComponentIncludingDisabled(entity, "Inventory2Component")
    if inv2_comp ~= nil then
        return ComponentGetValue2(inv2_comp, "mActiveItem")
    end
end

local function get_spells(wand)
    if wand ~= nil then
        local children = EntityGetAllChildren(wand)
        local spells = {}
        local spells_ac = {}
        for _, child in ipairs(children) do
            if EntityHasTag(child, "card_action") then
                local item_comp = EntityGetFirstComponentIncludingDisabled(child, "ItemComponent")
                if item_comp ~= nil then
                    local ac = ComponentGetValue2(item_comp, "permanently_attached")
                    if ac then
                        table.insert(spells_ac, child)
                    else
                        table.insert(spells, child)
                    end
                end
            end
        end
        return spells, spells_ac
    end
end

local function current_card()
    local wand = get_wand(GetUpdatedEntityID())
    local cards = get_spells(wand)
    local me = hand[#hand]
    local mycard = cards[me.deck_index + 1]

end

local function get_ammo(card)
    local vsc = EntityGetFirstComponentIncludingDisabled( card, "VariableStorageComponent", "ammo_system_remaining" );
    if vsc ~= nil then
        return ComponentGetValue2( vsc, "value_int" )
    end
end

local function set_ammo(card, count)
    local vsc = EntityGetFirstComponentIncludingDisabled( card, "VariableStorageComponent", "ammo_system_remaining" );
    if vsc ~= nil then
        ComponentSetValue2( vsc, "value_int", count )
    end
end

local to_insert = {

    {
        id                  = "COPIS_GUN_SILVER_BULLET",
        name                = "Silver round",
        description         = "A magazine of 17 silver bullets, it is rumored to have come from the moon. Not compatible with magical wands.",
        sprite              = "mods/copis_gun/files/ui_gfx/gun_actions/silver_bullet.png",
        related_projectiles = { "mods/copis_gun/files/entities/projectiles/silver_bullet.xml" },
        type                = ACTION_TYPE_PROJECTILE,
        spawn_level         = "0,0",
        spawn_probability   = "0,0",
        price               = 220,
        mana                = 0,
        max_uses            = 170,
        custom_xml_file     = "mods/copis_gun/files/entities/misc/custom_cards/silver_bullet.xml",
        action              = function()
            c.fire_rate_wait = c.fire_rate_wait + 10.8;
            if reflecting then return; end
            if (recursion_level or iteration) ~= nil then return; end

            local card = current_card()
            local ammo = get_ammo(card)
            if (ammo > 0) then
                add_projectile("mods/copis_gun/files/entities/projectiles/silver_bullet.xml")
                c.screenshake = c.screenshake + 0.1
                c.damage_critical_chance = c.damage_critical_chance + 20
                set_ammo(card, ammo - 1)
            end
        end,
    },

    {
        id                  = "COPIS_GUN_SILVER_MAGNUM",
        name                = "Silver magnum",
        description         = "A magazine of 17 oversized silver bullets, it is rumored to have come from the moon. Not compatible with magical wands.",
        sprite              = "mods/copis_gun/files/ui_gfx/gun_actions/silver_magnum.png",
        related_projectiles = { "mods/copis_gun/files/entities/projectiles/silver_magnum.xml" },
        type                = ACTION_TYPE_PROJECTILE,
        spawn_level         = "0,0",
        spawn_probability   = "0,0",
        price               = 330,
        mana                = 0,
        max_uses            = 170,
        custom_xml_file     = "mods/copis_gun/files/entities/misc/custom_cards/silver_magnum.xml",
        action              = function()
            c.fire_rate_wait = c.fire_rate_wait + 14.6;
            if reflecting then return; end
            if (recursion_level or iteration) ~= nil then return; end

            local card = current_card()
            local ammo = get_ammo(card)
            if (ammo > 0) then
                add_projectile("mods/copis_gun/files/entities/projectiles/silver_magnum.xml")
                c.screenshake = c.screenshake + 0.2
                c.damage_critical_chance = c.damage_critical_chance + 20
                set_ammo(card, ammo - 1)
            end
        end,
    },
}

for k, v in ipairs(to_insert) do
    table.insert(actions, v)
end