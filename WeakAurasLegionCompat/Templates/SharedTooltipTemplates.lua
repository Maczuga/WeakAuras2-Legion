
TooltipBackdropTemplateMixin = {};

function TooltipBackdropTemplateMixin:TooltipBackdropOnLoad()
	NineSliceUtil.DisableSharpening(self.NineSlice);

	local bgColor = self.backdropColor or TOOLTIP_DEFAULT_BACKGROUND_COLOR;
	local bgAlpha = self.backdropColorAlpha or 1;
  local bgR, bgG, bgB = bgColor.r, bgColor.g, bgColor.b;
	self:SetBackdropColor(bgR, bgG, bgB, bgAlpha);

	if self.backdropBorderColor then
		local borderR, borderG, borderB = self.backdropBorderColor.r, self.backdropBorderColor.g, self.backdropBorderColor.b;
		local borderAlpha = self.backdropBorderColorAlpha or 1;
		self:SetBackdropBorderColor(borderR, borderG, borderB, borderAlpha);
	end
end

function TooltipBackdropTemplateMixin:SetBackdropColor(r, g, b, a)
	self.NineSlice:SetCenterColor(r, g, b, a);
end

function TooltipBackdropTemplateMixin:GetBackdropColor()
	return self.NineSlice:GetCenterColor();
end

function TooltipBackdropTemplateMixin:SetBackdropBorderColor(r, g, b, a)
	self.NineSlice:SetBorderColor(r, g, b, a);
end

function TooltipBackdropTemplateMixin:GetBackdropBorderColor()
	return self.NineSlice:GetBorderColor();
end

function TooltipBackdropTemplateMixin:SetBorderBlendMode(blendMode)
	self.NineSlice:SetBorderBlendMode(blendMode);
end
