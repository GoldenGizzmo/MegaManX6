/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if isHit = false and shield_life > 0
{
	var offset = -1;
	if floor(image_index)%2 = 0
		offset = 0;
	draw_sprite_ext(spr_enemy_dozer_lights,global.animate/5,x+(offset*image_xscale),y+offset,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}