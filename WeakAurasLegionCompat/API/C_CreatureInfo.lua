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

  local creatureTypeInfo = {
    [1] = {id = 1, name = "Beast"},
    [2] = {id = 2, name = "Dragonkin"},
    [3] = {id = 3, name = "Demon"},
    [4] = {id = 4, name = "Elemental"},
    [5] = {id = 5, name = "Giant"},
    [6] = {id = 6, name = "Undead"},
    [7] = {id = 7, name = "Humanoid"},
    [8] = {id = 8, name = "Critter"},
    [9] = {id = 9, name = "Mechanical"},
    [10] = {id = 10, name = "Not specified"},
    [11] = {id = 11, name = "Totem"},
    [12] = {id = 12, name = "Non-combat Pet"},
    [13] = {id = 13, name = "Gas Cloud"},
    [14] = {id = 14, name = "Wild Pet"},
    [15] = {id = 15, name = "Aberration"},
  }

  local creatureFamilyInfo = {
    [1] = {id = 1, name = "Wolf"},
    [2] = {id = 2, name = "Cat"},
    [3] = {id = 3, name = "Spider"},
    [4] = {id = 4, name = "Bear"},
    [5] = {id = 5, name = "Boar"},
    [6] = {id = 6, name = "Crocolisk"},
    [7] = {id = 7, name = "Carrion Bird"},
    [8] = {id = 8, name = "Crab"},
    [9] = {id = 9, name = "Gorilla"},
    [11] = {id = 11, name = "Raptor"},
    [12] = {id = 12, name = "Tallstrider"},
    [15] = {id = 15, name = "Felhunter"},
    [16] = {id = 16, name = "Voidwalker"},
    [17] = {id = 17, name = "Succubus"},
    [19] = {id = 19, name = "Doomguard"},
    [20] = {id = 20, name = "Scorpid"},
    [21] = {id = 21, name = "Turtle"},
    [23] = {id = 23, name = "Imp"},
    [24] = {id = 24, name = "Bat"},
    [25] = {id = 25, name = "Hyena"},
    [26] = {id = 26, name = "Bird of Prey"},
    [27] = {id = 27, name = "Wind Serpent", iconFile = 132202},
    [28] = {id = 28, name = "Remote Control"},
    [29] = {id = 29, name = "Felguard"},
    [30] = {id = 30, name = "Dragonhawk"},
    [31] = {id = 31, name = "Ravager"},
    [32] = {id = 32, name = "Warp Stalker"},
    [33] = {id = 33, name = "Sporebat"},
    [34] = {id = 34, name = "Ray"},
    [35] = {id = 35, name = "Serpent"},
    [37] = {id = 37, name = "Moth"},
    [38] = {id = 38, name = "Chimaera"},
    [39] = {id = 39, name = "Devilsaur"},
    [40] = {id = 40, name = "Ghoul"},
    [41] = {id = 41, name = "Aqiri"},
    [42] = {id = 42, name = "Worm"},
    [43] = {id = 43, name = "Clefthoof"},
    [44] = {id = 44, name = "Wasp"},
    [45] = {id = 45, name = "Core Hound"},
    [46] = {id = 46, name = "Spirit Beast"},
    [49] = {id = 49, name = "Water Elemental"},
    [50] = {id = 50, name = "Fox"},
    [51] = {id = 51, name = "Monkey"},
    [52] = {id = 52, name = "Hound"},
    [53] = {id = 53, name = "Beetle"},
    [55] = {id = 55, name = "Shale Beast"},
    [56] = {id = 56, name = "Zombie"},
    [57] = {id = 57, name = "<< QA TEST FAMILY >>"},
    [68] = {id = 68, name = "Hydra"},
    [100] = {id = 100, name = "Fel Imp"},
    [101] = {id = 101, name = "Voidlord"},
    [102] = {id = 102, name = "Shivarra"},
    [103] = {id = 103, name = "Observer"},
    [104] = {id = 104, name = "Wrathguard"},
    [108] = {id = 108, name = "Infernal"},
    [116] = {id = 116, name = "Fire Elemental"},
    [117] = {id = 117, name = "Earth Elemental"},
    [125] = {id = 125, name = "Waterfowl"},
    [126] = {id = 126, name = "Water Strider"},
    [127] = {id = 127, name = "Rodent"},
    [128] = {id = 128, name = "Stone Hound"},
    [129] = {id = 129, name = "Gruffhorn"},
    [130] = {id = 130, name = "Basilisk"},
    [138] = {id = 138, name = "Direhorn"},
    [145] = {id = 145, name = "Storm Elemental"},
    [147] = {id = 147, name = "Terrorguard"},
    [148] = {id = 148, name = "Abyssal"},
    [150] = {id = 150, name = "Riverbeast"},
    [151] = {id = 151, name = "Stag"},
    [154] = {id = 154, name = "Mechanical"},
    [155] = {id = 155, name = "Abomination"},
    [156] = {id = 156, name = "Scalehide"},
    [157] = {id = 157, name = "Oxen"},
    [160] = {id = 160, name = "Feathermane"},
  }


  C_CreatureInfo = {
    GetClassInfo = function(classID)
      local className, classFile, classID = GetClassInfo(classID)
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
    GetCreatureTypeInfo = function(creatureTypeID)
      return creatureTypeInfo[creatureTypeID] or nil
    end,
    GetCreatureTypeIDs = function()
      local ids = {}
      for id in pairs(creatureTypeInfo) do
        table.insert(ids, id)
      end
      table.sort(ids)
      return ids
    end,
    GetCreatureFamilyInfo = function(creatureFamilyID)
        return creatureFamilyInfo[creatureFamilyID] or nil
    end,
    GetCreatureFamilyIDs = function()
        local ids = {}
        for id in pairs(creatureFamilyInfo) do
            table.insert(ids, id)
        end
        table.sort(ids)
        return ids
    end,
  }
end