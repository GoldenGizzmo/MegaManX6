/// @description Insert description here
// You can write your code in this editor

if right_character = "Dr. Light"
{
	if dr_light_flicker = false
	{
		dr_light_flicker = true;
		alarm[3] = 2;
	}
	else
	{
		dr_light_flicker = false
		alarm[3] = 1+irandom(60);
	}
}