local WeakAuras = WeakAuras

---@return boolean result
function WeakAuras.IsLegion()
  return WeakAuras.BuildInfo >= 70000 and WeakAuras.BuildInfo < 80000
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
