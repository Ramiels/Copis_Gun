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
        never_ac            = true,
        custom_xml_file     = "mods/copis_gun/files/entities/misc/custom_cards/silver_bullet.xml",
        action              = function()
            c.fire_rate_wait = c.fire_rate_wait + 10.8;
            if reflecting then
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/silver_bullet.xml")
                return;
            end
            if (recursion_level or iteration) ~= nil then return; end

            local canada_card = CanadaCard(CurrentCard())
            local always_cast = current_action.permanently_attached
            if always_cast or (canada_card.ammo > 0) then
                add_projectile("mods/copis_gun/files/entities/projectiles/silver_bullet.xml")
                c.screenshake = c.screenshake + 0.1
                c.damage_critical_chance = c.damage_critical_chance + 20
                if not always_cast then
                    canada_card.ammo = canada_card.ammo - 1
                else
                    canada_card.ammo = canada_card.capacity -- the fuck?? why doesn't this work??? literally 1984... whatever
                end
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
        never_ac            = true,
        custom_xml_file     = "mods/copis_gun/files/entities/misc/custom_cards/silver_magnum.xml",
        action              = function()
            c.fire_rate_wait = c.fire_rate_wait + 14.6;
            if reflecting then
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/silver_magnum.xml")
                return;
            end
            if (recursion_level or iteration) ~= nil then return; end

            local canada_card = CanadaCard(CurrentCard())
            local always_cast = current_action.permanently_attached
            if always_cast or (canada_card.ammo > 0) then
                add_projectile("mods/copis_gun/files/entities/projectiles/silver_magnum.xml")
                c.screenshake = c.screenshake + 0.2
                c.damage_critical_chance = c.damage_critical_chance + 20
                if not always_cast then
                    canada_card.ammo = canada_card.ammo - 1
                else
                    canada_card.ammo = canada_card.capacity -- the fuck?? why doesn't this work??? literally 1984... whatever
                end
            else
                local x, y = EntityGetTransform(GetUpdatedEntityID())
                GamePlaySound( "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/blank", x, y )
            end
        end,
    },

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
        never_ac            = true,
        custom_xml_file     = "mods/copis_gun/files/entities/misc/custom_cards/rose_bullet.xml",
        action              = function()
            c.fire_rate_wait = c.fire_rate_wait + 32;
            if reflecting then
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/rose_bullet.xml")
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/rose_bullet.xml")
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/rose_bullet.xml")
                return;
            end
            if (recursion_level or iteration) ~= nil then return; end

            local canada_card = CanadaCard(CurrentCard())
            local always_cast = current_action.permanently_attached
            if always_cast or (canada_card.ammo > 0) then
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
                if not always_cast then
                    canada_card.ammo = canada_card.ammo - 3
                else
                    canada_card.ammo = canada_card.capacity -- the fuck?? why doesn't this work??? literally 1984... whatever
                end
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
        never_ac            = true,
        custom_xml_file     = "mods/copis_gun/files/entities/misc/custom_cards/rose_magnum.xml",
        action              = function()
            c.fire_rate_wait = c.fire_rate_wait + 22.6;
            if reflecting then
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/rose_magnum.xml")
                return;
            end
            if (recursion_level or iteration) ~= nil then return; end

            local canada_card = CanadaCard(CurrentCard())
            local always_cast = current_action.permanently_attached
            if always_cast or (canada_card.ammo > 0) then
                add_projectile("mods/copis_gun/files/entities/projectiles/rose_magnum.xml")
                c.screenshake = c.screenshake + 0.2
                c.damage_critical_chance = c.damage_critical_chance + 20
                if not always_cast then
                    canada_card.ammo = canada_card.ammo - 1
                else
                    canada_card.ammo = canada_card.capacity -- the fuck?? why doesn't this work??? literally 1984... whatever
                end
            else
                local x, y = EntityGetTransform(GetUpdatedEntityID())
                GamePlaySound( "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/blank", x, y )
            end
        end,
    },
    {
        id                  = "COPIS_GUN_BLOODY_BULLET",
        name                = "$action_name_copis_gun_bloody_bullet",
        description         = "$action_desc_copis_gun_bloody_bullet",
        sprite              = "mods/copis_gun/files/ui_gfx/gun_actions/bloody_bullet.png",
        related_projectiles = { "mods/copis_gun/files/entities/projectiles/bloody_bullet.xml" },
        type                = ACTION_TYPE_PROJECTILE,
        spawn_level         = "0,0",
        spawn_probability   = "0,0",
        price               = 220,
        mana                = 0,
        never_ac            = true,
        custom_xml_file     = "mods/copis_gun/files/entities/misc/custom_cards/bloody_bullet.xml",
        action              = function()
            c.fire_rate_wait = c.fire_rate_wait + 14;
            if reflecting then
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/bloody_bullet.xml")
                return;
            end
            if (recursion_level or iteration) ~= nil then return; end

            local canada_card = CanadaCard(CurrentCard())
            local always_cast = current_action.permanently_attached
            if always_cast or (canada_card.ammo > 0) then
                add_projectile("mods/copis_gun/files/entities/projectiles/bloody_bullet.xml")
                c.screenshake = c.screenshake + 0.1
                c.damage_critical_chance = c.damage_critical_chance + 20
                if not always_cast then
                    canada_card.ammo = canada_card.ammo - 1
                else
                    canada_card.ammo = canada_card.capacity -- the fuck?? why doesn't this work??? literally 1984... whatever
                end
            else
                local x, y = EntityGetTransform(GetUpdatedEntityID())
                GamePlaySound( "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/blank", x, y )
            end
        end,
    },

    {
        id                  = "COPIS_GUN_BLOODY_MAGNUM",
        name                = "$action_name_copis_gun_bloody_magnum",
        description         = "$action_desc_copis_gun_bloody_magnum",
        sprite              = "mods/copis_gun/files/ui_gfx/gun_actions/bloody_magnum.png",
        related_projectiles = { "mods/copis_gun/files/entities/projectiles/silver_magnum.xml" },
        type                = ACTION_TYPE_PROJECTILE,
        spawn_level         = "0,0",
        spawn_probability   = "0,0",
        price               = 330,
        mana                = 0,
        never_ac            = true,
        custom_xml_file     = "mods/copis_gun/files/entities/misc/custom_cards/bloody_magnum.xml",
        action              = function()
            c.fire_rate_wait = c.fire_rate_wait + 20;
            if reflecting then
                Reflection_RegisterProjectile("mods/copis_gun/files/entities/projectiles/bloody_magnum.xml")
                return;
            end
            if (recursion_level or iteration) ~= nil then return; end

            local canada_card = CanadaCard(CurrentCard())
            local always_cast = current_action.permanently_attached
            if always_cast or (canada_card.ammo > 0) then
                if canada_card.ammo == 1 then
                    add_projectile("mods/copis_gun/files/entities/projectiles/bloody_thorn.xml")
                    c.screenshake = c.screenshake + 0.4
                    c.damage_critical_chance = c.damage_critical_chance + 45
                else
                    add_projectile("mods/copis_gun/files/entities/projectiles/bloody_magnum.xml")
                    c.screenshake = c.screenshake + 0.2
                    c.damage_critical_chance = c.damage_critical_chance + 20
                end
                if not always_cast then
                    canada_card.ammo = canada_card.ammo - 1
                else
                    canada_card.ammo = canada_card.capacity -- the fuck?? why doesn't this work??? literally 1984... whatever
                end
            else
                local x, y = EntityGetTransform(GetUpdatedEntityID())
                GamePlaySound( "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/blank", x, y )
            end
        end,
    },
}

for i = 1, #to_insert do
    to_insert[i].spawn_requires_flag = "copis_gun_dontspawnthisshit"
    to_insert[i].author = "Copi"
    to_insert[i].mod = "Copi's Gun"
    actions[#actions+1] = to_insert[i]
end