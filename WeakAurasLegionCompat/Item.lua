if not Item then Item = {}; end
if not ItemMixin then ItemMixin = {}; end

if not ItemEventListener then
	local ItemEventListener;

	function Item:CreateFromItemLocation(itemLocation)
		if type(itemLocation) ~= "table" or type(itemLocation.HasAnyLocation) ~= "function" or not itemLocation:HasAnyLocation() then
			error("Usage: Item:CreateFromItemLocation(notEmptyItemLocation)", 2);
		end
		local item = CreateFromMixins(ItemMixin);
		item:SetItemLocation(itemLocation);
		return item;
	end

	function Item:CreateFromBagAndSlot(bagID, slotIndex)
		if type(bagID) ~= "number" or type(slotIndex) ~= "number" then
			error("Usage: Item:CreateFromBagAndSlot(bagID, slotIndex)", 2);
		end
		local item = CreateFromMixins(ItemMixin);
		item:SetItemLocation(ItemLocation:CreateFromBagAndSlot(bagID, slotIndex));
		return item;
	end

	function Item:CreateFromEquipmentSlot(equipmentSlotIndex)
		if type(equipmentSlotIndex) ~= "number" then
			error("Usage: Item:CreateFromEquipmentSlot(equipmentSlotIndex)", 2);
		end
		local item = CreateFromMixins(ItemMixin);
		item:SetItemLocation(ItemLocation:CreateFromEquipmentSlot(equipmentSlotIndex));
		return item;
	end

	function Item:CreateFromItemLink(itemLink)
		if type(itemLink) ~= "string" then
			error("Usage: Item:CreateFromItemLink(itemLinkString)", 2);
		end
		local item = CreateFromMixins(ItemMixin);
		item:SetItemLink(itemLink);
		return item;
	end

	function Item:CreateFromItemID(itemID)
		if type(itemID) ~= "number" then
			error("Usage: Item:CreateFromItemID(itemID)", 2);
		end
		local item = CreateFromMixins(ItemMixin);
		item:SetItemID(itemID);
		return item;
	end

	function ItemMixin:SetItemLocation(itemLocation)
		self:Clear();
		self.itemLocation = itemLocation;
	end

	function ItemMixin:SetItemLink(itemLink)
		self:Clear();
		self.itemLink = itemLink;
	end

	function ItemMixin:SetItemID(itemID)
		self:Clear();
		self.itemID = itemID;
	end

	function ItemMixin:GetItemLocation()
		return self.itemLocation;
	end

	function ItemMixin:HasItemLocation()
		return self.itemLocation ~= nil;
	end

	function ItemMixin:Clear()
		self.itemLocation = nil;
		self.itemLink = nil;
		self.itemID = nil;
	end

	function ItemMixin:IsItemEmpty()
		if self:GetStaticBackingItem() then
			return not C_Item.DoesItemExistByID(self:GetStaticBackingItem());
		end

		return not self:IsItemInPlayersControl();
	end

	function ItemMixin:GetStaticBackingItem()
		return self.itemLink or self.itemID;
	end

	function ItemMixin:IsItemInPlayersControl()
		local itemLocation = self:GetItemLocation();
		return itemLocation and C_Item.DoesItemExist(itemLocation);
	end

	function ItemMixin:GetItemID()
		if self:GetStaticBackingItem() then
			local itemIdentifier = self:GetStaticBackingItem()
			if type(itemIdentifier) == "number" then
				return itemIdentifier
			elseif type(itemIdentifier) == "string" then
				return tonumber(string.match(itemIdentifier, "item:(%d+)"))
			end
		end

		if not self:IsItemEmpty() then
			return C_Item.GetItemID(self:GetItemLocation());
		end
		return nil;
	end

	function ItemMixin:IsItemLocked()
		return self:IsItemInPlayersControl() and C_Item.IsLocked(self:GetItemLocation());
	end

	function ItemMixin:LockItem()
		if self:IsItemInPlayersControl() then
			C_Item.LockItem(self:GetItemLocation());
		end
	end

	function ItemMixin:UnlockItem()
		if self:IsItemInPlayersControl() then
			C_Item.UnlockItem(self:GetItemLocation());
		end
	end

	function ItemMixin:GetItemIcon()
		if self:GetStaticBackingItem() then
			return C_Item.GetItemIconByID(self:GetStaticBackingItem());
		end

		if not self:IsItemEmpty() then
			return C_Item.GetItemIcon(self:GetItemLocation());
		end
	end

	function ItemMixin:GetItemName()
		if self:GetStaticBackingItem() then
			return C_Item.GetItemNameByID(self:GetStaticBackingItem());
		end

		if not self:IsItemEmpty() then
			return C_Item.GetItemName(self:GetItemLocation());
		end
		return nil;
	end

	function ItemMixin:GetItemLink()
		if self.itemLink then
			return self.itemLink;
		end

		if self.itemID then
			return select(2, GetItemInfo(self.itemID));
		end

		if not self:IsItemEmpty() then
			return C_Item.GetItemLink(self:GetItemLocation());
		end
		return nil;
	end

	function ItemMixin:GetItemQuality()
		if self:GetStaticBackingItem() then
			return C_Item.GetItemQualityByID(self:GetStaticBackingItem());
		end

		if not self:IsItemEmpty() then
			return C_Item.GetItemQuality(self:GetItemLocation());
		end
		return nil;
	end

	function ItemMixin:GetCurrentItemLevel()
		if self:GetStaticBackingItem() then
			local itemLink = select(2, GetItemInfo(self:GetStaticBackingItem()))
			if itemLink then
				return GetItemLevelInfo(itemLink);
			end
			return nil
		end

		if not self:IsItemEmpty() then
			return C_Item.GetCurrentItemLevel(self:GetItemLocation());
		end
		return nil;
	end

	function ItemMixin:GetItemQualityColor()
		local itemQuality = self:GetItemQuality();
		if itemQuality then
			return ITEM_QUALITY_COLORS[itemQuality];
		end
	end

	function ItemMixin:GetInventoryType()
		if self:GetStaticBackingItem() then
			return C_Item.GetItemInventoryTypeByID(self:GetStaticBackingItem());
		end

		if not self:IsItemEmpty() then
			return C_Item.GetItemInventoryType(self:GetItemLocation());
		end
		return nil;
	end

	function ItemMixin:GetItemGUID()
		if self:GetStaticBackingItem() then
			return nil;
		end

		if not self:IsItemEmpty() then
			return C_Item.GetItemGUID(self:GetItemLocation());
		end
		return nil;
	end

	function ItemMixin:GetInventoryTypeName()
		local itemID = self:GetItemID()
		if not self:IsItemEmpty() and itemID then
			return select(7, GetItemInfo(itemID));
		end
	end

	function ItemMixin:IsItemDataCached()
		if self:GetStaticBackingItem() then
			return C_Item.IsItemDataCachedByID(self:GetStaticBackingItem());
		end

		if not self:IsItemEmpty() then
			return C_Item.IsItemDataCached(self:GetItemLocation());
		end
		return true;
	end

	function ItemMixin:IsDataEvictable()
		return true;
	end

	function ItemMixin:ContinueOnItemLoad(callbackFunction)
		if type(callbackFunction) ~= "function" or self:IsItemEmpty() then
			error("Usage: NonEmptyItem:ContinueOnLoad(callbackFunction)", 2);
		end
		local itemID = self:GetItemID()
		if itemID then
			ItemEventListener:AddCallback(itemID, callbackFunction);
		end
	end

	function ItemMixin:ContinueWithCancelOnItemLoad(callbackFunction)
		if type(callbackFunction) ~= "function" or self:IsItemEmpty() then
			error("Usage: NonEmptyItem:ContinueWithCancelOnItemLoad(callbackFunction)", 2);
		end
		local itemID = self:GetItemID()
		if itemID then
			return ItemEventListener:AddCancelableCallback(itemID, callbackFunction);
		end
		return function() end
	end

	ItemEventListener = CreateFrame("Frame");
	ItemEventListener.callbacks = {};

	ItemEventListener:SetScript("OnEvent",
		function(self, event, ...)
			if event == "GET_ITEM_INFO_RECEIVED" then
				local itemID, success = ...;
				if success then
					self:FireCallbacks(itemID);
				else
					self:ClearCallbacks(itemID);
				end
			end
		end
	);
	ItemEventListener:RegisterEvent("GET_ITEM_INFO_RECEIVED");

	local CANCELED_SENTINEL = {};

	function ItemEventListener:AddCallback(itemID, callbackFunction)
		local callbacks = self:GetOrCreateCallbacks(itemID);
		table.insert(callbacks, callbackFunction);
		C_Item.RequestLoadItemDataByID(itemID);
	end

	function ItemEventListener:AddCancelableCallback(itemID, callbackFunction)
		local callbacks = self:GetOrCreateCallbacks(itemID);
		table.insert(callbacks, callbackFunction);
		C_Item.RequestLoadItemDataByID(itemID);

		local index = #callbacks;
		return function()
			if callbacks and callbacks[index] ~= CANCELED_SENTINEL then
				callbacks[index] = CANCELED_SENTINEL;
				return true;
			end
			return false;
		end;
	end

	function ItemEventListener:FireCallbacks(itemID)
		local callbacks = self:GetCallbacks(itemID);
		if callbacks then
			self:ClearCallbacks(itemID);
			for i, callback in ipairs(callbacks) do
				if callback ~= CANCELED_SENTINEL then
					xpcall(callback, CallErrorHandler);
				end
			end
			wipe(callbacks)
		end
	end

	function ItemEventListener:ClearCallbacks(itemID)
		self.callbacks[itemID] = nil;
	end

	function ItemEventListener:GetCallbacks(itemID)
		return self.callbacks[itemID];
	end

	function ItemEventListener:GetOrCreateCallbacks(itemID)
		local callbacks = self.callbacks[itemID];
		if not callbacks then
			callbacks = {};
			self.callbacks[itemID] = callbacks;
		end
		return callbacks;
	end
end
