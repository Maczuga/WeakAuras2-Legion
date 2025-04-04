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

if not SafePack then
  function SafePack(...)
    local tbl = { ... };
    tbl.n = select("#", ...);
    return tbl;
  end
end

if not SafeUnpack then
  function SafeUnpack(tbl, startIndex)
    return unpack(tbl, startIndex or 1, tbl.n);
  end
end

if not tCompare then
  -- This is a deep compare on the values of the table (based on depth) but not a deep comparison
  -- of the keys, as this would be an expensive check and won't be necessary in most cases.
  function tCompare(lhsTable, rhsTable, depth)
    depth = depth or 1;
    for key, value in pairs(lhsTable) do
      if type(value) == "table" then
        local rhsValue = rhsTable[key];
        if type(rhsValue) ~= "table" then
          return false;
        end
        if depth > 1 then
          if not tCompare(value, rhsValue, depth - 1) then
            return false;
          end
        end
      elseif value ~= rhsTable[key] then
        return false;
      end
    end

    -- Check for any keys that are in rhsTable and not lhsTable.
    for key, value in pairs(rhsTable) do
      if lhsTable[key] == nil then
        return false;
      end
    end

    return true;
  end
end
