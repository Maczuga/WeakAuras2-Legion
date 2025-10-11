if not Enum then Enum = {} end

Enum.LFGRole = {
  Tank = 0,
  Healer = 1,
  Damage = 2
}

Enum.LFGRoleMeta = {
  NumValues = 3,
  MinValue = 0,
  MaxValue = 2
}

Enum.AddOnEnableState = {
  None = 0,
  Some = 1,
  All  = 2,
}

Enum.InputContext = {
  None = 0,
  Keyboard = 1,
  Mouse = 2,
  GamePad = 3
}

Enum.ItemQuality = {
  Poor = 0,
  Common = 1,
  Uncommon = 2,
  Rare = 3,
  Epic = 4,
  Legendary = 5,
  Artifact = 6,
  Heirloom = 7,
  WoWToken = 8,
}

Enum.UIMapType = {
  Cosmic = 0,
  World = 1,
  Continent = 2,
  Zone = 3,
  Dungeon = 4,
  Micro = 5,
  Orphan = 6,
}

Enum.FlightPathState = {
  Current = 0,
  Reachable = 1,
  Unreachable = 2,
}
