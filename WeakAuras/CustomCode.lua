local WeakAuras = WeakAuras

---@return boolean result
function WeakAuras.IsLegion()
  return WeakAuras.BuildInfo >= 70000 and WeakAuras.BuildInfo < 80000
end

---@return boolean result
function WeakAuras.UseTableTalents()
  return WeakAuras.BuildInfo >= 50000 and WeakAuras.BuildInfo < 100000
end

---@return boolean result
function WeakAuras.IsRetailTalents()
  return WeakAuras.BuildInfo >= 100000
end

---@return boolean result
function WeakAuras.HasWarMode()
  return WeakAuras.BuildInfo >= 80000
end

---@return boolean result
function WeakAuras.HasSkyriding()
  return WeakAuras.BuildInfo >= 100000
end

---@return boolean result
function WeakAuras.HasEmpowerCasting()
  return WeakAuras.BuildInfo >= 100000
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