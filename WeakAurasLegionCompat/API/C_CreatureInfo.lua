if not C_CreatureInfo then

  local LibBabbleRace = LibStub("LibBabble-Race-3.0");
  local LBR_Locale = LibBabbleRace:GetUnstrictLookupTable()
  local LBR_Base = LibBabbleRace:GetBaseLookupTable();

  local function LBR(key)
    return LBR_Locale[key] or LBR_Base[key];
  end

  local raceInfo = {
    [1] = {raceID = 1, raceName = LBR("Human"), clientFileString = "Human"},
    [2] = {raceID = 2, raceName = LBR("Orc"), clientFileString = "Orc"},
    [3] = {raceID = 3, raceName = LBR("Dwarf"), clientFileString = "Dwarf"},
    [4] = {raceID = 4, raceName = LBR("Night Elf"), clientFileString = "NightElf"},
    [5] = {raceID = 5, raceName = LBR("Undead"), clientFileString = "Scourge"},
    [6] = {raceID = 6, raceName = LBR("Tauren"), clientFileString = "Tauren"},
    [7] = {raceID = 7, raceName = LBR("Gnome"), clientFileString = "Gnome"},
    [8] = {raceID = 8, raceName = LBR("Troll"), clientFileString = "Troll"},
    [9] = {raceID = 9, raceName = LBR("Goblin"), clientFileString = "Goblin"},
    [10] = {raceID = 10, raceName = LBR("Blood Elf"), clientFileString = "BloodElf"},
    [11] = {raceID = 11, raceName = LBR("Draenei"), clientFileString = "Draenei"},
    [22] = {raceID = 22, raceName = LBR("Worgen"), clientFileString = "Worgen"},
    [24] = {raceID = 24, raceName = LBR("Pandaren"), clientFileString = "Pandaren"},
    [25] = {raceID = 25, raceName = LBR("Pandaren"), clientFileString = "Pandaren"},
    [26] = {raceID = 26, raceName = LBR("Pandaren"), clientFileString = "Pandaren"},
    [27] = {raceID = 27, raceName = LBR("Nightborne"), clientFileString = "Nightborne"},
    [28] = {raceID = 28, raceName = LBR("Highmountain Tauren"), clientFileString = "HighmountainTauren"},
    [29] = {raceID = 29, raceName = LBR("Void Elf"), clientFileString = "VoidElf"},
    [30] = {raceID = 30, raceName = LBR("Lightforged Draenei"), clientFileString = "LightforgedDraenei"},
    -- [31] = {raceID = 31, raceName = LBR("Zandalari Troll"), clientFileString = "ZandalariTroll"},
    -- [32] = {raceID = 32, raceName = LBR("Kul Tiran"), clientFileString = "KulTiran"},
    -- [34] = {raceID = 34, raceName = LBR("Dark Iron Dwarf"), clientFileString = "DarkIronDwarf"},
    -- [35] = {raceID = 35, raceName = LBR("Vulpera"), clientFileString = "Vulpera"},
    -- [36] = {raceID = 36, raceName = LBR("Mag'har Orc"), clientFileString = "MagharOrc"},
    -- [37] = {raceID = 37, raceName = LBR("Mechagnome"), clientFileString = "Mechagnome"},
  }

  C_CreatureInfo = {
    GetClassInfo = function(classID)
      className, classFile, classID = GetClassInfo(classID)
      if not className then return nil end

      return {
        className = className,
        classFile = classFile,
        classID = classID,
      }
    end,
    GetRaceInfo = function(raceID)
      return raceInfo[raceID] or nil
    end,
    GetFactionInfo = function(raceID)
      -- name, groupTag
      -- NYI, TODO, not needed by WeakAuras so I am not implementing it
      return nil
    end,
  }
end