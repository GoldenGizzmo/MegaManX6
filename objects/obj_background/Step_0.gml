/// @description Insert description here
// You can write your code in this editor

if background != 0
{
	if ambience != "Off"
	{
		switch (background)
		{
			case spr_bg_intro_crash: ambience = snd_ambience_desert; break;
			case spr_bg_intro_inside: ambience = snd_ambience_industrial; break;
			case spr_bg_yammark_temples: ambience = snd_ambience_rainforest; break;
			case spr_bg_yammark_cave: ambience = snd_ambience_watercave; break;
			case spr_bg_yammark_ruins: 
			case spr_bg_intro_night:
				ambience = snd_ambience_wilderness; break;
			case spr_bg_turtloid: ambience = snd_ambience_temple; break;
			case spr_bg_heatnix:
			case spr_bg_heatnix_purple:
				ambience = snd_ambience_magma; break;
		}
		if ambience != "Level"
		{
			//If changing ambience, turn off the old one
			if ambience_changed != ambience
				audio_stop_sound(ambience_changed);
				
			ambience_changed = ambience
	
			//Play music
			if !audio_is_playing(ambience) //Loop when finished
				scr_make_sound(ambience,1,1,true);
		}
	}
	else
		audio_stop_sound(ambience_changed);
}

