/// @description Insert description here
// You can write your code in this editor

if life > 0 or death < 1
	if thruster = true
		draw_sprite_ext(spr_enemy_bigdrill_jets_down,global.animate/2,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

// Inherit the parent event
event_inherited();

if life > 0 or death < 1
{
	//Light idicators
	if !(isHit)
	{
		if lights = "Down"
			draw_sprite_ext(spr_enemy_bigdrill_light_down,global.animate/4,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		else if lights = "Up"
			draw_sprite_ext(spr_enemy_bigdrill_light_up,global.animate/4,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
	
	if yspeed > 0
		draw_sprite_ext(spr_enemy_bigdrill_jets_up,global.animate,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}