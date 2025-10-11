/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
/*
if damage > 0
{
	store_damage = damage;
	damage = 0;
}*/

speed = rise_speed;
if y < ystart-rise_height
	alarm[9] = 1;
	
if direction > 90
	direction -= rise_turnspeed;
else if direction < 90
	direction += rise_turnspeed;