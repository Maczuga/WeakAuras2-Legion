if not C_QuestLog then
  local scanningTooltip = CreateFrame("GameTooltip", "WeakAurasLegionCompatQuestScanningTooltip", UIParent, "GameTooltipTemplate")
  local questTitleCache = {}
  local scanningTooltipTextLeft1 = _G[scanningTooltip:GetName() .. "TextLeft1"]

  C_QuestLog = {
    GetNumQuestLogEntries = GetNumQuestLogEntries,
    AddQuestWatch = AddQuestWatch,
    GetLogIndexForQuestID = GetQuestLogIndexByID,
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
    GetTitleForQuestID = function(questID)
      if not questID then
        return nil
      end
      if questTitleCache[questID] then
        return questTitleCache[questID]
      end

      scanningTooltip:SetOwner(UIParent, "ANCHOR_NONE")
      scanningTooltip:SetHyperlink("quest:"..questID)
      local title = scanningTooltipTextLeft1:GetText()
      scanningTooltip:Hide()
      if title and title ~= RETRIEVING_DATA then
        questTitleCache[questID] = title
        return title
      end
    end,
    GetNumQuestObjectives = function(questID)
      return #C_QuestLog.GetQuestObjectives(questID)
    end,
    GetQuestObjectives = function(questID)
      if not questID then
        return {}
      end

      local objectives = {}
      local pendingObjectives = {}
      local index = 1

      while index <= 50 do
        local description, type, finished, numFulfilled, numRequired = GetQuestObjectiveInfo(questID, index, false)

        if not description then
          table.insert(pendingObjectives, {
            text = description,
            type = type,
            numFulfilled = numFulfilled,
            numRequired = numRequired,
            finished = finished,
          })
          if #pendingObjectives >= 3 then
            break
          end
        else
          for _, obj in ipairs(pendingObjectives) do
            table.insert(objectives, obj)
          end
          pendingObjectives = {}

          if type and type == "log" and finished and numFulfilled == numRequired then
            break
          end

          table.insert(objectives, {
            text = description,
            type = type,
            numFulfilled = numFulfilled,
            numRequired = numRequired,
            finished = finished,
          })
        end
        index = index + 1
      end
      return objectives
    end,
  }
end