if not C_Spell then
  C_Spell = {
    GetSpellInfo = function (spellIdentifier)
    end,
    GetSpellName = function (spellIdentifier)
      return select(1, GetSpellInfo(spellIdentifier))
    end,
    GetSpellTexture = GetSpellTexture,
    IsSpellUsable = IsUsableSpell,
    GetSpellCooldown = function (spellIdentifier)
      local startTime, duration, isEnabled, modRate = GetSpellCooldown(spellIdentifier)
      return {
        startTime = startTime,
        duration = duration,
        isEnabled = isEnabled,
        modRate = modRate,
      }
    end,
    GetSpellLossOfControlCooldown = GetSpellLossOfControlCooldown,
    GetSpellCastCount = GetSpellCount,
    GetOverrideSpell = FindSpellOverrideByID,
    GetSpellPowerCost = GetSpellPowerCost,
    GetSchoolString = GetSchoolString,
    GetSpellLink = GetSpellLink,
  }
end