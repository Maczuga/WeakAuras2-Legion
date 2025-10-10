if not COLOR_FORMAT_RGBA then COLOR_FORMAT_RGBA = "RRGGBBAA"; end
if not COLOR_FORMAT_RGB then COLOR_FORMAT_RGB = "RRGGBB"; end
-- if not FONT_COLOR_CODE_CLOSE then FONT_COLOR_CODE_CLOSE = "|r"; end

if not ExtractColorValueFromHex then
	function ExtractColorValueFromHex(str, index)
		return tonumber(str:sub(index, index + 1), 16) / 255;
	end
end

if not CreateColorFromHexString then
	function CreateColorFromHexString(hexColor)
		if #hexColor == 8 then
			local a, r, g, b = ExtractColorValueFromHex(hexColor, 1), ExtractColorValueFromHex(hexColor, 3), ExtractColorValueFromHex(hexColor, 5), ExtractColorValueFromHex(hexColor, 7);
			return CreateColor(r, g, b, a);
		else
			GMError("CreateColorFromHexString input must be hexadecimal digits in this format: AARRGGBB.");
		end
	end
end

if not CreateColorFromRGBAHexString then
	function CreateColorFromRGBAHexString(hexColor)
		if #hexColor == #COLOR_FORMAT_RGBA then
			local r, g, b, a = ExtractColorValueFromHex(hexColor, 1), ExtractColorValueFromHex(hexColor, 3), ExtractColorValueFromHex(hexColor, 5), ExtractColorValueFromHex(hexColor, 7);
			return CreateColor(r, g, b, a);
		else
			GMError("CreateColorFromHexString input must be hexadecimal digits in this format: RRGGBBAA.");
		end
	end
end

if not CreateColorFromRGBHexString then
	function CreateColorFromRGBHexString(hexColor)
		if #hexColor == #COLOR_FORMAT_RGB then
			local r, g, b = ExtractColorValueFromHex(hexColor, 1), ExtractColorValueFromHex(hexColor, 3), ExtractColorValueFromHex(hexColor, 5);
			return CreateColor(r, g, b, 1);
		else
			GMError("CreateColorFromRGBHexString input must be hexadecimal digits in this format: RRGGBB.");
		end
	end
end

if not CreateColorFromBytes then
	function CreateColorFromBytes(r, g, b, a)
		return CreateColor(r / 255, g / 255, b / 255, a / 255);
	end
end

if not AreColorsEqual then
	function AreColorsEqual(left, right)
		if left and right then
			return left:IsEqualTo(right);
		end
		return left == right;
	end
end

if not IsRGBAEqualToColor then
	function IsRGBAEqualToColor(r, g, b, a, color)
		return (color.r == r) and (color.g == g) and (color.b == b) and (color.a == a);
	end
end

if not GetClassColor then
	function GetClassColor(classFilename)
		local color = RAID_CLASS_COLORS[classFilename];
		if color then
			return color.r, color.g, color.b, color.colorStr;
		end

		return 1, 1, 1, "ffffffff";
	end
end

if not GetClassColorObj then
	function GetClassColorObj(classFilename)
		-- TODO: Remove this, convert everything that's using GetClassColor to use the object instead, then begin using that again
		return RAID_CLASS_COLORS[classFilename];
	end
end

if not GetClassColoredTextForUnit then
	function GetClassColoredTextForUnit(unit, text)
		local classFilename = select(2, UnitClass(unit));
		local color = GetClassColorObj(classFilename);
		return color and color:WrapTextInColorCode(text) or text;
	end
end

if not GetFactionColor then
	function GetFactionColor(factionGroupTag)
		return PLAYER_FACTION_COLORS[PLAYER_FACTION_GROUP[factionGroupTag]];
	end
end

if not RGBToColorCode then
	function RGBToColorCode(r, g, b)
		return format("|cff%02x%02x%02x", r*255, g*255, b*255);
	end
end

if not RGBTableToColorCode then
	function RGBTableToColorCode(rgbTable)
		return RGBToColorCode(rgbTable.r, rgbTable.g, rgbTable.b);
	end
end
