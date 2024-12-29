FrameExtensions = {}

-- Adds SetResizeBounds compatibility to frames
function FrameExtensions.AddResizeBoundsCompatibility(frame)
    if not frame.SetResizeBounds then
        function frame:SetResizeBounds(minWidth, minHeight, maxWidth, maxHeight)
            if minWidth and minHeight then
                self:SetMinResize(minWidth, minHeight)
            end
            if maxWidth and maxHeight then
                self:SetMaxResize(maxWidth, maxHeight)
            end
        end
    end
end

-- Adds CreateTexture compatibility to frames for textures
function FrameExtensions.AddTextureCompatibility(frame)
    -- Backup the original CreateTexture method for this frame
    local OriginalFrame_CreateTexture = frame.CreateTexture

    function frame:CreateTexture(name, layer, template, subLayer)
        -- Call the original CreateTexture method
        local texture = OriginalFrame_CreateTexture(self, name, layer, template, subLayer)

        -- Add SetTexelSnappingBias compatibility to textures
        if not texture.SetTexelSnappingBias then
            function texture:SetTexelSnappingBias(bias)
                -- No-op implementation for 7.3.5
            end
        end

        -- Add SetSnapToPixelGrid compatibility to textures
        if not texture.SetSnapToPixelGrid then
            function texture:SetSnapToPixelGrid(enable)
                -- No-op implementation for 7.3.5
            end
        end

        return texture
    end
end
