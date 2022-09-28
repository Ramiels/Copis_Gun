local to_insert = {

	{
		id					= "COPIS_GUN_SILVER_BULLET",
		name				= "Silver round",
		description			= "A magazine of 17 silver bullets, it is rumored to have come from the moon. Not compatible with magical wands.",
		sprite				= "mods/copis_gun/files/ui_gfx/gun_actions/silver_bullet.png",
		related_projectiles	= {"mods/copis_gun/files/entities/projectiles/silver_bullet.xml"},
		type				= ACTION_TYPE_PROJECTILE,
		spawn_level			= "0,0",
		spawn_probability	= "0,0",
		price				= 220,
		mana				= 0,
		max_uses 			= 170,
		action				= function()
			add_projectile("mods/copis_gun/files/entities/projectiles/silver_bullet.xml")
            c.fire_rate_wait = c.fire_rate_wait + 10.8;
			c.screenshake = c.screenshake + 0.1
			c.damage_critical_chance = c.damage_critical_chance + 20
		end,
	},

	{
		id					= "COPIS_GUN_SILVER_MAGNUM",
		name				= "Silver magnum",
		description			= "A magazine of 17 oversized silver bullets, it is rumored to have come from the moon. Not compatible with magical wands.",
		sprite				= "mods/copis_gun/files/ui_gfx/gun_actions/silver_magnum.png",
		related_projectiles	= {"mods/copis_gun/files/entities/projectiles/silver_magnum.xml"},
		type				= ACTION_TYPE_PROJECTILE,
		spawn_level			= "0,0",
		spawn_probability	= "0,0",
		price				= 330,
		mana				= 0,
		max_uses 			= 170,
		action				= function()
			add_projectile("mods/copis_gun/files/entities/projectiles/silver_magnum.xml")
			c.fire_rate_wait = c.fire_rate_wait + 14.6;
			c.screenshake = c.screenshake + 0.2
			c.damage_critical_chance = c.damage_critical_chance + 20
		end,
	},
}

for k, v in ipairs(to_insert) do
    table.insert(actions, v)
end