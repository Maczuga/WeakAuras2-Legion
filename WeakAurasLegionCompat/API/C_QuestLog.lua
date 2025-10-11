if not C_QuestLog then
  local function getQuestLogIndexForQuestID(questIDToFind)
    if not questIDToFind then
      return nil
    end

    local numEntries, _ = GetNumQuestLogEntries()
    for i=1, numEntries do
      if select(8, GetQuestLogTitle(i)) == questIDToFind then
        return i
      end
    end
  end

  C_QuestLog = {
    GetNumQuestLogEntries = GetNumQuestLogEntries,
    GetQuestIDForLogIndex = function(i)
      return select(8, GetQuestLogTitle(i))
    end,
    IsComplete = IsQuestComplete,
    IsQuestFlaggedCompleted = IsQuestFlaggedCompleted,
    ReadyForTurnIn = function() return false end,
    GetAllCompletedQuestIDs = function() return GetQuestsCompleted() end,
    GetInfo = function(questLogIndex)
      local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isBounty, isStory, isHidden, isScaling = GetQuestLogTitle(questLogIndex)
      if not title then
        return nil
      end

      local questFrequency
      if frequency then
        questFrequency = frequency - 1
      end

      return {
        title = title,
        questLogIndex = questLogIndex,
        questID = questID,
        campaignID = nil,
        level = level,
        difficultyLevel = level,
        suggestedGroup = suggestedGroup,
        frequency = questFrequency,
        isHeader = isHeader,
        useMinimalHeader = false,
        isCollapsed = isCollapsed,
        startEvent = startEvent,
        isTask = isTask,
        isBounty = isBounty,
        isStory = isStory,
        isScaling = isScaling,
        isOnMap = isOnMap,
        hasLocalPOI = hasLocalPOI,
        isHidden = isHidden,
        isAutoComplete = false,
        overridesSortOrder = false,
        readyForTranslation = true,
        isLegendarySort = false,
      }
    end,
    GetTitleForQuestID = function(questIDToFind)
      if not questIDToFind then
        return nil
      end

      local numEntries, _ = GetNumQuestLogEntries()
      for i=1, numEntries do
        local title, _, _, _, _, _, _, questID = GetQuestLogTitle(i)
        if questID and questID == questIDToFind then
          return title
        end
      end
    end,
    GetNumQuestObjectives = function(questID)
      if not questID then
        return 0
      end

      local questLogIndex = getQuestLogIndexForQuestID(questID)
      if not questLogIndex then
        return 0
      end

      local numObjectives = 0
      while true do
        local description = GetQuestObjectiveInfo(questLogIndex, numObjectives + 1, false)
        if description and description ~= "" then
          numObjectives = numObjectives + 1
        else
          return numObjectives
        end
      end
    end,
    GetQuestObjectives = function(questID)
      if not questID then
        return {}
      end

      local questLogIndex = getQuestLogIndexForQuestID(questID)
      if not questLogIndex then
        return {}
      end

      local objectives = {}
      local index = 1
      while true do
        local description, type, finished, numFulfilled, numRequired = GetQuestObjectiveInfo(questLogIndex, index, false)
        if not description or description == "" then
          break
        end

        table.insert(objectives, {
          text = description,
          type = type,
          numFulfilled = numFulfilled,
          numRequired = numRequired,
          finished = finished,
        })
        index = index + 1
      end
      return objectives
    end,
  }
end