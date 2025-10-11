if not C_Map then
  local HBD = LibStub("HereBeDragons-1.0")
  local HBDMigrate = LibStub("HereBeDragons-Migrate")
  local HBD_mapData = HBD.mapData

  -- Helper function to approximate Enum.UIMapType using HereBeDragons data heuristics.
  local function InferMapType(uiMapId, data)
      if uiMapId == WORLDMAP_COSMIC_ID then
          return Enum.UIMapType.Cosmic
      elseif uiMapId == WORLDMAP_AZEROTH_ID then
          return Enum.UIMapType.World
      elseif data.numFloors > 0 then
          -- Maps with multiple floors are usually instances/dungeons
          return Enum.UIMapType.Dungeon
      elseif data.C == 0 and data.Z == 0 and uiMapId ~= WORLDMAP_AZEROTH_ID then
          -- Continent level map
          return Enum.UIMapType.Continent
      elseif data.C > 0 and data.Z >= 0 then
          -- Standard zone maps
          return Enum.UIMapType.Zone
      else
          return Enum.UIMapType.Orphan
      end
  end

  local function GetMapInfoInternal(uiMapId)
      if not uiMapId or uiMapId < 0 then return nil end
      local data = HBD_mapData[uiMapId]
      if not data then return nil end

      local mapType = InferMapType(uiMapId, data)
      -- Approximate guess for isInstance based on map type or instance/originalInstance mismatch (phasing/micro dungeons)
      local isInstance = data.instance ~= data.originalInstance or mapType == Enum.UIMapType.Dungeon or mapType == Enum.UIMapType.Micro

      return {
          mapID = uiMapId,
          name = data.name,
          mapType = mapType,
          areaID = uiMapId, -- In Legion, uiMapId is equivalent to AreaMapID
          directory = data.mapFile,
          isInstance = isInstance,
          defaultDungeonFloor = data.fakefloor or 0,
          -- Many modern C_Map.GetMapInfo fields are missing as they are not available in the Legion client API.
      }
  end

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

      -- Use HBD to convert world coordinates back to local (0-1) coordinates for the given map ID (uiMapId).
      -- We assume floor 0 if not specified, which is generally acceptable for zone maps.
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

    GetMapInfo = GetMapInfoInternal,

    GetMapInfoFromMapID = GetMapInfoInternal,

    GetMapNameByID = function(uiMapId)
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
