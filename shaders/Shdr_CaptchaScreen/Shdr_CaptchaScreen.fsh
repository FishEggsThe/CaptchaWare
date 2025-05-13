//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float size;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if v_vColour.rgb == vec3(1,1,1) {
		gl_FragColor.a *= 2-size;
	}
}
