/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Can be paused
if global.pause = true
	return;

//Detonate blade projectiles
if global.input_shoot_pressed
{
	//Create marked effect
	if marked_max > 0 
	{
		event_user(10);
		marked_max = 0; //Only happen once
	}
}

if global.animate%3 = 0
{
	effect = instance_create_depth(x,y+random_range(-10,10),depth+1,obj_explosion);
	effect.sprite_index = spr_effect_trail_blade;
	effect.speed = speed/4;
	effect.image_alpha = image_alpha;
}