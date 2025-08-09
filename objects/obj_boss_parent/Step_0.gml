/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


//Flashing visual effect
if boss_iframes > 0
{
	boss_iframes--;
	if boss_iframes%4 = 0
	{
		if boss_flicker = false
			boss_flicker = true;
		else
			boss_flicker = false;
	}
}
else
	boss_flicker = false;