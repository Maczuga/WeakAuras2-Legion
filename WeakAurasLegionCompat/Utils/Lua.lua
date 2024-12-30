function ipairs_reverse(t)
    local function reverse_iterator(t, i)
        i = i - 1 -- Decrement the index
        if i > 0 then
            return i, t[i] -- Return the current index and value
        end
    end

    return reverse_iterator, t, #t + 1 -- Start from one past the last index
end