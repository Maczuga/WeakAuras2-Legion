if not C_UnitAuras then
    C_UnitAuras = {}
end

if not C_UnitAuras.GetPlayerAuraBySpellID then
    function C_UnitAuras.GetPlayerAuraBySpellID(spellIdToFind)
        do
            local i = 1
            while true do
                local allReturns = {UnitBuff("player", i)}
                if not allReturns[1] then break end

                local name, _, icon, count, dispelType, duration, expirationTime, source, isStealable, _, spellId, canApplyAura, isBossDebuff, _, nameplateShowPersonal, nameplateShowAll = unpack(allReturns)

                if spellId == spellIdToFind then
                    local points = {}
                    for j = 17, #allReturns do
                        table.insert(points, allReturns[j])
                    end

                    local isFromPlayerOrPlayerPet = false
                    if source then
                        if UnitIsPlayer(source) then
                            isFromPlayerOrPlayerPet = true
                        else
                            local owner = UnitOwner(source)
                            if owner and UnitIsPlayer(owner) then
                                isFromPlayerOrPlayerPet = true
                            end
                        end
                    end

                    return {
                        name = name,
                        icon = icon,
                        applications = count,
                        dispelName = dispelType,
                        duration = duration,
                        expirationTime = expirationTime,
                        sourceUnit = source,
                        isStealable = isStealable,
                        spellId = spellId,
                        canApplyAura = canApplyAura,
                        isBossAura = isBossDebuff,
                        isFromPlayerOrPlayerPet = isFromPlayerOrPlayerPet,
                        nameplateShowPersonal = nameplateShowPersonal,
                        nameplateShowAll = nameplateShowAll,
                        isHelpful = true,
                        isHarmful = false,
                        auraInstanceID = i,
                        points = points,
                        charges = 0,
                        isNameplateOnly = false,
                        isRaid = false,
                        maxCharges = 0,
                        timeMod = 1,
                    }
                end
                i = i + 1
            end
        end

        do
            local i = 1
            while true do
                local allReturns = {UnitDebuff("player", i)}
                if not allReturns[1] then break end

                local name, _, icon, count, dispelType, duration, expirationTime, source, isStealable, _, spellId, canApplyAura, isBossDebuff, _, nameplateShowPersonal, nameplateShowAll = unpack(allReturns)

                if spellId == spellIdToFind then
                    local points = {}
                    for j = 17, #allReturns do
                        table.insert(points, allReturns[j])
                    end

                    local isFromPlayerOrPlayerPet = false
                    if source then
                        if UnitIsPlayer(source) then
                            isFromPlayerOrPlayerPet = true
                        else
                            local owner = UnitOwner(source)
                            if owner and UnitIsPlayer(owner) then
                                isFromPlayerOrPlayerPet = true
                            end
                        end
                    end

                    return {
                        name = name,
                        icon = icon,
                        applications = count,
                        dispelName = dispelType,
                        duration = duration,
                        expirationTime = expirationTime,
                        sourceUnit = source,
                        isStealable = isStealable,
                        spellId = spellId,
                        canApplyAura = canApplyAura,
                        isBossAura = isBossDebuff,
                        isFromPlayerOrPlayerPet = isFromPlayerOrPlayerPet,
                        nameplateShowPersonal = nameplateShowPersonal,
                        nameplateShowAll = nameplateShowAll,
                        isHelpful = false,
                        isHarmful = true,
                        auraInstanceID = i,
                        points = points,
                        charges = 0,
                        isNameplateOnly = false,
                        isRaid = false,
                        maxCharges = 0,
                        timeMod = 1,
                    }
                end
                i = i + 1
            end
        end

        return nil
    end
end

if not GetPlayerAuraBySpellID then
    local function GetPlayerAuraBySpellID_Legacy(spellID)
        local aura = C_UnitAuras.GetPlayerAuraBySpellID(spellID)
        if aura then
            return aura.name, aura.icon, aura.applications, aura.dispelName, aura.duration, aura.expirationTime, aura.sourceUnit, aura.isStealable, aura.nameplateShowPersonal, aura.spellId, aura.canApplyAura, aura.isBossAura, aura.isFromPlayerOrPlayerPet, aura.nameplateShowAll, aura.timeMod, unpack(aura.points)
        end
        return nil
    end
    GetPlayerAuraBySpellID = GetPlayerAuraBySpellID_Legacy
end
