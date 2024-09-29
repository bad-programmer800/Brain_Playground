project "BrainPlayground"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp"
	}

	includedirs
	{
		"%{wks.location}/Brain/vendor/spdlog/include",
		"%{wks.location}/Brain/src",
		"%{wks.location}/Brain/vendor",
		"%{IncludeDir.glm}",
		"%{IncludeDir.entt}"
	}

	links
	{
		"Brain"
	}

	filter "system:windows"
		systemversion "latest"
		
	filter "configurations:Debug"
		defines "BR_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "BR_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "BR_DIST"
		runtime "Release"
		optimize "on"
