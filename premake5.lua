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
IncludeDir["GLFW"] = "%{wks.location}/Brain/vendor/GLFW/include"
IncludeDir["Glad"] = "%{wks.location}/Brain/vendor/Glad/include"
IncludeDir["ImGui"] = "%{wks.location}/Brain/vendor/imgui"
IncludeDir["glm"] = "%{wks.location}/Brain/vendor/glm"
IncludeDir["stb_image"] = "%{wks.location}/Brain/vendor/stb_image"
IncludeDir["entt"] = "%{wks.location}/Brain/vendor/entt/include"
IncludeDir["yaml_cpp"] =  "%{wks.location}/Brain/vendor/yaml-cpp-master/include"
IncludeDir["ImGuizmo"] =  "%{wks.location}/Brain/vendor/ImGuizmo-master"

syslibdirs {"C:/opencv/build/x64/vc16/lib"}
includedirs {"C:/opencv/build/include"}

group "Dependencies"
	include "Brain/vendor/GLFW"
	include "Brain/vendor/Glad"
	include "Brain/vendor/imgui"
	include "Brain/vendor/yaml-cpp-master"
group ""

include "Brain"
include "Playground"
include "BrainPlayground"


