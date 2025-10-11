/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


if thruster = true
{
	if global.animate%2 = 0
	{
		if jitter = false
		{
			y--;
			jitter = true;
		}
		else
		{
			y++;
			jitter = false;
		}
	}
}