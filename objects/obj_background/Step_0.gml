/// @description Insert description here
// You can write your code in this editor

if ambience != "Off"
{
	switch (background)
	{
		case spr_bg_yammark_temples: ambience = snd_ambience_rainforest; break;
		case spr_bg_yammark_cave: ambience = snd_ambience_watercave; break;
		case spr_bg_yammark_ruins: ambience = snd_ambience_wilderness; break;
	}
	//If changing ambience, turn off the old one
	if ambience_changed != ambience
		audio_stop_sound(ambience_changed);
				
	ambience_changed = ambience
	
	//Play music
	if !audio_is_playing(ambience) //Loop when finished
		scr_make_sound(ambience,1,1,true);
}
else
	audio_stop_sound(ambience_changed);

