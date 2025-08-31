// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_make_sound(sound,volume,pitch,loop)
{
	var priority = 10;
	
	//Reduce/Increase sound volumes
	switch (sound)
	{
		//Too loud
		case snd_explosion_bullet: volume *= 0.5; break;
		case snd_armour: volume *= 0.5; break;
		case snd_rescue: volume *= 0.25; break;
		
		case snd_player_x_charge_fadeout: volume *= 0.75; break;
		case snd_player_x_landing: volume *= 0.75; break;
		
		case snd_worm: volume *= 0.5; break;
		case snd_worm_shoot: volume *= 0.5; break;
		case snd_yammark_reinforcement: volume *= 0.75; break;
		case snd_firefly: volume *= 0.25; break;
		case snd_grasshopper_spawn: volume *= 0.5; break;
		
		//Too quiet
		case snd_soul_collect: volume *= 1.5; break;
		
		case snd_player_x_talk_chargeshot: volume *= 1.75; break;
		case snd_player_x_talk_chargeshot_2: volume *= 1.75; break;
		case snd_player_x_talk_chargeshot_3: volume *= 1.75; break;
		case snd_player_x_talk_weapon: volume *= 1.5; break;
		case snd_player_x_talk_weapon_2: volume *= 1.5; break;
		
		case snd_grasshopper_swipe: volume *= 1.25; break;
		
		
		//Ambience Management
		case snd_ambience_rainforest: volume *= 0.5; break;
		case snd_ambience_wilderness: volume *= 2; break;
	}

	audio_stop_sound(sound); //Reset dupilcate sounds
	audio_sound_pitch(sound,pitch); //Reset pitch
	audio_sound_gain(sound,volume,0);
	audio_play_sound(sound,priority,loop);
}