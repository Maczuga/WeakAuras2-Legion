if not TableHasAnyEntries then
  function TableHasAnyEntries(t)
    for _ in pairs(t) do
      return true
    end
    return false
  end
end