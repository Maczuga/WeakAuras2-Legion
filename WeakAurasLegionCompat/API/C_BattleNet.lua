if not C_BattleNet then
    C_BattleNet = {
      GetFriendNumGameAccounts = function (friendIndex)
        local numGameAccounts = BNGetNumFriendGameAccounts(friendIndex)
        return numGameAccounts
      end,
      GetFriendGameAccountInfo = function (friendIndex, accountIndex)
        local hasFocus, characterName, client, realmName, realmID, faction, race, class, guild, zoneName, level, gameText, broadcastText, broadcastTime, canSoR, toonID, bnetIDAccount, isGameAFK, isGameBusy = BNGetFriendGameAccountInfo(i, j)
        if not characterName then
          return nil
        end

        return {
          gameAccountID = toonID,
          clientProgram = client,
          isOnline = true,
          isGameBusy = isGameBusy,
          isGameAFK = isGameAFK,
          wowProjectID = 1, -- WOW_PROJECT_MAINLINE
          characterName = characterName,
          realmName = realmName,
          realmDisplayName = realmName,
          realmID = realmID,
          factionName = faction,
          raceName = race,
          className = class,
          areaName = zoneName,
          characterLevel = level,
          richPresence = gameText,
          playerGuid = nil, -- Not provided by BNGetFriendGameAccountInfo
          canSummon = canSoR,
          hasFocus = hasFocus,
          regionID = 3, -- 1 = NORTH_AMERICA, 2 = KOREA, 3 = EUROPE, 4 = TAIWAN, 5 = CHINA
          isInCurrentRegion = true, -- Assuming same region
          timerunningSeasonID = nil, -- Not provided by BNGetFriendGameAccountInfo
          }
      end,
    }
end