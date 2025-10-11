/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{	
	//Appearing
	if appearing = true
	{
		if flickering > 0
		{
			//Flicker to show it's appearing
			flickering--;
			if flickering%2 = 0
			{
				if flicker = false
				{
					flicker = true;
					image_alpha = 0;
				}
				else
				{
					flicker = false;
					image_alpha = 1;
				}
			}
		}
		else
		{
			appearing = false;
			image_alpha = 1;

			invul = false;
				
			scr_make_sound(snd_turtloid_jewel,1,1,false);
		}
	}
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		
		//Death event
		if jewel_top = true
			obj_boss_turtloid.jewel_respawn_top = 60*20;
		else
			obj_boss_turtloid.jewel_respawn_bottom = 60*20;
		
		scr_make_sound(snd_explosion,1,1,false);
		
		death = 1;
	}
}