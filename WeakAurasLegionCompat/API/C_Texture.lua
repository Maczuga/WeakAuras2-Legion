if not C_Texture then
    C_Texture = {
        GetAtlasInfo = function(atlas)
            local file, width, height, left, right, top, bottom, tilesH, tilesV = GetAtlasInfo(atlas)

            if file then
                return {
                    width = width,
                    height = height,
                    leftTexCoord = left,
                    rightTexCoord = right,
                    topTexCoord = top,
                    bottomTexCoord = bottom,
                    tilesHorizontally = tilesH,
                    tilesVertically = tilesV,
                    file = file,
                }
            end
        end
    }
end
