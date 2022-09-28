local entity_id = GetUpdatedEntityID()
local _, _, rad = EntityGetTransform(entity_id)
local sprite_comp = EntityGetComponentIncludingDisabled(entity_id, "SpriteComponent", "item")
for _, value in ipairs(sprite_comp) do
    if rad >= -math.pi / 2 and rad <= math.pi / 2 then
        ComponentSetValue2(value, "special_scale_y", 0.4)
    else
        ComponentSetValue2(value, "special_scale_y", -0.4)
    end
end
