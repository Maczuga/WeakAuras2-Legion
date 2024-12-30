if not C_Map then
  local HBD = LibStub("HereBeDragons-1.0")
  C_Map = {
    GetBestMapForUnit = function(unit)
      if unit ~= "player" then return nil end
      local mapId = GetCurrentMapAreaID(unit)
      return mapId
    end,

    -- None of the following functions are implemented, but they are here to prevent errors
    GetMapInfo = function(uiMapId)
      return nil
    end,
    GetMapGroupID = function(uiMapId)
      -- Need to know exact values, so NYI and TODO
      return 0
    end,
    GetMapGroupMembersInfo = function(uiMapId)
      -- Same as above
      -- Need to know exact values, so NYI and TODO
      return nil
    end,
    GetMapChildrenInfo = function(uiMapId)
      -- Same as above
      -- Need to know exact values, so NYI and TODO
      return 0
    end,
    GetMapChildrenInfo = function(uiMapId)
      -- Same as above
      -- Need to know exact values, so NYI and TODO
      return {}
    end,
    GetAreaInfo = function(areaID)
      return nil
    end,
  }
end