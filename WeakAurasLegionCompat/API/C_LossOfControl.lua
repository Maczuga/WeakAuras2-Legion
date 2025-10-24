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
