if not C_PvP then
  C_PvP = {
    IsWarModeDesired = function()
      return false
    end,
    IsRatedBattleground = IsRatedBattleground,
  }
end