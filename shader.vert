#version 330 core
// NOTE: Do NOT use any version older than 330! Bad things will happen!

// This is an example vertex shader. GLSL is very similar to C.
// You can define extra functions if needed, and the main() function is
// called when the vertex shader gets run.
// The vertex shader gets called once per vertex.

layout (location = 0) in vec3 position;
layout (location = 1) in vec3 anormal;

uniform mat4 projection;
uniform mat4 modelview;


// Outputs of the vertex shader are the inputs of the same name of the fragment shader.
// The default output, gl_Position, should be assigned something. You can define as many
// extra outputs as you need.
out vec3 TexCoords;
out vec3 Normal;
out vec3 aNormal;
out vec3 Position;

void main()
{
	
    // OpenGL maintains the D matrix so you only need to multiply by P, V (aka C inverse), and M
    gl_Position = projection * modelview * vec4(position, 1.0);
	Normal = mat3(transpose(inverse(modelview))) * anormal;
	Position = vec3(modelview * vec4(position, 1.0));
	TexCoords = position;
	aNormal = anormal;
}
