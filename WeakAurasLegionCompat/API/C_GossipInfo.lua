if not C_GossipInfo then
  local gossipTypeToIcon = {
    banker = 132051,
    battlemaster = 132050,
    binder = 132052,
    gossip = 132053,
    healer = 132054,
    petition = 132056,
    tabard = 132057,
    taxi = 132058,
    trainer = 132059,
    unlearn = 132061,
    vendor = 132060,
  }

  local function GetOptions_Backport()
    local oldOptions = { GetGossipOptions() }
    local newOptions = {}

    if #oldOptions == 0 then
      return newOptions
    end

    for i = 1, #oldOptions, 2 do
      local name = oldOptions[i]
      local type = oldOptions[i+1]
      local index = (i + 1) / 2

      local optionInfo = {
        gossipOptionID = index,
        name = name,
        icon = gossipTypeToIcon[type] or gossipTypeToIcon["gossip"],
        rewards = {},
        status = 0, -- Enum.GossipOptionStatus.Available
        spellID = nil,
        flags = 0,
        overrideIconID = nil,
        selectOptionWhenOnlyOption = false,
        orderIndex = index,
      }
      table.insert(newOptions, optionInfo)
    end

    return newOptions
  end

  C_GossipInfo = {
    GetOptions = GetOptions_Backport,
    SelectOption = SelectGossipOption,
    SelectOptionByIndex = SelectGossipOption,
    GetAvailableQuests = function()
      local quests = {}
      local numQuests = GetNumGossipAvailableQuests()
      if not numQuests or numQuests == 0 then
        return quests
      end

      for i = 1, numQuests do
        local title, questLevel, isTrivial, frequency, isRepeatable, isLegendary, isIgnored, questID = GetGossipAvailableQuestInfo(i)

        if title then
          table.insert(quests, {
            title = title,
            questLevel = questLevel,
            isTrivial = isTrivial,
            frequency = frequency,
            repeatable = isRepeatable,
            isComplete = nil,
            isLegendary = isLegendary,
            isIgnored = isIgnored,
            questID = questID,
            isImportant = false,
            isMeta = false,
          })
        end
      end
      return quests
    end,
  }
end

