-- Thanks to GSE
-- https://github.com/TimothyLuke/GSE-Advanced-Macro-Compiler/commit/cee1f97833e698a8ea44e6c6dd18c46d90d87c3e#diff-cae51de524ea4a1b7c6b67fd62a7d7dff0e1921e9b98e8665fc5ffedf6ee6309L436
if not FindBaseSpellByID then
  local spellOverrides = {
    -- Paladin
    [231895] = 31884, -- Crusade -> Avenging Wrath
    [216331] = 31884, -- Avenging Crusader -> Avenging Wrath
    [200025] = 53563, -- Beacon of Virtue -> Beacon of Light
    [204019] = 53595, -- Blessed Hammer -> Hammer of the Righteous
    [204018] = 1022,  -- Blessing of Spellwarding -> Blessing of Protection
    [213652] = 184092, -- Hand of the Protector -> Light of the Protector

    -- Warrior
    [202168] = 34428,  -- Impending Victory -> Victory Rush
    [262161] = 167105, -- Warbreaker -> Colossus Smash
    [152277] = 227847, -- Ravager -> Bladestorm
    [236279] = 20243,  -- Devastator -> Devastate

    -- Rogue
    [200758] = 53,     -- Gloomblade -> Backstab

    -- Priest
    [123040] = 34433,  -- Mindbender -> Shadow Fiend
    [200174] = 34433,  -- Mindbender -> Shadow Fiend
    [205369] = 8122,   -- Mind Bomb -> Psychic Scream
    [205351] = 8092,   -- Shadow Word: Void -> Mind Blast
    [204197] = 589,    -- Purge the Wicked -> Shadow Word: Pain
    [271466] = 62618,  -- Luminous Barrier -> Power Word: Barrier
    [228266] = 228260, -- Void Bolt -> Void Eruption
    [205448] = 228260, -- Void Bolt -> Void Eruption

    -- Hunter
    [259387] = 186270, -- Mongoose Bite -> Raptor Strike
    [136] = 982,       -- Mend Pet -> Revive Pet
    [212436] = 187708, -- Butchery -> Carve

    -- Warlock
    [198590] = 232670, -- Drain Soul -> Shadow Bolt

    -- Shaman
    [192249] = 198067, -- Storm Elemental -> Fire Elemental
    [157153] = 5394,   -- Cloudburst Totem -> Healing Stream Totem

    -- Mage
    [205024] = 31687,  -- Lonely Winter -> Summon Water Elemental
    [212653] = 1953,   -- Shimmer -> Blink

    -- Monk
    [115008] = 109132, -- Chi Torpedo -> Roll
    [152173] = 137639, -- Serenity -> Storm, Earth and Fire

    -- Druid
    [252216] = 1850,   -- Tiger Dash -> Dash
    [102543] = 106951, -- Incarnation: King of the Jungle -> Berserk

    -- Demon Hunter
    [263642] = 203782, -- Fracture -> Shear

    -- Death Knight
    [207311] = 55090,  -- Clawing Shadows -> Scourge Strike
    [152280] = 43265   -- Defile -> Death and Decay
  }

  function FindBaseSpellByID(spellID)
    return spellOverrides[spellID] or spellID
  end
end