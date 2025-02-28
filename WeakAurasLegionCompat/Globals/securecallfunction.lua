-- Replacement for securecallfunction
if not securecallfunction then
  local securecall = securecall
  function securecallfunction(func, ...)
      return securecall(func, ...)
  end
end