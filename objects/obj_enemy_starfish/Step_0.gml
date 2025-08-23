/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	y += yspeed;
	despawn = false;
	
	//moving up
	if move_direction = 90
	{
		if yspeed > -move_speed
			yspeed -= 0.02;
	}
	else if move_direction = 270
	{
		if yspeed < move_speed
			yspeed += 0.02;
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