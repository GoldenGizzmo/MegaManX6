/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Can be paused
if global.pause = true
	return;

if instance_exists(target)
{
	if track = false
	{
		if speed > 0
			speed -= 0.1;
		
		if spawn_fade > 0
			spawn_fade -= 0.05;
		else
		{
			track = true;
			alarm[0] = 1;
			
			sprite_index = spr_bullet_turtloid_rocket;
			if direction > 90 and direction < 270 
				direction = 180;
			else
				direction = 0;
		}
	}
	else
	{
		image_angle = direction;
		
		if speed < 5
			speed += 0.1;
	}
}

image_xscale = 1;
if image_angle > 90 and image_angle < 270 //Prevent flipping upside down
	image_yscale = -1;
else
	image_yscale = 1;