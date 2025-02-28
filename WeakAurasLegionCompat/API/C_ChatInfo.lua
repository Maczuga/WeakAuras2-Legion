if not C_ChatInfo then
    C_ChatInfo = {
      IsAddonMessagePrefixRegistered = IsAddonMessagePrefixRegistered,
      RegisterAddonMessagePrefix = RegisterAddonMessagePrefix,
      SendAddonMessage = SendAddonMessage,
      SendAddonMessageLogged = SendAddonMessage, -- no direct equivalent in 7.3.5
    }
end