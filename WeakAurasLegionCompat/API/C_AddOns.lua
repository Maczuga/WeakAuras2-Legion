if not C_AddOns then
    C_AddOns = {
        -- AddOn management functions
        DisableAddOn = DisableAddOn,
        DisableAllAddOns = DisableAllAddOns,
        DoesAddOnExist = DoesAddOnExist,
        EnableAddOn = EnableAddOn,
        EnableAllAddOns = EnableAllAddOns,
        GetAddOnDependencies = GetAddOnDependencies,
        GetAddOnEnableState = function(name, character)
            local state = GetAddOnEnableState(character, name)

            if state == 0 then
                return Enum.AddOnEnableState.None
            elseif state == 1 then
                return Enum.AddOnEnableState.Some
            elseif state == 2 then
                return Enum.AddOnEnableState.All
            end
        end,
        GetAddOnInfo = GetAddOnInfo,
        GetAddOnMetadata = GetAddOnMetadata,
        GetAddOnOptionalDependencies = GetAddOnOptionalDependencies,
        GetNumAddOns = GetNumAddOns,
        IsAddOnLoadable = IsAddOnLoadable,
        IsAddOnLoaded = IsAddOnLoaded,
        IsAddOnLoadOnDemand = IsAddOnLoadOnDemand,
        LoadAddOn = LoadAddOn,

        -- Add-on version checking
        IsAddonVersionCheckEnabled = function()
            -- This function may not exist in 7.3.5; provide a stub or custom logic if needed
            return false
        end,
        SetAddonVersionCheck = function(enabled)
            -- Stub function for version check; implement logic if required
            print("SetAddonVersionCheck is not implemented in this client.")
        end,

        -- Reset and save functions
        ResetAddOns = function()
            print("Resetting AddOns is not supported in this client.")
        end,
        ResetDisabledAddOns = function()
            print("Resetting disabled AddOns is not supported in this client.")
        end,
        SaveAddOns = function()
            print("Saving AddOns is not supported in this client.")
        end,

        -- Utility function for loading addons via UIParent (if applicable)
        UIParentLoadAddOn = UIParentLoadAddOn or function(addonName)
            local loaded, reason = LoadAddOn(addonName)
            if not loaded then
                print("Failed to load AddOn:", addonName, "-", reason)
            end
            return loaded
        end
    }
end
