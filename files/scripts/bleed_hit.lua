function damage_received( damage, message, entity_thats_responsible, is_fatal, projectile_thats_responsible )
    if is_fatal then
        local dmcs = EntityGetComponentIncludingDisabled(entity_thats_responsible, "DamageModelComponent") or {}
        for i = 1, #dmcs do
            local max_hp = ComponentGetValue2( dmcs[i], "max_hp" )
            local hp = ComponentGetValue2( dmcs[i], "hp" )
            ComponentSetValue2(dmcs[i], "hp", math.max(hp + (5/25), max_hp))
        end
    end
end