/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.pause = true
	return;

if life > 0
{	
	//Float up and down
	if yspeed = 0 and xspeed = 0
		y += dsin((current_time)*0.5)*0.2;
		
	if rumbling = true
	{
		if sprite_index = spr_boss_heatnix_godbird
		{
			if indicator < 0.75
				indicator += 0.025;
		
		}
		
		if !audio_is_playing(snd_heatnix_rumble)
			scr_make_sound(snd_heatnix_rumble,1,1,false);
	}
	else
	{
		if indicator > 0
			indicator -= 0.025;
	
	}
	
	//Wing flap sound
	if place_meeting(x,y,obj_camera)
	{
		switch (sprite_index)
		{
			case spr_boss_heatnix_idle:
				if image_index >= 3
				{
					wing_flapped = true;
					scr_make_sound(snd_heatnix_flap,1,1,false);
				}
				else
					wing_flapped = false;
				break;
	
			case spr_boss_heatnix_appear:
				if image_index >= 2
				{
					wing_flapped = true;
					scr_make_sound(snd_heatnix_flap,1,1,false);
				}
				else
					wing_flapped = false;
				break;
		}	
	}

	if state = "Defeated" and action > 7
	{
		obj_camera.x = inst_41C6F26D.x
		obj_camera.y = inst_41C6F26D.y
	}
}
