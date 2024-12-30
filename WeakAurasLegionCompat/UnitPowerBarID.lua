if not UnitPowerBarID then
  function UnitPowerBarID(unit)
    return 0;
    -- Not sure about belove, because this returns resource ID not power bar ID
    -- Since it's only used to detect Dragonriding, it should be fine
    -- return select(1, UnitPowerType(unit))
  end
end
