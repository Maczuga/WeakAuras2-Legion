if not C_Map then
  local HBD = LibStub("HereBeDragons-1.0")
  local HBDMigrate = LibStub("HereBeDragons-Migrate")

  local function getCanonicalMapID(mapID)
    if not mapID then return nil end

    local canonicalID = HBDMigrate:GetUIMapIDFromMapAreaId(mapID)
    if canonicalID then
      return canonicalID
    end

    local _, _, mapFile = GetAreaMapInfo(mapID)
    return HBDMigrate:GetUIMapIDFromMapFile(mapFile) or mapID
  end

  C_Map = {
    GetBestMapForUnit = function(unit)
      if unit ~= "player" then return nil end
      local mapID = HBD:GetPlayerZone()
      return getCanonicalMapID(mapID)
    end,

    GetPlayerMapPosition = function(uiMapId, unitToken)
      if unitToken ~= "player" then return nil, nil end

      local x_world, y_world, instanceID = HBD:GetPlayerWorldPosition()
      if not x_world or not y_world then return nil, nil end

      local x, y = HBD:GetZoneCoordinatesFromWorld(x_world, y_world, uiMapId, 0, true)

      return {
        x = x,
        y = y,
      }
    end,

    GetWorldPosFromMapPos = function(uiMapID, mapPosition)
        if not uiMapID or not mapPosition or type(mapPosition.x) ~= "number" or type(mapPosition.y) ~= "number" then
            return nil, nil
        end

        local worldX, worldY, instanceID = HBD:GetWorldCoordinatesFromZone(mapPosition.x, mapPosition.y, uiMapID, nil)

        if not worldX then
            return nil, nil
        end

        return instanceID, CreateVector2D(worldX, worldY)
    end,

    GetMapInfo = function(mapId)
        local mapData = WeakAurasLegionCompat.C_Map_Data[mapId]
        if not mapData then
            return nil
        end

        return mapData
    end,

    GetMapInfoFromMapID = function(mapId)
      local mapData = WeakAurasLegionCompat.C_Map_Data[mapId]
      if not mapData then
          return nil
      end

      return mapData
    end,


    GetMapNameByID = function(uiMapId)
        local mapData = WeakAurasLegionCompat.C_Map_Data[uiMapId]
        if mapData then
            return mapData.name
        end
        return HBD:GetLocalizedMap(uiMapId)
    end,

    -- None of the following functions are implemented, but they are here to prevent errors
    GetMapGroupID = function(uiMapId)
      -- Need exact values, so NYI
      return 0
    end,
    GetMapGroupMembersInfo = function(uiMapId)
      -- Need exact values, so NYI
      return {}
    end,
    GetMapChildrenInfo = function(uiMapId)
      -- Need exact values, so NYI
      return {}
    end,
    GetAreaInfo = function(areaID)
      return nil
    end,
  }
end
