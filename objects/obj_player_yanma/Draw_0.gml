/// @description Insert description here
// You can write your code in this editor

if flicker = true
{
	gpu_set_fog(true,make_color_rgb(211,232,248),0,0);
	draw_self();
	gpu_set_fog(false,make_color_rgb(211,232,248),0,0);
}
else
	draw_self();