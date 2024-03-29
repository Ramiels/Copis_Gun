dofile_once("mods/copis_gun/CANADA_lib/init.lua").init("mods/copis_gun/CANADA_lib")                     -- CANADA initer
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/copis_gun/files/scripts/gun/actions.lua" )  -- add bullets
dofile_once("mods/copis_gun/CANADA_lib/canada_utils.lua")

-- # Handle CANADA system variables

-- Silver Bullet
RegisterCanadaAction(
    "mods/copis_gun/files/entities/misc/custom_cards/silver_bullet.xml",
    3, 17, 17, false, true, false, "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/reload")

-- Silver Magnum
RegisterCanadaAction(
    "mods/copis_gun/files/entities/misc/custom_cards/silver_magnum.xml",
    4, 17, 17, false, true, false, "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/reload")

-- Rose Bullet
RegisterCanadaAction(
    "mods/copis_gun/files/entities/misc/custom_cards/rose_bullet.xml",
    4, 18, 18, false, true, false, "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/reload")

-- Rose Magnum
RegisterCanadaAction(
    "mods/copis_gun/files/entities/misc/custom_cards/rose_magnum.xml",
    5, 18, 18, false, true, false, "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/reload")

-- Bloody Bullet
RegisterCanadaAction(
    "mods/copis_gun/files/entities/misc/custom_cards/bloody_bullet.xml",
    5, 8, 8, false, true, false, "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/reload")

-- Bloody Magnum
RegisterCanadaAction(
    "mods/copis_gun/files/entities/misc/custom_cards/bloody_magnum.xml",
    7, 8, 8, false, true, false, "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/reload")

ModRegisterAudioEventMappings("mods/copis_gun/files/audio/GUIDs.txt")

--[[ Audio Attrbs.
+-----------------+---------------------------------------------------+
| name            |   link                                            |
+-----------------+---------------------------------------------------+
| Shoot sound     |   https://soundbible.com/2120-9mm-Gunshot.html    |
| No ammo sound   |   https://soundbible.com/1405-Dry-Fire-Gun.html   |
| Reload sound    |   https://soundbible.com/1404-Pop-Clip-In.html    |
+-----------------+---------------------------------------------------+
]]

if HasFlagPersistent("copis_gun_dontspawnthisshit") then
    RemoveFlagPersistent("copis_gun_dontspawnthisshit")
end

function OnPlayerSpawned( player_entity )           -- This runs when player entity has been created
	if not GameHasFlagRun("copis_gun_spawned") then
		if ModIsEnabled("Twin-Linked") then         -- most based akimbo shooter sim
			local x, y = EntityGetTransform(player_entity)
			EntityLoad("mods/copis_gun/files/entities/items/glock_tl.xml", x + 20, y - 5)
			GamePrintImportant("The gods grant you a second gun!", "make sure to unequip the offhand gun when restocking!", "mods/copis_gun/files/ui_gfx/decoration/twin.png")
		end
		GameAddFlagRun("copis_gun_spawned")
	end
end

function OnWorldPostUpdate()
    CanadaGuiPostUpdate()
    --[[
    local x, y = EntityGetTransform(player_id)
    if tonumber(GlobalsGetValue("canada_lib_reload_frame", "0")) == GameGetFrameNum() then
        GamePlaySound( "mods/copis_gun/files/audio/Copis_Gun.bank", "9mm/reload", x, y )
    end]]
end

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

append_translations( "mods/copis_gun/files/translations/common.csv" )
--DebugModTextFilePrint("mods/copis_gun/files/entities/misc/custom_cards/silver_magnum.xml")