/// @description Insert description here
// You can write your code in this editor

if start = true
{
	start = false;
	alarm[0] = 30
	if delayed = true
		shoot = shoot_amount;
	
	image_speed = 1;
}

if sprite_index = spr_fireburst
{
	//Don't hurt when retreating (to be nice)
	if image_index > 10
		damage = 0;
	else
		damage = 10;

	//Linger instead of bursting
	if constant = true and image_index > 7
		image_index = 4;
}
else
	damage = 0;