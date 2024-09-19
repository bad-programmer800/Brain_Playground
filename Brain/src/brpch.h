#pragma once

#include "Brain/Core/PlatformDetection.h"

#ifdef BR_PLATFROM_WINDOWS
	#ifndef NOMINMAX
		// Fixes Entt warning
		#define NOMINMAX
	#endif
#endif

#include <iostream>
#include <memory>
#include <utility>
#include <algorithm>
#include <functional>

#include <string>
#include <sstream>
#include <array>
#include <vector>
#include <unordered_map>
#include <unordered_set>

#include "Brain/Core/Base.h"

#include "Brain/Core/Log.h"

#include "Brain/Debug/Instrumentor.h"

#ifdef BR_PLATFORM_WINDOWS
	#include <Windows.h>
#endif