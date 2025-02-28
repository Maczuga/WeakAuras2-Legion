if not GetMouseFoci then
    function GetMouseFoci()
        local regions = GetMouseFocus()
        return {
          [1] = regions or {}
        }
    end
end