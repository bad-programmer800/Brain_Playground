workspace "Brain"
	architecture "x86_64"
	startproject "BrainPlayground"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	
	flags
	{
		"MultiProcessorCompile"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Brain/vendor/GLFW/include"
IncludeDir["Glad"] = "Brain/vendor/Glad/include"
IncludeDir["ImGui"] = "Brain/vendor/imgui"
IncludeDir["glm"] = "Brain/vendor/glm"
IncludeDir["stb_image"] = "Brain/vendor/stb_image"

group "Dependencies"
	include "Brain/vendor/GLFW"
	include "Brain/vendor/Glad"
	include "Brain/vendor/imgui"
group ""

project "Brain"
	location "Brain"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "brpch.h"
	pchsource "Brain/src/brpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/stb_image/**.h",
		"%{prj.name}/vendor/stb_image/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl",
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS",
		"GLFW_INCLUDE_NONE"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}",
		"%{IncludeDir.stb_image}"
	}

	links 
	{ 
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
		}

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

project "Playground"
	location "Playground"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Brain/vendor/spdlog/include",
		"Brain/src",
		"Brain/vendor",
		"%{IncludeDir.glm}"
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

project "BrainPlayground"
	location "BrainPlayground"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Brain/vendor/spdlog/include",
		"Brain/src",
		"Brain/vendor",
		"%{IncludeDir.glm}"
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
