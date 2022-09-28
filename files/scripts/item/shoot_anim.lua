dofile("data/scripts/lib/utilities.lua")

function shot(projectile_entity_id)
    local gun = GetUpdatedEntityID()
    local body_comp = EntityGetFirstComponentIncludingDisabled(gun, "SpriteComponent", "glock_body")
    local slide_comp = EntityGetFirstComponentIncludingDisabled(gun, "SpriteComponent", "glock_slide")
    local z_index = 0
    if body_comp ~= nil then
        ComponentSetValue2(body_comp, "rect_animation", "shooting")
        z_index = ComponentGetValue2(body_comp, "z_index")
        EntityRefreshSprite(gun, body_comp)
    end
    if slide_comp ~= nil then
        ComponentSetValue2(slide_comp, "offset_x", 14)
        ComponentSetValue2(slide_comp, "z_index", z_index - 0.00001)
        EntityRefreshSprite(gun, slide_comp)
    end
end