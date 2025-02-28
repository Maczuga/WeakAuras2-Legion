-- Adds SetResizeBounds compatibility to frames
local function AddResizeBoundsCompatibility(frame)
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
local function AddTextureCompatibility(frame)
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

-- Adds Pause/Resume cooldown compatibility to frames for cooldowns
local function AddCooldownCompatibility(frame)
    if not frame.Pause then
        function frame:Pause()
            -- self:SetDrawBling(false)
        end
    end

    if not frame.Resume then
        function frame:Resume()
            -- self:SetDrawBling(true)
        end
    end
end

local function EnableMouseMotionCompat(frame)
    if not frame.EnableMouseMotion then
        function frame:EnableMouseMotion(enable)
            if enable then
                self:EnableMouse(true)
                self:RegisterForDrag("LeftButton")
            else
                self:EnableMouse(false)
                self:RegisterForDrag()
            end
        end
    end
end

-- Adds GetWindow and SetWindow compatibility to frames
-- local function AddWindowCompatibility(frame)
--     local FrameToWindowRegistry = {}
--     if not frame.GetWindow then
--         function frame:GetWindow()
--             local window = FrameToWindowRegistry[self]
--             if not window then
--                 -- If no window is explicitly set, return the topmost parent frame as the default "window"
--                 local parent = self:GetParent()
--                 while parent do
--                     window = parent
--                     parent = parent:GetParent()
--                 end
--             end
--             return window or UIParent
--         end
--     end

--     if not frame.SetWindow then
--         function frame:SetWindow(window)
--             if not window or type(window) ~= "table" then
--                 error("SetWindow: 'window' must be a valid frame", 2)
--             end
--             FrameToWindowRegistry[self] = window
--         end
--     end
-- end

-- GetPointByName compatibility
local function GetPointByName(frame)
    if not frame.GetPointByName then
        function frame:GetPointByName(pointName)
            for i = 1, frame:GetNumPoints() do
                local point, relativeTo, relativePoint, x, y = frame:GetPoint(i)
                if point == pointName then
                    return point, relativeTo, relativePoint, x, y
                end
            end
        end
    end
end

function ApplyFrameExtensions(frame)
    AddResizeBoundsCompatibility(frame)
    AddTextureCompatibility(frame)
    AddCooldownCompatibility(frame)
    EnableMouseMotionCompat(frame)
    -- AddWindowCompatibility(frame)
    GetPointByName(frame)
end
