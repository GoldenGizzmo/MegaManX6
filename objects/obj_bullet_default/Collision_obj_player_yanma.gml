/// @description Insert description here
// You can write your code in this editor

if villainy != 0 and damage > 0
{
	if piercing = false
		alarm[9] = 1;
	
	//Yanma option takes damage
	with other
	{
		if iframes = 0
		{
			life -= 1;
			iframes = 30;
			
			scr_make_sound(snd_taking_damage,1,1,false);
		}
	}
}