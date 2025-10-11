if _G.WorldMapFrame and not _G.WorldMapFrame.GetMapID then
    _G.WorldMapFrame.GetMapID = function()
        return GetCurrentMapAreaID()
    end
end
