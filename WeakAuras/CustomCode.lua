local WeakAuras = WeakAuras

---@return boolean result
function WeakAuras.IsLegion()
  return WeakAuras.BuildInfo >= 70000 and WeakAuras.BuildInfo < 80000
end

---@return boolean result
function WeakAuras.IsClassicOrCataOrMistsAndNotLegion()
  return WeakAuras.IsClassicOrCataOrMists() and not WeakAuras.IsLegion()
end

---@return boolean result
function WeakAuras.IsCataOrMistsAndNotLegion()
  return WeakAuras.IsCataOrMists() and not WeakAuras.IsLegion()
end

--- Use in place of WeakAuras.IsMists()
---@return boolean result
function WeakAuras.IsMistsOrLegion()
  return WeakAuras.IsMists() or WeakAuras.IsLegion()
end

--- Use in place of WeakAuras.IsRetail() (when needed ofc)
---@return boolean result
function WeakAuras.IsLegionOrRetail()
  return WeakAuras.IsRetail() or WeakAuras.IsLegion()
end

if WeakAuras.IsLegion() then
  ---@param index integer
  ---@param extraOption boolean?
  ---@return boolean? hasTalent
  function WeakAuras.CheckTalentByIndex(index, extraOption)
    local tier = ceil(index / 3)
    local column = (index - 1) % 3 + 1
    local _, _, _, selected, _, _, _, _, _, _, known  = GetTalentInfo(tier, column, 1)
    local result =  selected or known;
    if extraOption == 4 then
      return result
    elseif extraOption == 5 then
      return not result
    end
    return result;
  end
end

if not NamePlateDriverFrame.classNamePlatePowerBar then
  NamePlateDriverFrame.classNamePlatePowerBar = NamePlateDriverFrame.nameplateManaBar
end