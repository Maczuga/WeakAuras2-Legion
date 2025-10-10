-- Available in UIParent.lua
-- function InGlue()
-- 	return C_Glue and C_Glue.IsOnGlueScreen and C_Glue.IsOnGlueScreen();
-- end

if not nop then
	function nop()
	end
end

if not GetGlobalEnvironment then
	function GetGlobalEnvironment()
		return getfenv(0);
	end
end

if not GetCurrentEnvironment then
	function GetCurrentEnvironment()
		-- 2 because we want the environment of the caller, not this function
		return getfenv(2);
	end
end

if not IsInGlobalEnvironment then
	function IsInGlobalEnvironment()
		-- NOTE: This can't use GetCurrentEnvironment; it would neet to check getfenv(3)
		return getfenv(2) == GetGlobalEnvironment();
	end
end

if not SwapToGlobalEnvironment then
	function SwapToGlobalEnvironment()
		-- 2 because we want to swap the environment of the caller, not this function
		setfenv(2, GetGlobalEnvironment());
	end
end
