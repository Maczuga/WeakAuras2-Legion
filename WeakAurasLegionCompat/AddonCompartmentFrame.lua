-- This is not really gonna be used, this is the addon button grabber implemented in Dragonflight UI
if not AddonCompartmentFrame then
    AddonCompartmentFrame = {
        registeredAddons = {}
    }
end

function AddonCompartmentFrame:RegisterAddon(addonData)
    if not addonData or type(addonData) ~= "table" then
        print("AddonCompartmentFrame:RegisterAddon: Invalid addon data.")
        return
    end

    -- Validate required fields
    if not addonData.text or not addonData.func then
        print("AddonCompartmentFrame:RegisterAddon: 'text' and 'func' fields are required.")
        return
    end

    -- Add the addon to the registered list
    table.insert(self.registeredAddons, addonData)

    -- Simulate functionality by printing the registered addon
    print("Registered Addon:", addonData.text)
end

function AddonCompartmentFrame:ShowRegisteredAddons()
    print("Registered Addons in AddonCompartmentFrame:")
    for _, addon in ipairs(self.registeredAddons) do
        print("- " .. addon.text)
    end
end