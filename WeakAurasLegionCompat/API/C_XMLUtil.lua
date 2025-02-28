if not C_XMLUtil then
  local templateInfo = {
    ["BaseLayoutFrameTemplate"] = {
      type = "Frame",
      width = 0,
      height = 0,
      keyValues = {
      }
    },
    ["ResizeLayoutFrame"] = {
      type = "Frame",
      width = 1,
      height = 1,
      inherits = "BaseLayoutFrameTemplate",
      keyValues = {
      }
    },
    ["MenuTemplateBase"] = {
      type = "Frame",
      width = 1,
      height = 1,
      inherits = "ResizeLayoutFrame",
      keyValues = {
        { key = "minimumWidth", keyType = "string", type = "number", value = "70" },
        { key = "minimumElementWidth", keyType = "string", type = "number", value = "50" },
        { key = "ignoreAllChildren", keyType = "string", type = "boolean", value = "true" },
        { key = "skipChildLayout", keyType = "string", type = "boolean", value = "true" }
      }
    },
    ["WeakAurasProfilingLineTemplate"] = {
      type = "Frame",
      height = 20,
      width = 0,
      inherits = "ResizeLayoutFrame",
      keyValues = {
      }
    },
  }
  -- /dump C_XMLUtil.GetTemplateInfo("Button")
  -- /dump C_XMLUtil.GetTemplateInfo("WeakAurasProfilingLineTemplate")
  C_XMLUtil = {
    GetTemplateInfo = function(name)
      local result = templateInfo[name]
      if not result then
        print("C_XMLUtil.GetTemplateInfo: No template info found for: '", name ,"'")
        print("Please add the template info to the C_XMLUtil.lua file")
        return nil
      end

      return templateInfo[name]
    end
  };
end