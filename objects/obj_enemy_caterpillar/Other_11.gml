/// @description Insert description here
// You can write your code in this editor

//Collision
if place_meeting(x+xspeed,y,obj_solid)
{
	state = "Turn"
	alarm[0] = 1;
}