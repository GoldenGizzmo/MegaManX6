/// @description Insert description here
// You can write your code in this editor

action = 0;
alarm[0] = 1;

with obj_player
{
	movement = false;
	xspeed = 0;
	invul = true;
	
	image_speed = 1;
}

hold_pose = false;
finish_pose = false;

warp_y = 0;
warp_speed = 8;
warp_out = false;