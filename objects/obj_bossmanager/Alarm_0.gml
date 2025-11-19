/// @description Insert description here
// You can write your code in this editor

with obj_player
	movement = false;

if global.level_completed = false
{
	switch (bossfight_state)
	{
		case 1: //Check if the player is on the ground first
			if obj_player.airborne = false
			{
				bossfight_state++;
				alarm[0] = 30;
			
				if miniboss = false
				{
					//Turn off music
					if global.music != "Off"
						audio_stop_sound(global.music);
					global.music = "Off";
					obj_background.ambience = "Off";
				}
				else
					alarm[0] = 1;
			}
			else
				alarm[0] = 1;
			break;
		
		case 2: //Spawn Warning
			bossfight_state++;
			alarm[0] = 1;
	
			if !instance_exists(obj_warning) and miniboss = false
				instance_create_depth(0,0,0,obj_warning)
			break;
		
		case 3: //Walk towards the boss intro
			if (!place_meeting(x,y,obj_player) and walk = true) or walk = false
			{
				//Once the warning is over
				if !instance_exists(obj_warning)
				{
					bossfight_state++;
					alarm[0] = 30;
					
					if miniboss = true
						alarm[0] = 1;
				}
				else
					alarm[0] = 1;
				
				//Stop running
				with obj_player
					sprite_index = spr_port_x_idle;
			}
			else
			{
				alarm[0] = 1;
			
				var move_direction = run_direction;
				with obj_player
				{
					image_speed = 1;
					if airborne = false
					{
						animation_lock = true;
						x += move_speed*move_direction;
						sprite_index = spr_port_x_move_loop;
					}
					else
						animation_lock = false;
				}
			}
			break;
		
		case 4: //Boss appears (Boss object has the openning code)
			if boss_theme = snd_music_investigator
				global.music = snd_music_investigator_intro;
			with boss
				state = "Appearance";
			break;
		
		case 5: //Dialogue (Skipped on retry)
			bossfight_state++;
			alarm[0] = 10;
	
			if dialogue != 0 and global.seen_boss_cutscene != boss
			{ 
				if boss != obj_boss_turtloid
				{
					conversation = instance_create_depth(0,0,0,obj_dialogue);
					conversation.dialogue = dialogue;
				}
				else
				{
					instance_create_depth(0,0,0,obj_cutscene_temple_boss);
					alarm[0] = -1;
				}
			
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
					alarm[0] = 1;
				}
			
				//Start music
				if boss_theme = snd_music_investigator
					audio_stop_sound(global.music);
				global.music = boss_theme;
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
				
			with obj_solid_door
				open_state = -1;
		
			with obj_player
			{
				movement = true;
				animation_lock = false;
			}
			break;
	}
}
else
{
	switch (bossfight_state)
	{
		case 1: //Check if the player is on the ground first
			if obj_player.airborne = false
			{	
				bossfight_state++;
				alarm[0] = 30;
				
				
			}
			else
				alarm[0] = 1;
			break;
	
		case 2:
			if obj_player.airborne = false
			{
				results = instance_create_depth(0,0,0,obj_results);	
				with results
				{
					state = 4;
					alarm[0] = 30;
				}
		
				with obj_player
					animation_lock = true;
			}
			else
				alarm[0] = 1;
			break;
	}
}














