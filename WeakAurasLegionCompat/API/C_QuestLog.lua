if not C_QuestLog then
  C_QuestLog = {
    GetNumQuestLogEntries = GetNumQuestLogEntries,
    GetQuestIDForLogIndex = function(i)
      return select(8, GetQuestLogTitle(i))
    end,
    IsComplete = IsQuestComplete,
    ReadyForTurnIn = function() return false end,
  }
end