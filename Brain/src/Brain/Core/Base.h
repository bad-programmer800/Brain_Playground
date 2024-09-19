#pragma once

#include <memory>
#include "Brain/Core/PlatformDetection.h"

#ifdef BR_DEBUG
	#if defined(BR_PLATFORM_WINDOWS)
		#define BR_DEBUGBREAK() __debugbreak()
	#elif defined(BR_PLATFORM_LINUX)
		#include <signal.h>
		#define BR_DEBUGBREAK() raise(SIGTRAP)
	#else
		#error "Platform doesn't support debugbreak yet!"
	#endif
	#define BR_ENABLE_ASSERTS
#else
	#define BR_DEBUGBREAK()
#endif

#define BR_EXPAND_MACRO(x) x
#define BR_STRINGIFY_MACRO(x) #x

#define BIT(x) (1 << x)

#define BR_BIND_EVENT_FN(fn) [this](auto&&... args) -> decltype(auto) { return this->fn(std::forward<decltype(args)>(args)...); }

namespace Brain {

	template<typename T>
	using Scope = std::unique_ptr<T>;
	template<typename T, typename ... Args>
	constexpr Scope<T> CreateScope(Args&& ... args)
	{
		return std::make_unique<T>(std::forward<Args>(args)...);
	}

	template<typename T>
	using Ref = std::shared_ptr<T>;
	template<typename T, typename ... Args>
	constexpr Ref<T> CreateRef(Args&& ... args)
	{
		return std::make_shared<T>(std::forward<Args>(args)...);
	}

}

#include "Brain/Core/Log.h"
#include "Brain/Core/Assert.h"
