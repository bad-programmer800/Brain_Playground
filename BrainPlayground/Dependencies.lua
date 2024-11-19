-- Brain Dependencies

VULKAN_SDK = os.getenv("VULKAN_SDK")

IncludeDir = {}
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

IncludeDir["shaderc"] = "%{wks.location}/Hazel/vendor/shaderc/include"
IncludeDir["SPIRV_Cross"] = "%{wks.location}/Hazel/vendor/SPIRV-Cross"
IncludeDir["VulkanSDK"] = "%{VULKAN_SDK}/Include"

LibraryDir = {}

LibraryDir["VulkanSDK"] = "%{VULKAN_SDK}/Lib"
LibraryDir["VulkanSDK_Debug"] = "%{wks.location}/Hazel/vendor/VulkanSDK/Lib"

Library = {}
Library["Vulkan"] = "%{LibraryDir.VulkanSDK}/vulkan-1.lib"
Library["VulkanUtils"] = "%{LibraryDir.VulkanSDK}/VkLayer_utils.lib"

Library["ShaderC_Debug"] = "%{LibraryDir.VulkanSDK_Debug}/shaderc_sharedd.lib"
Library["SPIRV_Cross_Debug"] = "%{LibraryDir.VulkanSDK_Debug}/spirv-cross-cored.lib"
Library["SPIRV_Cross_GLSL_Debug"] = "%{LibraryDir.VulkanSDK_Debug}/spirv-cross-glsld.lib"
Library["SPIRV_Tools_Debug"] = "%{LibraryDir.VulkanSDK_Debug}/SPIRV-Toolsd.lib"

Library["ShaderC_Release"] = "%{LibraryDir.VulkanSDK}/shaderc_shared.lib"
Library["SPIRV_Cross_Release"] = "%{LibraryDir.VulkanSDK}/spirv-cross-core.lib"
Library["SPIRV_Cross_GLSL_Release"] = "%{LibraryDir.VulkanSDK}/spirv-cross-glsl.lib"