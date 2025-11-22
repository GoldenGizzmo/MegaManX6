/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Can be paused
if global.pause = true
	return;

if global.animate%3 = 0 and sprite_index = spr_bullet_player_charge_2
{
	effect = instance_create_depth(x,y+random_range(-10,10),depth+1,obj_explosion);
	effect.sprite_index = spr_effect_trail_charged;
	effect.speed = speed/4;
	effect.image_alpha = image_alpha;
}

if global.animate%2 = 0 and sprite_index = spr_bullet_bike_charge
{
	effect = instance_create_depth(x,y+random_range(-20,20),depth+1,obj_explosion);
	effect.sprite_index = spr_effect_trail_charged;
	effect.speed = speed/4;
	effect.image_alpha = image_alpha;
}