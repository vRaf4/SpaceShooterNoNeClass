//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	//Um vetor com 4 espaços:
	vec4 cor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );//RGBA
	cor.rgb = vec3(1.0, 1.0 ,1.0);
    gl_FragColor = cor;
}
