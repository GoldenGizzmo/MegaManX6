/// @description Insert description here
// You can write your code in this editor

//Create marked effect
if marked_max > 0 
{
	event_user(10);
	marked_max = 0; //Only happen once
}

// Inherit the parent event
event_inherited();