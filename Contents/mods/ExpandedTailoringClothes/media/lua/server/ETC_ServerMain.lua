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
  local item = items:get(0) -- assumes any tool comes after this in ETC_Recipes.txt

  if item:getType() == "HolsterSimple" or item:getType() == "HolsterDouble" or item:getType() == "Belt2" then
    local materials = { "Base.LeatherStrips", 1 }
    local item = InventoryItemFactory.CreateItem("Base.LeatherStrips");
    player:getInventory():AddItem(item);
  end

  OriginalOnCreateRipClothing(items, result, player, selectedItem);
end
