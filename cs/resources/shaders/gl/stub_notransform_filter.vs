#include "common.h"

float4		screen_res;		// Screen resolution (x-Width,y-Height, zw - 1/resolution)

layout(location = 0) in vec4 iPos;
layout(location = 1) in vec4 iTex0;
layout(location = 2) in vec4 iTex1;
layout(location = 3) in vec4 iTex2;
layout(location = 4) in vec4 iTex3;
layout(location = 5) in vec4 iTex4;
layout(location = 6) in vec4 iTex5;
layout(location = 7) in vec4 iTex6;
layout(location = 8) in vec4 iTex7;

out vec4 vTex0;
out vec4 vTex1;
out vec4 vTex2;
out vec4 vTex3;
out vec4 vTex4;
out vec4 vTex5;
out vec4 vTex6;
out vec4 vTex7;

//////////////////////////////////////////////////////////////////////////////////////////
// Vertex
void main ()
{
	vec4 vHPos, iP = iPos;

	{
		iP.xy += 0.5f;	//	Bugs with rasterizer??? Possible half-pixel shift.
//		vHPos.x = iP.x/1024 * 2 - 1;
//		vHPos.y = (iP.y/768 * 2 - 1)*-1;
		vHPos.x = iP.x * screen_res.z * 2 - 1;
		vHPos.y = (iP.y * screen_res.w * 2 - 1)*-1;
		vHPos.zw = iP.zw;
	}
	vTex0 = iTex0;
	vTex1 = iTex1;
	vTex2 = iTex2;
	vTex3 = iTex3;
	vTex4 = iTex4;
	vTex5 = iTex5;
	vTex6 = iTex6;
	vTex7 = iTex7;

	gl_Position = vHPos;
}