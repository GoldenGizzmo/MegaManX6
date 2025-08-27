/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if store_speed = 0
	store_speed = speed;
	
//Check if the main grasshopper is alive
if owner != 0
{
	if instance_exists(owner)
	{
		if owner.life <= 0 or owner.state = "Reviving"
			alarm[9] = 1;
	}
	else
		alarm[9] = 1;
}

/*
//Stop prematurely
if state = 0 and place_meeting(x,y,obj_player)
	alarm[0] = 1;