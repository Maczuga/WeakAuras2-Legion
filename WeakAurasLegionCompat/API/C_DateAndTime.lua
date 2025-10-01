if not C_DateAndTime then
    C_DateAndTime = {
      GetServerTimeLocal = GetServerTime,
      GetCurrentCalendarTime = function()
        local weekday, month, day, year = CalendarGetDate()
        if not year then
          return nil
        end

        local hour, minute = GetGameTime()

        return {
          year = year,
          month = month,
          monthDay = day,
          weekday = weekday, -- 1=Sunday, 2=Monday, ..., 7=Saturday
          hour = hour,
          minute = minute,
        }
      end,
    }
end