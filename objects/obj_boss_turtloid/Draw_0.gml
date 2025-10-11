/// @description Insert description here
// You can write your code in this editor

if boss_flicker = true
{
	gpu_set_fog(true,c_ltgrey,0,0);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,rotate,image_blend,image_alpha);
	gpu_set_fog(false,c_ltgrey,0,0);
}
else
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,rotate,image_blend,image_alpha);

