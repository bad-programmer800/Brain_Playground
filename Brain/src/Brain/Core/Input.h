#pragma once

#include <glm/glm.hpp>
#include "Brain/Core/KeyCodes.h"
#include "Brain/Core/MouseCodes.h"

namespace Brain {

	class Input
	{
	public:
		static bool IsKeyPressed(KeyCode key);

		static bool IsMouseButtonPressed(MouseCode button);
		static glm::vec2 GetMousePosition();
		static float GetMouseX();
		static float GetMouseY();
	};
}
