/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

y += yspeed;
x += xspeed;

//Being openning appearance
if state = "Openning" and action = 0
{
	action++;
	alarm[0] = 1;
}