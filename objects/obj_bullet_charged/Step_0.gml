/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.animate%3 = 0 and sprite_index = spr_bullet_player_charge_2
{
	effect = instance_create_depth(x,y+random_range(-10,10),depth+1,obj_explosion);
	effect.sprite_index = spr_effect_charged_trail;
	effect.speed = speed/4;
}