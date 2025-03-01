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

-- IsAnchoringRestricted compatibility
local function IsAnchoringRestricted(frame)
    if not frame.IsAnchoringRestricted then
        function frame:IsAnchoringRestricted()
            return false
        end
    end
end

function ApplyFrameExtensions(frame)
    AddResizeBoundsCompatibility(frame)
    AddCooldownCompatibility(frame)
    EnableMouseMotionCompat(frame)
    IsAnchoringRestricted(frame)
end
