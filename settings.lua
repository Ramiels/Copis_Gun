dofile("data/scripts/lib/mod_settings.lua") -- see this file for documentation on some of the features.
dofile("data/scripts/lib/utilities.lua")
local mod_id = "Copis_gun"
mod_settings_version = 1

mod_settings =
{
	{
		ui_fn = mod_setting_vertical_spacing,
		not_setting = true,
        hidden = false,
	},
}
function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

-- This function is called to display the settings UI for this mod. Your mod's settings wont be visible in the mod settings menu if this function isn't defined correctly.
function ModSettingsGui( gui, in_main_menu )
	screen_width, screen_height = GuiGetScreenDimensions(gui)
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
    if not in_main_menu then
        GuiLayoutBeginVertical(gui, 0, 0, false, 0, 0)
            id = 694201337
            local function new_id() id = id + 1; return id end
            GuiLayoutBeginVertical( gui, 0, 0, false, 0, 5 )
                GuiImage( gui, new_id(), 0, 0, "mods/copis_gun/files/ui_gfx/decoration/settings_banner.png", 1, 2, 2)
                GuiColorSetForNextWidget(gui, 0.9, 0.9, 0.9, 0.9)
                GuiText( gui, 0, 0, "Offhand gun will only spawn when the Twin-Linked mod is enabled:" )
                GuiLayoutBeginHorizontal(gui, 0, 0, false, 2, 0)
                    if ModIsEnabled("Twin-Linked") then
                        GuiImage(gui, new_id(), 6, 0, "mods/copis_gun/files/ui_gfx/decoration/checkmark.png", 0.5, 1, 1)
                        GuiColorSetForNextWidget(gui, 0.4, 0.9, 0.4, 0.8)
                        GuiText( gui, 0, -2, "Twin-Linked is enabled!" )
                    else
                        GuiImage(gui, new_id(), 6, 0, "mods/copis_gun/files/ui_gfx/decoration/cross.png", 0.5, 1, 1)
                        GuiColorSetForNextWidget(gui, 0.9, 0.4, 0.4, 0.8)
                        GuiText( gui, 0, -2, "Twin-Linked is disabled!" )
                    end
                GuiLayoutEnd(gui)
            GuiLayoutEnd(gui)
            GuiLayoutAddVerticalSpacing(gui, 30)
            GuiColorSetForNextWidget(gui, 0.9, 0.9, 0.9, 0.9)
            GuiText( gui, 0, 0, "Press [LMB] on the bullet to cycle types, and [RMB] to toggle Magnum mode." )
            GuiLayoutBeginHorizontal(gui, 5, 0, false, 10, 0)
                local text = {"MAINHAND", "OFFHAND"}
                for i=1,2,1 do
                    GuiLayoutBeginVertical( gui, 0, 0, false, 5, 0 )
                        GuiOptionsAddForNextWidget(gui, 16)
                        GuiColorSetForNextWidget(gui, 0.5, 0.5, 0.5, 0.9)
                        GuiText( gui, 0, 0, text[i] )
                        local spelldata = {
                            {
                                magnum = {
                                    sprite = "mods/copis_gun/files/ui_gfx/gun_actions/silver_bullet.png",
                                    name = "Silver Bullet",
                                    desc = "Default enchanted projectiles.\nGood against everything, but plain in functionality."
                                },
                                regular = {
                                    sprite = "mods/copis_gun/files/ui_gfx/gun_actions/silver_magnum.png",
                                    name = "Silver Magnum",
                                    desc = "Oversized yet simple bullets.\nHigher damage and bigger bullets to overcompensate."
                                }
                            },
                            {
                                magnum = {
                                    sprite = "mods/copis_gun/files/ui_gfx/gun_actions/rose_bullet.png",
                                    name = "Rose Bullet",
                                    desc = "Flashy beautiful shots which lightly home in on targets.\nFired in bursts of 3, guided by magical wind."
                                },
                                regular = {
                                    sprite = "mods/copis_gun/files/ui_gfx/gun_actions/rose_magnum.png",
                                    name = "Rose Magnum",
                                    desc = "Elegantly destructive blasts. Shots explode into rose petals\nwhich home in on targets, with a small chance to daze foes."
                                }
                            },
                            {
                                magnum = {
                                    sprite = "mods/copis_gun/files/ui_gfx/gun_actions/bloody_bullet.png",
                                    name = "Bloody Bullet",
                                    desc = "Cruel sanguine projectiles which suck the very life of their targets.\nWeaker, but with a vampiric effect."
                                },
                                regular = {
                                    sprite = "mods/copis_gun/files/ui_gfx/gun_actions/bloody_magnum.png",
                                    name = "Bloody Magnum",
                                    desc = "Giant bullets that burst into pools of blood, for the truly wicked.\nThe last shot in your magazine is a bloody stake which raises lethal crimson thorns."
                                }
                            }
                        }
                        local type = ModSettingGet("Copis_gun.bullet_type_" .. text[i]) or 1
                        local magnum = ModSettingGet("Copis_gun.bullet_magnum_" .. text[i]) or false
                        local data = spelldata[type][magnum and "magnum" or "regular"]
                        GuiOptionsAddForNextWidget(gui, 16)
                        local lmb, rmb = GuiImageButton( gui, new_id(), 0, 0, "", data.sprite or "data/ui_gfx/gun_actions/_unidentified.png")
                        GuiTooltip( gui, data.name, data.desc );
                        if lmb then -- Switch bullet type (silver, rose, bloody)
                            ModSettingSet("Copis_gun.bullet_type_" .. text[i], (ModSettingGet("Copis_gun.bullet_type_" .. text[i]) + 1) % 3 or 1)
                            GamePlaySound("data/audio/Desktop/ui.bank", "ui/button_click", GameGetCameraPos())
                        end
                        if rmb then -- Switch magnum mode (is, isn't)
                            ModSettingSet("Copis_gun.bullet_magnum_" .. text[i], not ModSettingGet("Copis_gun.bullet_magnum_" .. text[i]) or false)
                            GamePlaySound("data/audio/Desktop/ui.bank", "ui/button_click", GameGetCameraPos())
                        end
                    GuiLayoutEnd(gui)
                end
            GuiLayoutEnd(gui)
        GuiLayoutEnd(gui)
        GuiLayoutAddVerticalSpacing(gui, 115)


    else
        GuiLayoutBeginHorizontal( gui, 0, 0, false, 5, 5 )
            id = 21694201337
            local function new_id() id = id + 1; return id end
            GuiImage( gui, new_id(), 0, 0, "data/ui_gfx/inventory/icon_warning.png", 1, 1, 1)
            GuiColorSetForNextWidget(gui, 0.9, 0.4, 0.4, 0.9)
            GuiText( gui, 0, 2, "Please open this menu in-game to change settings!" )
        GuiLayoutEnd(gui)
    end
end