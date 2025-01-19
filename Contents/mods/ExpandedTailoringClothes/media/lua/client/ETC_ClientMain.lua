if not ExpandedTailoringClothes then ExpandedTailoringClothes = {} end

function ExpandedTailoringClothes.UpdateProperty(itemType, propertyName, propertyValue)
    local item = ScriptManager.instance:getItem(itemType);

    if item ~= nil then
        item:DoParam(propertyName.." = "..propertyValue);
    end
end

function ExpandedTailoringClothes.OnGameBoot()
    ExpandedTailoringClothes.UpdateProperty("Base.HolsterSimple", "FabricType", "Leather");
    ExpandedTailoringClothes.UpdateProperty("Base.HolsterDouble", "FabricType", "Leather");
    ExpandedTailoringClothes.UpdateProperty("Base.Belt2", "FabricType", "Leather");
end

Events.OnGameBoot.Add(ExpandedTailoringClothes.OnGameBoot)
