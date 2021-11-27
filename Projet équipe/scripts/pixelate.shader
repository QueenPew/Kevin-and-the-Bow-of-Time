shader_type canvas_item;

uniform float size_x = 0.2; // blocks by x direction
uniform float size_y = 0.5; // blocks by y direction

void fragment() {
    COLOR = texture(TEXTURE, vec2(floor(UV.x * size_x) / (size_x - 1.0), floor(UV.y * size_y) / (size_y - 1.0)));
}