#include <Brain.h>
#include <Brain/Core/EntryPoint.h>

#include "Playground2D.h"
#include "ExampleLayer.h"

class Playground : public Brain::Application
{
public:
	Playground()
	{
		// PushLayer(new ExampleLayer());
		PushLayer(new Playground2D());
	}

	~Playground()
	{
	}
};

Brain::Application* Brain::CreateApplication()
{
	return new Playground();
}
