if not C_TaxiMap then
  C_TaxiMap = {}
end

function C_TaxiMap.GetAllTaxiNodes()
  if not GetAllTaxiNodes then
    return {}
  end

  local oldNodes = GetAllTaxiNodes()
  if not oldNodes then return {} end

  local newNodes = {}
  local currentMapID = GetCurrentMapAreaID()

  for slotIndex, oldNode in pairs(oldNodes) do
    local _, nodeMapID = TaxiNodeName(slotIndex)

    local newType
    if oldNode.type == 1 then
      newType = Enum.FlightPathState.Current
    elseif oldNode.type == 2 then
      newType = Enum.FlightPathState.Reachable
    else
      newType = Enum.FlightPathState.Unreachable
    end

    table.insert(newNodes, {
      name = oldNode.name,
      nodeID = oldNode.nodeID,
      mapID = nodeMapID or currentMapID,
      slot = oldNode.slotIndex,
      x = oldNode.x,
      y = oldNode.y,
      type = newType,
      isFlightPath = true,
    })
  end

  table.sort(newNodes, function(a, b) return a.slot < b.slot end)

  return newNodes
end
