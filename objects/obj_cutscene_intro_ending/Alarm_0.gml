/// @description Insert description here
// You can write your code in this editor

switch (action)
{
	case 0: //Check if the player is on the ground first
		alarm[0] = 1;
		if obj_player.airborne = false
			action++;
		break;
		
	case 1: //Move towards the center of the screen
		if obj_player.x < obj_camera.x+5 and obj_player.x > obj_camera.x-5
		{
			action++;
			alarm[0] = 30;
			
			with obj_player
			{
				//Face High Max
				image_xscale = 1;
				if obj_boss_highmax.x < x 
					image_xscale = -1;
				
				//Stop running
				sprite_index = spr_port_x_idle;
			}
		}
		else
		{
			alarm[0] = 1;
			
			with obj_player
			{
				var move_direction = 1;
				if obj_camera.x < x
					move_direction = -1;
				
				animation_lock = true;
				image_xscale = move_direction;
				x += move_speed*move_direction;
				sprite_index = spr_port_x_move_loop;
			}
		}
		
		//Face the player
		with obj_boss_highmax
			event_user(3);
		break;
		
	case 2:	//Start talking
		action++;
		alarm[0] = 10;
	
		conversation = instance_create_depth(0,0,0,obj_dialogue);
		conversation.dialogue = "High Max Escape";
		conversation.movement = false;
		break;
		
	case 3:
		if !instance_exists(obj_dialogue)
		{
			action++;
			alarm[0] = 1;
			
			with obj_boss_highmax
			{
				alarm[0] = 30;
				state = "Punching";
			}
		}
		else
			alarm[0] = 1;
		break;
		
	case 4:
		var check = false;
		alarm[0] = 1;
	
		with obj_boss_highmax
			if action = 3
				check = true;
				
		if check = true
		{
			action++;
			alarm[0] = 30
			
			hold_pose = true;
		}
		break;
		
	case 5:	//Start talking
		action++;
		alarm[0] = 10;
	
		conversation = instance_create_depth(0,0,0,obj_dialogue);
		conversation.dialogue = "High Max Escape 2";
		conversation.movement = false;
		break;
		
	case 6:
		if !instance_exists(obj_dialogue)
		{
			action++;
			alarm[0] = 1;
			
			//High Max continues his punch
			hold_pose = false;
			
			with obj_player
			{
				image_index = 0;
				sprite_index = spr_port_x_warp_out;
			}
		}
		else
			alarm[0] = 1;
		break;
		
	case 7:
		if obj_player.image_index > obj_player.image_number-1
		{
			action++;
			alarm[0] = 240;
			
			warp_out = true;
			scr_make_sound(snd_player_x_warp_out,1,1,false);
			
			with obj_player
				image_alpha = 0;
		}
		else
			alarm[0] = 1;
		break;
		
	case 8:	//Start talking
		action++;
		alarm[0] = 10;
	
		conversation = instance_create_depth(0,0,0,obj_dialogue);
		conversation.dialogue = "High Max Escape 3";
		conversation.movement = false;
		break;
		
	case 9:
		if !instance_exists(obj_dialogue)
		{
			action++;
			alarm[0] = 1;
			
			fade = instance_create_depth(obj_camera.x,obj_camera.y,0,obj_fade_out)
			fade.fade_speed = 0.015;
		} 
		else
			alarm[0] = 1;
		break;
		
	case 10:
		alarm[0] = 1;
		if fade.alpha >= 1
			room_goto(rm_yammark);
		break;
	
	
}