/// @description Insert description here
// You can write your code in this editor

switch (bossfight_state)
{
	case 1: //Check if the player is on the ground first
		if obj_player.airborne = false
		{
			bossfight_state++;
			alarm[0] = 30;
			
			//Turn off music
			audio_stop_sound(global.music);
			global.music = "Off";
			obj_background.ambience = "Off";
		}
		else
			alarm[0] = 1;
		break;
		
	case 2: //Spawn Warning
		bossfight_state++;
		alarm[0] = 1;
	
		if !instance_exists(obj_warning)
			instance_create_depth(0,0,0,obj_warning)
		break;
		
	case 3: //Walk towards the boss intro
		if !place_meeting(x,y,obj_player)
		{
			//Once the warning is over
			if !instance_exists(obj_warning)
			{
				bossfight_state++;
				alarm[0] = 60;
			}
			else
				alarm[0] = 1;
				
			//Stop running
			with obj_player
				sprite_index = spr_player_x_idle;
		}
		else
		{
			alarm[0] = 1;
			
			var move_direction = run_direction;
			with obj_player
			{
				animation_lock = true;
				x += move_speed*move_direction;
				sprite_index = spr_player_x_move_simple;
			}
		}
		break;
		
	case 4: //Boss appears (Boss object has the openning code)
		global.music = snd_music_investigator_intro;
		with boss
			state = "Appearance";
		break;
		
	case 5: //Dialogue (Skipped on retry)
		bossfight_state++;
		alarm[0] = 10;
	
		if dialogue != 0 and global.seen_boss_cutscene != boss
		{
			conversation = instance_create_depth(0,0,0,obj_dialogue);
			conversation.dialogue = dialogue;
			
			//Only see this dialogue once
			global.seen_boss_cutscene = boss;
		}
		break;
		
	case 6: //Do opening animation
		if !instance_exists(obj_dialogue)
		{
			with boss
			{
				state = "Openning";
				action = 0;
				alarm[0] = 60;
			}
			
			//Start music
			audio_stop_sound(global.music);
			global.music = snd_music_investigator;
		}
		else
			alarm[0] = 1;
		break;
		
	case 7:	//Fill healthbar
		if lifebar_intro > 0
		{
			alarm[0] = 1;	
			lifebar_intro -= boss.lifemax/100;
			scr_make_sound(snd_healing,0.5,1,false);
		}
		else
		{
			bossfight_state++;
			alarm[0] = 60;
		}
		break;
		
	case 8: //Being bossfight
		bossfight_begin = true;
		
		with boss
			alarm[1] = 1;
		
		with obj_player
		{
			movement = true;
			animation_lock = false;
		}
		break;
}














