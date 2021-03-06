minko.platform = {}

minko.platform.platforms = function(t)
	for _, v in pairs(t) do
		if minko.platform.supports(v) then
			platforms(v)
		end
	end
end

minko.platform.supports = function(targets)
	if type(targets) == "string" then
		targets = string.explode(targets, " ")
	end

	for _, target in pairs(targets) do
		if target == "html5" then
			if premake.tools.gcc.tools.emscripten and _ACTION == "gmake" then
				return true
			end
		elseif target == "linux32" or target == "linux64" or target == "linux" then
			if os.is("linux") then
				return true
			end
		elseif target == "windows32" or target == "windows64" or target == "windows" then
			if os.is("windows") then
				return true
			end
		elseif target == "osx64" or target == "osx" then
			if os.is("macosx")  and (_ACTION == "gmake" or _ACTION == "xcode-osx") then
				return true
			end
		elseif target == "ios" then
			if os.is("macosx") and (_ACTION == "gmake" or _ACTION == "xcode-ios") then
				return true
			end
		elseif target == "android" then
			if premake.tools.gcc.tools.android and _ACTION == "gmake" then
				return true
			end
		end
	end

	return false
end
