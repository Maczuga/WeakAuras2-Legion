if not C_CurrencyInfo then
  C_CurrencyInfo = {
    GetCurrencyInfo = function (currencyID)
      local name, quantity, iconFileID, quantityEarnedThisWeek, maxWeeklyQuantity, maxQuantity, discovered, quality = GetCurrencyInfo(currencyID)

      return {
        name = name,
        description = "",
        currencyID = currencyID,
        isHeader = false,
        isHeaderExpanded = false,
        currencyListDepth = 0,
        isTypeUnused = false,
        isShowInBackpack = false,
        quantity = quantity,
        trackedQuantity = 0,
        iconFileID = iconFileID,
        maxQuantity = maxQuantity,
        canEarnPerWeek = maxWeeklyQuantity > 0,
        quantityEarnedThisWeek = quantityEarnedThisWeek,
        isTradeable = false,
        quality = quality,
        maxWeeklyQuantity = maxWeeklyQuantity,
        totalEarned = 0,
        discovered = discovered,
        useTotalEarnedForMaxQty = false,
        isAccountWide = false,
        isAccountTransferable = false,
        transferPercentage = nil,
        rechargingCycleDurationMS = 0,
        rechargingAmountPerCycle = 0,
      }
    end,

    GetCurrencyListSize = GetCurrencyListSize,

    ---@type fun(currencyLink: string): number?
    GetCurrencyIDFromLink = function(currencyLink)
      local currencyID = string.match(currencyLink, "|Hcurrency:(%d+):")
      return tonumber(currencyID)
    end,

    ---@type fun(index: number, expand: boolean)
    ExpandCurrencyList = function(index, expand)
      ExpandCurrencyList(index, expand and 1 or 0)
    end,

  ---@type fun(index: number): CurrencyInfo
    GetCurrencyListInfo = function(index)
      local name, isHeader, isExpanded, isUnused, isWatched, _, icon, _, hasWeeklyLimit, _, _, itemID = GetCurrencyListInfo(index)
      local currentAmount, earnedThisWeek, weeklyMax, totalMax, isDiscovered, rarity
      if itemID then
        _, currentAmount, _, earnedThisWeek, weeklyMax, totalMax, isDiscovered, rarity = GetCurrencyInfo(itemID)
      end
      local currencyInfo = {
        name = name,
        description = "",
        isHeader = isHeader,
        isHeaderExpanded = isExpanded,
        isTypeUnused = isUnused,
        isShowInBackpack = isWatched,
        quantity = currentAmount,
        trackedQuantity = 0,
        iconFileID = icon,
        maxQuantity = totalMax,
        canEarnPerWeek = hasWeeklyLimit,
        quantityEarnedThisWeek = earnedThisWeek,
        isTradeable = false,
        quality = rarity,
        maxWeeklyQuantity = weeklyMax,
        totalEarned = 0,
        discovered = isDiscovered,
        useTotalEarnedForMaxQty = false,
      }
      return currencyInfo
    end,
    -- Not needed since isAccountTransferable is always false
    -- IsAccountCharacterCurrencyDataReady,
    -- FetchCurrencyDataFromAccountCharacters,
    -- RequestCurrencyDataForAccountCharacters,
  }
end