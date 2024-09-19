#pragma once

#include "Brain/Core/Base.h"
#include "Brain/Core/Log.h"
#include <filesystem>

#ifdef BR_ENABLE_ASSERTS



// Alteratively we could use the same "default" message for both "WITH_MSG" and "NO_MSG" and
// provide support for custom formatting by concatenating the formatting string instead of having the format inside the default message
#define BR_INTERNAL_ASSERT_IMPL(type, check, msg, ...) { if(!(check)) { BR##type##ERROR(msg, __VA_ARGS__); BR_DEBUGBREAK(); } }
#define BR_INTERNAL_ASSERT_WITH_MSG(type, check, ...) BR_INTERNAL_ASSERT_IMPL(type, check, "Assertion failed: {0}", __VA_ARGS__)
#define BR_INTERNAL_ASSERT_NO_MSG(type, check) BR_INTERNAL_ASSERT_IMPL(type, check, "Assertion '{0}' failed at {1}:{2}", BR_STRINGIFY_MACRO(check), std::filesystem::path(__FILE__).filename().string(), __LINE__)

#define BR_INTERNAL_ASSERT_GET_MACRO_NAME(arg1, arg2, macro, ...) macro
#define BR_INTERNAL_ASSERT_GET_MACRO(...) BR_EXPAND_MACRO( BR_INTERNAL_ASSERT_GET_MACRO_NAME(__VA_ARGS__, BR_INTERNAL_ASSERT_WITH_MSG, BR_INTERNAL_ASSERT_NO_MSG) )

// Currently accepts at least the condition and one additional parameter (the message) being optional
#define BR_ASSERT(...) BR_EXPAND_MACRO( BR_INTERNAL_ASSERT_GET_MACRO(__VA_ARGS__)(_, __VA_ARGS__) )
#define BR_CORE_ASSERT(...) BR_EXPAND_MACRO( BR_INTERNAL_ASSERT_GET_MACRO(__VA_ARGS__)(_CORE_, __VA_ARGS__) )
#else
#define BR_ASSERT(...)
#define BR_CORE_ASSERT(...)
#endif