--- @module "CANADA_lib.canada_actions"
dofile_once("mods/copis_gun/CANADA_lib/canada_actions.lua")
dofile_once("mods/copis_gun/CANADA_lib/canada_lib.lua")
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
        custom_xml_file     = "mods/copis_gun/files/entities/misc/custom_cards/silver_bullet.xml",
        action              = function()
            c.fire_rate_wait = c.fire_rate_wait + 10.8;
            if reflecting then
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/silver_bullet.xml")
                return;
            end
            if (recursion_level or iteration) ~= nil then return; end

            local canada_card = CanadaCard(CurrentCard(GetUpdatedEntityID()))
            if (canada_card.ammo > 0) then
                add_projectile("mods/copis_gun/files/entities/projectiles/silver_bullet.xml")
                c.screenshake = c.screenshake + 0.1
                c.damage_critical_chance = c.damage_critical_chance + 20
                canada_card.ammo = canada_card.ammo - 1
            else
                local x, y = EntityGetTransform(GetUpdatedEntityID())
                GamePlaySound( "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/blank", x, y )
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
        custom_xml_file     = "mods/copis_gun/files/entities/misc/custom_cards/silver_magnum.xml",
        action              = function()
            c.fire_rate_wait = c.fire_rate_wait + 14.6;
            if reflecting then
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/silver_magnum.xml")
                return;
            end
            if (recursion_level or iteration) ~= nil then return; end

            local canada_card = CanadaCard(CurrentCard(GetUpdatedEntityID()))
            if (canada_card.ammo > 0) then
                add_projectile("mods/copis_gun/files/entities/projectiles/silver_magnum.xml")
                c.screenshake = c.screenshake + 0.2
                c.damage_critical_chance = c.damage_critical_chance + 20
                canada_card.ammo = canada_card.ammo - 1
            else
                local x, y = EntityGetTransform(GetUpdatedEntityID())
                GamePlaySound( "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/blank", x, y )
            end
        end,
    },
--[[
    {
        id                  = "COPIS_GUN_ROSE_BULLET",
        name                = "$action_name_copis_gun_rose_bullet",
        description         = "$action_desc_copis_gun_rose_bullet",
        sprite              = "mods/copis_gun/files/ui_gfx/gun_actions/rose_bullet.png",
        related_projectiles = { "mods/copis_gun/files/entities/projectiles/rose_bullet.xml" },
        type                = ACTION_TYPE_PROJECTILE,
        spawn_level         = "0,0",
        spawn_probability   = "0,0",
        price               = 220,
        mana                = 0,
        custom_xml_file     = "mods/copis_gun/files/entities/misc/custom_cards/rose_bullet.xml",
        action              = function()
            c.fire_rate_wait = c.fire_rate_wait + 10.8;
            if reflecting then
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/rose_bullet.xml")
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/rose_bullet.xml")
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/rose_bullet.xml")
                return;
            end
            if (recursion_level or iteration) ~= nil then return; end

            local card = CurrentCard()
            local ammo = getAmmoManager(card)
            if (ammo.ammo_system_remaining > 0) then
                c.screenshake = c.screenshake + 0.1
                c.damage_critical_chance = c.damage_critical_chance + 20
                BeginProjectile("mods/copis_gun/files/entities/projectiles/burst_fire.xml");
                    BeginTriggerTimer( 1 );
                        BeginProjectile("mods/copis_gun/files/entities/projectiles/rose_bullet.xml"); EndProjectile();
                        register_action( c );
                        SetProjectileConfigs();
                    EndTrigger();
                    BeginTriggerTimer( 4 );
                        BeginProjectile("mods/copis_gun/files/entities/projectiles/rose_bullet.xml"); EndProjectile();
                        register_action( c );
                        SetProjectileConfigs();
                    EndTrigger();
                    BeginTriggerTimer( 7 );
                        BeginProjectile("mods/copis_gun/files/entities/projectiles/rose_bullet.xml"); EndProjectile();
                        register_action( c );
                        SetProjectileConfigs();
                    EndTrigger();
                EndProjectile()
                ammo.ammo_system_remaining = ammo.ammo_system_remaining - 3
            else
                local x, y = EntityGetTransform(GetUpdatedEntityID())
                GamePlaySound( "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/blank", x, y )
            end
        end,
    },

    {
        id                  = "COPIS_GUN_ROSE_MAGNUM",
        name                = "$action_name_copis_gun_rose_magnum",
        description         = "$action_desc_copis_gun_rose_magnum",
        sprite              = "mods/copis_gun/files/ui_gfx/gun_actions/rose_magnum.png",
        related_projectiles = { "mods/copis_gun/files/entities/projectiles/rose_magnum.xml" },
        type                = ACTION_TYPE_PROJECTILE,
        spawn_level         = "0,0",
        spawn_probability   = "0,0",
        price               = 330,
        mana                = 0,
        custom_xml_file     = "mods/copis_gun/files/entities/misc/custom_cards/rose_magnum.xml",
        action              = function()
            c.fire_rate_wait = c.fire_rate_wait + 14.6;
            if reflecting then
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/rose_magnum.xml")
                return;
            end
            if (recursion_level or iteration) ~= nil then return; end

            local card = CurrentCard()
            local ammo = getAmmoManager(card)
            if (ammo.ammo_system_remaining > 0) then
                add_projectile("mods/copis_gun/files/entities/projectiles/rose_magnum.xml")
                c.screenshake = c.screenshake + 0.2
                c.damage_critical_chance = c.damage_critical_chance + 20
                ammo.ammo_system_remaining = ammo.ammo_system_remaining - 1
            else
                local x, y = EntityGetTransform(GetUpdatedEntityID())
                GamePlaySound( "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/blank", x, y )
            end
        end,
    },]]
}

for k, v in ipairs(to_insert) do
    table.insert(actions, v)
end