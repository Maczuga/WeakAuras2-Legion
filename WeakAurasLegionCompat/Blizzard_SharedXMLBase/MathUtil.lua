
MathUtil =
{
	Epsilon = .000001,
};

MathUtil.ApproxZero = MathUtil.Epsilon;
MathUtil.ApproxOne = 1.0 - MathUtil.Epsilon;

if not CreateCounter then
	local securecallfunction = securecallfunction;
	function CreateCounter(initialCount)
		local count = initialCount or 0;
		local counter = function()
			count = count + 1;
			return count;
		end;
			return function()
					return securecallfunction(counter);
			end;
	end
end

if not ApproximatelyEqual then
	function ApproximatelyEqual(v1, v2, epsilon)
		return math.abs(v1 - v2) < (epsilon or MathUtil.Epsilon);
	end
end

if not WithinRangeExclusive then
	function WithinRangeExclusive(value, min, max)
		return value > min and value < max;
	end
end