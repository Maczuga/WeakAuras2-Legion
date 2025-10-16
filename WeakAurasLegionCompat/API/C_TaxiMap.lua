if not C_TaxiMap then
  C_TaxiMap = {}
end

function C_TaxiMap.GetAllTaxiNodes(uiMapId)
  if not GetAllTaxiNodes then
    return {}
  end

  local oldNodes = GetAllTaxiNodes()
  if not oldNodes then return {} end

  local newNodes = {}
  local currentMapID = GetCurrentMapAreaID()

  for slotIndex, oldNode in pairs(oldNodes) do
    local state
    if oldNode.type == 1 then
      state = Enum.FlightPathState.Current
    elseif oldNode.type == 2 then
      state = Enum.FlightPathState.Reachable
    else
      state = Enum.FlightPathState.Unreachable
    end

    table.insert(newNodes, {
      nodeID = oldNode.nodeID,
      position = {
        x = oldNode.x,
        y = oldNode.y,
      },
      name = oldNode.name,
      state = state,
      mapID = currentMapID,
      slotIndex = oldNode.slotIndex,
      useSpecialIcon = false,
      specialIconCostString = nil,
      isMapLayerTransition = false,
    })
  end

  table.sort(newNodes, function(a, b) return a.slotIndex < b.slotIndex end)

  return newNodes
end
