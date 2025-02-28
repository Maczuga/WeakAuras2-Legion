--  Patch 8.1.5 (2019-03-12): Renamed as CreateFramePoolCollection() and FramePoolCollectionMixin

if not CreateFramePoolCollection then
  -- Use CreatePoolCollection as base, but also add GetOrCreatePool() method
  CreateFramePoolCollection = function()
    local poolCollection = CreatePoolCollection()
    function poolCollection:GetOrCreatePool(poolType, frameTemplate, resetterFunc, forbidden)
      local pool = self:GetPool(poolType, frameTemplate)
      if not pool then
        pool = CreateFramePool(poolType, frameTemplate, resetterFunc, forbidden)

        -- Override Acquire in Pool
        local OriginalAcquire = pool.Acquire
        function pool:Acquire()
          local frame, key = OriginalAcquire(self)

          ApplyFrameExtensions(frame)

          if frame then
            frame:Show()
          end

          return frame, key
        end

        self:CreatePool(poolType, frameTemplate, pool)
      end
      return pool
    end

    return poolCollection
  end
end

if not FramePoolCollectionMixin then
  FramePoolCollectionMixin = PoolCollectionMixin
end
