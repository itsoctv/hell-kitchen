#version 420 core

out vec3 vPos;

layout(location = 0) in vec3 inPos;

layout(std140, binding = 0) uniform Matrices
{
	mat4 vuBProjection;
	mat4 vuBView;
};

uniform mat4 vuProjection;
uniform mat4 vuView;

void main(){
	vPos = inPos;
	vec4 pos = vuBProjection * mat4(mat3(vuBView)) * vec4(inPos, 1.0);
	gl_Position = pos.xyww;
}