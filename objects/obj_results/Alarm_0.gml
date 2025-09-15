/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case 0:
		state++;
		alarm[0] = 180;
	
		scr_make_sound(snd_soul_large,1,1,false);
		with obj_pickup
		{
			direction = point_direction(x,y,obj_player.x,obj_player.y)+180;
			if large_soul_state = 1
				large_soul_state = 2;
		}
		break;
		
	case 1:
		state++;
		alarm[0] = 10;
		
		stage_clear = snd_music_stageclear_x;
		scr_make_sound(stage_clear,1,1,false);
		break;
		
	case 2:
		alarm[0] = 1;
		if !audio_is_playing(stage_clear)
		{
			state++;
			alarm[0] = 1;
		
			with obj_player
			{
				image_index = 0;
				sprite_index = spr_player_x_victory;
				animation_lock = true;
			}
		}
		break;
		
	case 3:
		if obj_player.image_index > obj_player.image_number-1
		{
			state++;
			alarm[0] = 60;
			
			with obj_player
			{
				image_index = -1;
				image_speed = 0;
			}
		}
		else
			alarm[0] = 1;
		break;
		
	case 4:
		state++;
		alarm[0] = 1;
	
		with obj_player
		{
			image_index = 0;
			image_speed = 1;
			sprite_index = spr_player_x_warp_out;
		}
		break;
		
	case 5:
		if obj_player.image_index > obj_player.image_number-1
		{
			state++;
			alarm[0] = 30;
			
			warp_out = true;
			scr_make_sound(snd_player_x_warp_out,1,1,false);
			
			with obj_player
				image_alpha = 0;
		}
		else
			alarm[0] = 1;
		break;
		
	case 6:
		state++;
		alarm[0] = 1;
	
		fade = instance_create_depth(obj_camera.x,obj_camera.y,0,obj_fade_out)
		fade.fade_speed = 0.015;
		break;
		
	case 7:
		if fade.alpha >= 1
			room_goto(rm_yammark);
		break;
}