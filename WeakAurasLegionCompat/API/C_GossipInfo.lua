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

      local gossipQuests = { GetGossipAvailableQuests() }

      for i = 1, numQuests do
        local title, questLevel, isTrivial, frequency, isRepeatable, isLegendary, isIgnored = select((i - 1) * 7 + 1, unpack(gossipQuests))

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
            questID = nil, -- Not available in 735 API
            isImportant = false,
            isMeta = false,
          })
        end
      end
      return quests
    end,
    GetActiveQuests = function()
      local quests = {}
      local numQuests = GetNumGossipActiveQuests()
      if not numQuests or numQuests == 0 then
        return quests
      end

      local questTitleToInfo = {}
      local numEntries, _ = GetNumQuestLogEntries()
      for i = 1, numEntries do
        local title, _, _, _, _, _, frequency, questID = GetQuestLogTitle(i)
        if title and questID then
          questTitleToInfo[title] = { questID = questID, frequency = frequency }
        end
      end

      local gossipQuests = { GetGossipActiveQuests() }
      for i=1, numQuests do
        local title, questLevel, isTrivial, isComplete, isLegendary, isIgnored = select((i - 1) * 6 + 1, unpack(gossipQuests))

        local info = questTitleToInfo[title]
        if title and info then
          local questFrequency = nil
          local repeatable = false
          if info.frequency then
            if info.frequency == 2 then
              questFrequency = 0
              repeatable = true
            elseif info.frequency == 3 then
              questFrequency = 1
              repeatable = true
            end
          end

          table.insert(quests, {
            title = title,
            questLevel = questLevel,
            isTrivial = isTrivial,
            frequency = questFrequency,
            repeatable = repeatable,
            isComplete = isComplete,
            isLegendary = isLegendary,
            isIgnored = isIgnored,
            questID = info.questID,
          })
        end
      end
      return quests
    end,
    SelectActiveQuest = function(questID)
      local numQuests = GetNumGossipActiveQuests()
      if not numQuests or numQuests == 0 then
        return
      end

      local questTitleToQuestID = {}
      local numEntries, _ = GetNumQuestLogEntries()
      for i = 1, numEntries do
        local title, _, _, _, _, _, _, logQuestID = GetQuestLogTitle(i)
        if title and logQuestID then
          questTitleToQuestID[title] = logQuestID
        end
      end

      local gossipQuests = { GetGossipActiveQuests() }
      for i = 1, numQuests do
        local title = select((i - 1) * 6 + 1, unpack(gossipQuests))
        if title and questTitleToQuestID[title] == questID then
          SelectGossipActiveQuest(i)
          return
        end
      end
    end,
  }
end

