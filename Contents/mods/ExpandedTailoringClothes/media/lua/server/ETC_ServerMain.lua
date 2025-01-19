local ITEMS_DEFAULT_DROPS = {
    ["Base.HolsterSimple"] = "Base.LeatherStrips",
    ["Base.HolsterDouble"] = "Base.LeatherStrips",
    ["Base.Belt2"] = "Base.LeatherStrips",
}

function Recipe.OnGiveXP.Tailoring5(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 5 + (5 * (0.125 * player:getPerkLevel(Perks.Tailoring))));
end

function Recipe.OnGiveXP.Tailoring10(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 10 + (10 * (0.125 * player:getPerkLevel(Perks.Tailoring))));
end

function Recipe.OnGiveXP.Tailoring15(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 15 + (15 * (0.125 * player:getPerkLevel(Perks.Tailoring))));
end

local OriginalOnCreateRipClothing = Recipe.OnCreate.RipClothing;
function Recipe.OnCreate.RipClothing(items, result, player, selectedItem)
    local item = items:get(0)

    if ITEMS_DEFAULT_DROPS[item:getFullType()] ~= nil then
        local itemToCreate = InventoryItemFactory.CreateItem(ITEMS_DEFAULT_DROPS[item:getFullType()]);
        player:getInventory():AddItem(itemToCreate);
    else
        OriginalOnCreateRipClothing(items, result, player, selectedItem);
    end

    if item:getFabricType() == "Cotton" then
        Recipe.OnGiveXP.Tailoring5(nil, nil, nil, player);
    elseif item:getFabricType() == "Denim" then
        Recipe.OnGiveXP.Tailoring10(nil, nil, nil, player);
    elseif item:getFabricType() == "Leather" then
        Recipe.OnGiveXP.Tailoring15(nil, nil, nil, player);
    end
end
