if not secureexecuterange then
  local securecall = securecall
  secureexecuterange = function(tbl, func, ...)
    local key = nil

    repeat
      key = securecall(secureexecutenext, tbl, key, func, ...)
    until key == nil
  end
end

if not secureexecutenext then
  secureexecutenext = function(tbl, prev, func, ...)
    local key, value = next(tbl, prev)

    if key ~= nil then
        pcall(func, key, value, ...)
    end

    return key
  end

end
