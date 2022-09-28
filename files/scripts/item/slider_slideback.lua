dofile("data/scripts/lib/utilities.lua")

local slide_comp = EntityGetFirstComponentIncludingDisabled(GetUpdatedEntityID(), "SpriteComponent", "glock_slide")
if slide_comp ~= nil then
    local offset = ComponentGetValue2(slide_comp, "offset_x")
    if offset ~= 10 then
        ComponentSetValue2(slide_comp, "offset_x", math.max(10, offset - 0.2))
    end
end
