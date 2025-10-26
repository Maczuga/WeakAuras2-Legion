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
      local currencyID = string.match(currencyLink, "|Hcurrency:(%d+)|h")
      return tonumber(currencyID)
    end,

    ---@type fun(index: number, expand: boolean)
    ExpandCurrencyList = function(index, expand)
      ExpandCurrencyList(index, expand and 1 or 0)
    end,

    ---@type fun(index: number): CurrencyInfo
    GetCurrencyListInfo = function(index)
        local name, isHeader, isHeaderExpanded, isUnused, isShowInBackpack, quantity, iconFileID, maxQuantity, canEarnPerWeek, quantityEarnedThisWeek, atWeeklyLimit = GetCurrencyListInfo(index)

        if not name then
            return nil
        end

        local currencyInfo = {
            name = name,
            isHeader = isHeader
            isHeaderExpanded = isHeaderExpanded,
            isTypeUnused = isUnused,
            isShowInBackpack = isShowInBackpack,
            quantity = quantity,
            iconFileID = iconFileID,
            maxQuantity = maxQuantity,
            canEarnPerWeek = canEarnPerWeek,
            quantityEarnedThisWeek = quantityEarnedThisWeek,

            description = "",
            trackedQuantity = 0,
            isTradeable = false,
            quality = 1, -- TODO - could in theory get from GetCurrencyInfo (last param) but we don't have link nor ID.
            maxWeeklyQuantity = 0,
            totalEarned = 0,
            discovered = true,
            useTotalEarnedForMaxQty = false,
        }

        return currencyInfo
    end,
    GetCoinIcon = GetCoinIcon,
    GetCurrencyListLink = GetCurrencyListLink,
    -- Not needed since isAccountTransferable is always false
    -- IsAccountCharacterCurrencyDataReady,
    -- FetchCurrencyDataFromAccountCharacters,
    -- RequestCurrencyDataForAccountCharacters,
  }
end