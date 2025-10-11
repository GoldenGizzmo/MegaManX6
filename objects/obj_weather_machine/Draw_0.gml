/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


if shield_fade > 0
{
	gpu_set_blendmode(bm_add);
		draw_sprite_ext(spr_weather_machine_shield,global.animate/4,x,y,image_xscale,image_yscale,0,c_white,shield_fade);
	gpu_set_blendmode(bm_normal);
}