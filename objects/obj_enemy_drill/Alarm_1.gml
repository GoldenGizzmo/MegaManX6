/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	if image_index > 0
		image_speed = -1;

	//Faces player
	if obj_player.x < x
		image_xscale = 1;
	else
		image_xscale = -1;
	
	xspeed = 5*image_xscale
	colliding = false;

	alarm[1] = 1;
}