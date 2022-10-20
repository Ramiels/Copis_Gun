dofile_once("mods/copis_gun/CANADA_lib/init.lua").init("mods/copis_gun/CANADA_lib")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/copis_gun/files/scripts/gun/actions.lua" )


function OnPlayerSpawned( player_entity ) -- This runs when player entity has been created
	if not GameHasFlagRun("copis_gun_spawned") then
        -- most based akimbo shooter sim
		if ModIsEnabled("Twin-Linked") then
			local x, y = EntityGetTransform(player_entity)
			EntityLoad("mods/copis_gun/files/entities/items/glock.xml", x + 20, y - 5)
			GamePrintImportant("The gods grant you a second gun!", "make sure to unequip the offhand gun when restocking!", "mods/copis_gun/files/ui_gfx/decoration/twin.png")
		end
		GameAddFlagRun("copis_gun_spawned")
	end
end

function OnWorldPostUpdate()    -- Handle resetting display iteration
    GlobalsSetValue("copi_gun_display_iter", "0")
end


-- Add translations
local function append_translations( filepath, translation_file )
    if translation_file == nil then
        translation_file = "data/translations/common.csv";
    end
    local translations = ModTextFileGetContent( translation_file );
    if translations ~= nil then
        while translations:find("\r\n\r\n") do
            translations = translations:gsub("\r\n\r\n","\r\n");
        end
        local new_translations = ModTextFileGetContent( filepath );
        translations = translations .. new_translations;
        ModTextFileSetContent( translation_file, translations );
    end
end

append_translations( "mods/copis_gun/files/translations/common.csv" );