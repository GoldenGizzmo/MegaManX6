/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	if state = "Moving"
	{
		if turn_delay = false
			event_user(0);
		
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
		scr_make_sound(snd_explosion,1,1,false);
		death = 1;
	}
}

scr_move_along_with_platform(xspeed);