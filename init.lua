dofile_once("mods/copis_gun/lib/canada/init.lua").init("mods/copis_gun/lib/canada")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/copis_gun/files/scripts/gun/actions.lua" )


function OnPlayerSpawned( player_entity ) -- This runs when player entity has been created

	if GameHasFlagRun("copis_gun_spawned") ~= true then

        -- most based akimbo shooter sim
		if ModIsEnabled("Twin-Linked") then
			local x, y = EntityGetTransform(player_entity)
			EntityLoad("mods/copis_gun/files/entities/items/glock.xml", x + 20, y - 5)
			GamePrintImportant("The gods grant you a second gun!", "make sure to unequip the offhand gun when restocking!", "mods/copis_gun/files/ui_gfx/decoration/twin.png")
		end

		GameAddFlagRun("copis_gun_spawned")
	end
end