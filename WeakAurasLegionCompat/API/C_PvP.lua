if not C_PvP then
  C_PvP = {}
end
C_PvP.IsWarModeDesired = function()
  return false
end

C_PvP.IsWarModeActive = function()
  return false
end

C_PvP.IsRatedArena = function()
  local inInstance, type = IsInInstance()
  if not inInstance then
    return false
  end

  if size ~= "arena" then
    return false
  end

  -- I don't know it that can be done any better
  return not IsArenaSkirmish()
end

C_PvP.IsRatedBattleground = IsRatedBattleground
