if not C_Item then
  C_Item = {
    GetItemInfoInstant = GetItemInfoInstant,
    IsEquippedItem = IsEquippedItem,
    GetItemSubClassInfo = GetItemSubClassInfo,
    GetItemInfo = GetItemInfo,
    GetItemCount = GetItemCount,
  }

  C_Item.IsEquippedItemType = function(itemType)
    if not itemType or itemType == "" then
      return false
    end
    return IsEquippedItemType(itemType)
  end

  C_Item.GetItemNameByID = function(itemIdentifier)
    return GetItemInfo(itemIdentifier)
  end

  C_Item.GetItemIconByID = function(itemIdentifier)
    return select(10, GetItemInfo(itemIdentifier))
  end

  local function UnpackItemLocation(itemLocation)
      if itemLocation:IsBagAndSlot() then
          return "bag", itemLocation:GetBagAndSlot()
      elseif itemLocation:IsEquipmentSlot() then
          return "equip", nil, itemLocation:GetEquipmentSlot()
      end
      return "unknown"
  end

  C_Item.DoesItemExistByID = function(itemIdentifier)
      return GetItemInfo(itemIdentifier) ~= nil
  end

  C_Item.DoesItemExist = function(itemLocation)
      local locType, bagID, slot = UnpackItemLocation(itemLocation)
      if locType == "bag" then
          return GetContainerItemLink(bagID, slot) ~= nil
      elseif locType == "equip" then
          return GetInventoryItemLink("player", slot) ~= nil
      end
      return false
  end

  C_Item.GetItemID = function(itemLocation)
      local locType, bagID, slot = UnpackItemLocation(itemLocation)
      if locType == "bag" then
          return GetContainerItemID(bagID, slot)
      elseif locType == "equip" then
          return GetInventoryItemID("player", slot)
      end
  end

  C_Item.IsLocked = function(itemLocation)
      local locType, bagID, slot = UnpackItemLocation(itemLocation)
      if locType == "bag" then
          return IsContainerItemLocked(bagID, slot)
      elseif locType == "equip" then
          return IsInventoryItemLocked(slot)
      end
      return false
  end

  C_Item.LockItem = function(itemLocation)
      local locType, bagID, slot = UnpackItemLocation(itemLocation)
      if locType == "bag" then
          LockContainerItem(bagID, slot)
      elseif locType == "equip" then
          LockInventoryItem(slot)
      end
  end

  C_Item.UnlockItem = function(itemLocation)
      local locType, bagID, slot = UnpackItemLocation(itemLocation)
      if locType == "bag" then
          UnlockContainerItem(bagID, slot)
      elseif locType == "equip" then
          UnlockInventoryItem(slot)
      end
  end

  C_Item.GetItemIcon = function(itemLocation)
      local locType, bagID, slot = UnpackItemLocation(itemLocation)
      if locType == "bag" then
          return select(10, GetContainerItemInfo(bagID, slot))
      elseif locType == "equip" then
          return select(10, GetInventoryItemInfo("player", slot))
      end
  end

  C_Item.GetItemName = function(itemLocation)
      local locType, bagID, slot = UnpackItemLocation(itemLocation)
      if locType == "bag" then
          return GetContainerItemInfo(bagID, slot)
      elseif locType == "equip" then
          return GetInventoryItemInfo("player", slot)
      end
  end

  C_Item.GetItemLink = function(itemLocation)
      local locType, bagID, slot = UnpackItemLocation(itemLocation)
      if locType == "bag" then
          return GetContainerItemLink(bagID, slot)
      elseif locType == "equip" then
          return GetInventoryItemLink("player", slot)
      end
  end

  C_Item.GetItemQuality = function(itemLocation)
      local locType, bagID, slot = UnpackItemLocation(itemLocation)
      if locType == "bag" then
          return select(3, GetContainerItemInfo(bagID, slot))
      elseif locType == "equip" then
          return select(3, GetInventoryItemInfo("player", slot))
      end
  end

  C_Item.GetItemQualityByID = function(itemIdentifier)
      return select(3, GetItemInfo(itemIdentifier))
  end

  C_Item.GetCurrentItemLevel = function(itemLocation)
      local link = C_Item.GetItemLink(itemLocation)
      if link then
          return GetItemLevelInfo(link)
      end
  end

  C_Item.GetItemInventoryTypeByID = function(itemIdentifier)
      return select(6, GetItemInfo(itemIdentifier))
  end

  C_Item.GetItemInventoryType = function(itemLocation)
      local locType, bagID, slot = UnpackItemLocation(itemLocation)
      if locType == "bag" then
          return select(6, GetContainerItemInfo(bagID, slot))
      elseif locType == "equip" then
          return select(6, GetInventoryItemInfo("player", slot))
      end
  end

  C_Item.GetItemGUID = function(itemLocation)
      local locType, bagID, slot = UnpackItemLocation(itemLocation)
      if locType == "bag" then
          return GetContainerItemGUID(bagID, slot)
      elseif locType == "equip" then
          return GetInventoryItemGUID("player", slot)
      end
  end

  C_Item.IsItemDataCachedByID = function(itemIdentifier)
      return GetItemInfoInstant(itemIdentifier) ~= nil
  end

  C_Item.IsItemDataCached = function(itemLocation)
      local link = C_Item.GetItemLink(itemLocation)
      return link and GetItemInfoInstant(link) ~= nil
  end

  C_Item.RequestLoadItemDataByID = function(itemID)
      GetItemInfo(itemID)
  end
end
