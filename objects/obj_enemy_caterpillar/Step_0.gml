/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	scr_collision();
		
	if state = "Moving"
	{
		if turn_delay = false
		{
			event_user(1);
			event_user(0);
		}
		
		xspeed = 0.25*image_xscale;
		
		if isHit = true
		{
			state = "Curl";
			alarm[0] = 1;
		}
	}
	else if state = "Rolling"
	{
		xspeed = 1*image_xscale;
	}
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		death = 1;
	}
}