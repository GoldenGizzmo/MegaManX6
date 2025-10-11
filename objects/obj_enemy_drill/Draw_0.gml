/// @description Insert description here
// You can write your code in this editor

if life > 0
	if sprite_index = spr_enemy_drill and image_index = 0
		draw_sprite_ext(spr_enemy_drill_jets,global.animate/3,x,y,image_xscale,1,0,c_white,1);

// Inherit the parent event
event_inherited();

