if not C_LossOfControl then
  C_LossOfControl = {}
end

if not C_LossOfControl.GetActiveLossOfControlDataCount then
  function C_LossOfControl.GetActiveLossOfControlDataCount()
    if C_LossOfControl.GetNumEvents then
      return C_LossOfControl.GetNumEvents()
    end
    return 0
  end
end
if not C_LossOfControl.GetActiveLossOfControlDataCountByUnit then
  function C_LossOfControl.GetActiveLossOfControlDataCountByUnit(unit)
    if UnitIsUnit(unit, "player") and C_LossOfControl.GetNumEvents then
      return C_LossOfControl.GetNumEvents()
    end
    return 0
  end
end

if not C_LossOfControl.GetActiveLossOfControlData then
  function C_LossOfControl.GetActiveLossOfControlData(index)
    if not C_LossOfControl.GetEventInfo then
      return nil
    end

    local locType, spellID, displayText, iconTexture, startTime, timeRemaining, duration, lockoutSchool, priority, displayType = C_LossOfControl.GetEventInfo(index)
    if not locType then
      return nil
    end

    return {
      locType = locType,
      spellID = spellID,
      displayText = displayText,
      iconTexture = iconTexture,
      startTime = startTime,
      timeRemaining = timeRemaining,
      duration = duration,
      lockoutSchool = lockoutSchool,
      priority = priority,
      displayType = displayType,
    }
  end
end

if not C_LossOfControl.GetActiveLossOfControlDataByUnit then
  function C_LossOfControl.GetActiveLossOfControlDataByUnit(unitToken, index)
    if UnitIsUnit(unitToken, "player") then
      return C_LossOfControl.GetActiveLossOfControlData(index)
    end
    return nil
  end
end
