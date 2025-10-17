if not C_Spell then
  C_Spell = {
    GetSpellInfo = function (spellIdentifier)
      local name, rank, icon, castTime, minRange, maxRange, returnedSpellID = GetSpellInfo(spellIdentifier)
      if not name then
        return nil
      end

      local spellInfo = {
        name = name,
        iconID = icon,
        castTime = castTime,
        minRange = minRange,
        maxRange = maxRange,
        originalIconID = icon,
      }

      if type(spellIdentifier) == "number" then
        spellInfo.spellID = spellIdentifier
      else
        spellInfo.spellID = returnedSpellID
      end

      if returnedSpellID then
        local baseSpellID = FindBaseSpellByID(returnedSpellID)
        if baseSpellID and baseSpellID ~= returnedSpellID then
          local originalIcon = GetSpellTexture(baseSpellID)
          if originalIcon then
            spellInfo.originalIconID = originalIcon
          end
        end
      end

      return spellInfo
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
    IsSpellDataCached = function(spellId)
      return select(1, GetSpellInfo(spellId)) ~= nil
    end,
    RequestLoadSpellData = function(spellId)
      GetSpellInfo(spellId)
    end,
    GetSpellIDForSpellIdentifier = function(spellIdentifier)
      if type(spellIdentifier) == "number" then
        return spellIdentifier
      elseif type(spellIdentifier) == "string" then
        local spellId
        -- Check if it's a spell link
        local linkMatch = string.match(spellIdentifier, "|Hspell:(%d+)")
        if linkMatch then
          spellId = tonumber(linkMatch)
        else
          -- It's a spell name, get its base ID
          spellId = select(7, GetSpellInfo(spellIdentifier))
          if spellId then
            -- Check for an override
            spellId = FindSpellOverrideByID(spellId)
          end
        end

        if spellId and GetSpellInfo(spellId) then
          return spellId
        end
      end
    end
  }
end