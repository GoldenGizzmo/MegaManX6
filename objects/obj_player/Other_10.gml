/// @description Player sprites
// You can write your code in this editor

//Can be paused
if global.pause = true
	return;


if bike = true
{
	sprite_index = spr_port_x_bike;
	global.weapon_choice = 0;
	
	image_speed = 1;
	if xspeed > 0
		image_speed = 1.75;
	else if xspeed < 0
		image_speed = 0.75;
}
else
	spr_manager.update();