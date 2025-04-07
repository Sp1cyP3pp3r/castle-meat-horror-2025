shader_type spatial;
render_mode unshaded;

uniform sampler2D top_texture;
uniform sampler2D bottom_texture;

uniform vec4 top_albedo : source_color = vec4(1.0);
uniform vec4 bottom_albedo : source_color = vec4(1.0);

uniform float top_tile_x = 1.0;
uniform float top_tile_y = 1.0;
uniform float bottom_tile_x = 1.0;
uniform float bottom_tile_y = 1.0;

uniform float split_position : hint_range(0,1) = 0.5;

void fragment() {
    float dividing_line = split_position;
    vec4 final_color;
    
	if (UV.y < dividing_line){
		
		final_color = texture(top_texture, UV) * top_albedo;
	} else{
		final_color = texture(bottom_texture, UV) * bottom_albedo;
	}
	
    ALBEDO = final_color.rgb;
    ALPHA = final_color.a;
}
