#include "brpch.h"
#include "Platform/OpenGL/OpenGLContext.h"

#include <GLFW/glfw3.h>
#include <glad/glad.h>

namespace Brain {

	OpenGLContext::OpenGLContext(GLFWwindow* windowHandle)
		: m_WindowHandle(windowHandle)
	{
		BR_CORE_ASSERT(windowHandle, "Window handle is null!")
	}

	void OpenGLContext::Init()
	{
		BR_PROFILE_FUNCTION();

		glfwMakeContextCurrent(m_WindowHandle);
		int status = gladLoadGLLoader((GLADloadproc)glfwGetProcAddress);
		BR_CORE_ASSERT(status, "Failed to initialize Glad!");

		/*BR_CORE_INFO("OpenGL Info:");
		BR_CORE_INFO("  Vendor: {0}", glGetString(GL_VENDOR));
		BR_CORE_INFO("  Renderer: {0}", glGetString(GL_RENDERER));
		BR_CORE_INFO("  Version: {0}", glGetString(GL_VERSION));*/

		BR_CORE_ASSERT(GLVersion.major > 4 || (GLVersion.major == 4 && GLVersion.minor >= 5), "Hazel requires at least OpenGL version 4.5!");
	}

	void OpenGLContext::SwapBuffers()
	{
		BR_PROFILE_FUNCTION();

		glfwSwapBuffers(m_WindowHandle);
	}

}
