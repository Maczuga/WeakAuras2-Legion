-- Backup the original CreateFrame function
local OriginalCreateFrame = CreateFrame

-- Custom CreateFrame function
function CreateFrame(frameType, frameName, parent, template, id)
    -- Create the frame using the original function
    local frame = OriginalCreateFrame(frameType, frameName, parent, template, id)

    ApplyFrameExtensions(frame)

    return frame
end