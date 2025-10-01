if C_TradeSkillUI and not C_TradeSkillUI.GetItemReagentQualityByItemInfo then
  C_TradeSkillUI.GetItemReagentQualityByItemInfo = function(itemName)
    return nil
  end
end