-- Backport GetClassAtlas for WoW 7.3.5
if not GetClassAtlas then
    function GetClassAtlas(className)
        -- Define a mapping of class names to atlas paths
        local classAtlases = {
            ["DEATHKNIGHT"] = "classicon-deathknight",
            ["DEMONHUNTER"] = "classicon-demonhunter",
            ["DRUID"] = "classicon-druid",
            ["HUNTER"] = "classicon-hunter",
            ["MAGE"] = "classicon-mage",
            ["MONK"] = "classicon-monk",
            ["PALADIN"] = "classicon-paladin",
            ["PRIEST"] = "classicon-priest",
            ["ROGUE"] = "classicon-rogue",
            ["SHAMAN"] = "classicon-shaman",
            ["WARLOCK"] = "classicon-warlock",
            ["WARRIOR"] = "classicon-warrior",
        }

        -- Return the atlas path for the given class name
        return classAtlases[className:upper()]
    end
end
