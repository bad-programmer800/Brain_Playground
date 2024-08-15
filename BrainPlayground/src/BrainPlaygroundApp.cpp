#include <Brain.h>
#include <Brain/Core/EntryPoint.h>

#include "EditorLayer.h"

namespace Brain {

	class BrainPlayground : public Application
	{
	public:
		BrainPlayground()
			: Application("BrainPlayground")
		{
			PushLayer(new EditorLayer());
		}

		~BrainPlayground()
		{
		}
	};

	Application* CreateApplication()
	{
		return new BrainPlayground();
	}

}