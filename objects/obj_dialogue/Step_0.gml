/// @description Insert description here
// You can write your code in this editor

global.hud_toggle = false;
obj_player.movement = false;
obj_player.xspeed = 0;
	
//Continue indicator
if global.animate%10 = 0
{
	if flash = 0.5
		flash = 1;
	else
		flash = 0.5;
}

if finish = false
{
	if animation_x < 1
		animation_x += 0.1; 
	else
	{
		//Opening sound
		if animation_y = 0
			scr_make_sound(snd_text_open,1,1,false);
		
		if animation_y < 1
			animation_y += 0.1;
		else
			if animation_static > 0
				animation_static -= 0.05;
	}
}
else
{
	if animation_static < 1
		animation_static += 0.05;
	else
	{
		if animation_y > 0
		{
			//Closing sound
			if animation_y = 1
				scr_make_sound(snd_text_close,1,1,false);
			
			animation_y -= 0.1;
		}
		else
		{
			if animation_x > 0
				animation_x -= 0.1;
			else
			{
				if movement = true
				{
					obj_player.movement = true;
					global.hud_toggle = true;
				}
				instance_destroy();
			}
		}
	}
}

