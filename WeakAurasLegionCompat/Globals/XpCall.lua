-- Wrapper over Legion's xpcall function.
-- Accepts more than 2 arguments and passes them to the function being called.
function XpCall(func, errorHandler, ...)
  if not func then return end

  -- Default error handler if none is provided
  if not errorHandler then
      errorHandler = function(err)
          print("Error occurred:", err)
          print(debug.traceback())
          return err -- Re-throw the error
      end
  end

  -- Wrap the function call with xpcall
  local args = { ... }
  local wrappedFunc = function()
      return func(unpack(args))
  end

  return xpcall(wrappedFunc, errorHandler)
end