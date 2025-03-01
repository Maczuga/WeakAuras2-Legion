if not C_Item then
  C_Item = {
    GetItemInfoInstant = GetItemInfoInstant,
    IsEquippedItem = IsEquippedItem,
    GetItemSubClassInfo = GetItemSubClassInfo,
    GetItemInfo = GetItemInfo,
    GetItemNameByID = function(itemID)
      local name = GetItemInfo(itemID)
      return name
    end,
    IsEquippedItemType = IsEquippedItemType,
    GetItemIconByID = function(itemID)
      return select(10, GetItemInfo(itemID))
    end,
    GetItemCount = GetItemCount,
  }
end