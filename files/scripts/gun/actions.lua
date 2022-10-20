dofile_once("mods/copis_gun/CANADA_lib/canada_actions.lua")

local to_insert = {

    {
        id                  = "COPIS_GUN_SILVER_BULLET",
        name                = "$action_name_copis_gun_silver_bullet",
        description         = "$action_desc_copis_gun_silver_bullet",
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
            if reflecting then
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/silver_bullet.xml")
                return;
            end
            if (recursion_level or iteration) ~= nil then return; end

            local card = CurrentCard()
            local ammo = CardGetAmmo(card)
            if (ammo > 0) then
                add_projectile("mods/copis_gun/files/entities/projectiles/silver_bullet.xml")
                c.screenshake = c.screenshake + 0.1
                c.damage_critical_chance = c.damage_critical_chance + 20
                CardSetAmmo(card, ammo - 1)
            end
        end,
    },

    {
        id                  = "COPIS_GUN_SILVER_MAGNUM",
        name                = "$action_name_copis_gun_silver_magnum",
        description         = "$action_desc_copis_gun_silver_magnum",
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
            if reflecting then
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/silver_magnum.xml")
                return;
            end
            if (recursion_level or iteration) ~= nil then return; end

            local card = CurrentCard()
            local ammo = CardGetAmmo(card)
            if (ammo > 0) then
                add_projectile("mods/copis_gun/files/entities/projectiles/silver_magnum.xml")
                c.screenshake = c.screenshake + 0.2
                c.damage_critical_chance = c.damage_critical_chance + 20
                CardSetAmmo(card, ammo - 1)
            end
        end,
    },
}

for k, v in ipairs(to_insert) do
    table.insert(actions, v)
end