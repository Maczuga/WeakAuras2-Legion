-- https://www.townlong-yak.com/framexml/latest/Blizzard_SharedXMLBase/TableUtil.lua#196

if not tAppendAll then
  function tAppendAll(table, addedArray)
    for i, element in ipairs(addedArray) do
      tinsert(table, element);
    end
  end
end

if not tIndexOf then
    function tIndexOf(tbl, item)
        for i, v in ipairs(tbl) do
            if item == v then
                return i;
            end
        end
    end
end

if not CopyValuesAsKeys then
  function CopyValuesAsKeys(tbl)
    local output = {};
    for k, v in ipairs(tbl) do
      output[v] = v;
    end
    return output;
  end
end

if not CreateTableEnumerator then
  function CreateTableEnumerator(tbl, minIndex, maxIndex)
    minIndex = minIndex and (minIndex - 1) or 0;
    maxIndex = maxIndex or math.huge;

    local function Enumerator(tbl, index)
      index = index + 1;
      if index <= maxIndex then
        local value = tbl[index];
        if value ~= nil then
          return index, value;
        end
      end
    end

    return Enumerator, tbl, minIndex;
  end
end

if not TableHasAnyEntries then
  function TableHasAnyEntries(tbl)
    return next(tbl) ~= nil;
  end
end