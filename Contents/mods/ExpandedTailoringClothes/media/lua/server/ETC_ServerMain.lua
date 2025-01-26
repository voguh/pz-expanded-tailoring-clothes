if not ETCRecipe then ETCRecipe = {} end

local ITEMS_DEFAULT_DROPS = {
    ["Base.HolsterSimple"] = "Base.LeatherStrips",
    ["Base.HolsterDouble"] = "Base.LeatherStrips",
    ["Base.Belt2"] = "Base.LeatherStrips",
}

function Recipe.OnGiveXP.Tailoring5(recipe, ingredients, result, player)
    local xpPoints = 5;
    player:getXp():AddXP(Perks.Tailoring, xpPoints + (xpPoints * (0.125 * player:getPerkLevel(Perks.Tailoring))));
end

function Recipe.OnGiveXP.Tailoring10(recipe, ingredients, result, player)
    local xpPoints = 10;
    player:getXp():AddXP(Perks.Tailoring, xpPoints + (xpPoints * (0.125 * player:getPerkLevel(Perks.Tailoring))));
end

function Recipe.OnGiveXP.Tailoring15(recipe, ingredients, result, player)
    local xpPoints = 15;
    player:getXp():AddXP(Perks.Tailoring, xpPoints + (xpPoints * (0.125 * player:getPerkLevel(Perks.Tailoring))));
end

local OriginalOnCreateRipClothing = Recipe.OnCreate.RipClothing;
function Recipe.OnCreate.RipClothing(items, result, player, selectedItem)
    local item = items:get(0);
    local itemToCreate = nil;

    if ITEMS_DEFAULT_DROPS[item:getFullType()] ~= nil then
        itemToCreate = InventoryItemFactory.CreateItem(ITEMS_DEFAULT_DROPS[item:getFullType()]);
    elseif string.contains(item:getBodyLocation(), "Underwear") then
        itemToCreate = InventoryItemFactory.CreateItem("Base.RippedSheets");
    else
        OriginalOnCreateRipClothing(items, result, player, selectedItem);
    end

    if itemToCreate ~= nil then
        player:getInventory():AddItem(itemToCreate);
    end

    if item:getFabricType() == "Cotton" then
        Recipe.OnGiveXP.Tailoring5(nil, nil, nil, player);
    elseif item:getFabricType() == "Denim" then
        Recipe.OnGiveXP.Tailoring10(nil, nil, nil, player);
    elseif item:getFabricType() == "Leather" then
        Recipe.OnGiveXP.Tailoring15(nil, nil, nil, player);
    end
end
