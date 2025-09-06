/// @description Insert description here
// You can write your code in this editor

switch (action)
{
	case 0: //Warp sound
		alarm[0] = 1;
		action++;

		scr_make_sound(snd_player_x_warp_in,1,1,false);
		break;
	
	case 1:	//Warp in from offscreen
		alarm[0] = 1;
		
		//If warp beam is higher than the player start position
		if warp_y+warp_speed > 0
			warp_y -= warp_speed;
		else
		{
			action++;
			
			//Turn into the player
			warping_in = false;
			with obj_player
			{
				image_alpha = 1;
				sprite_index = spr_player_x_warp_no_armour;
				image_index = 0;
				image_xscale = 1;
			}
		}
		break;
		
	case 2: //Player idle animation
		if obj_player.image_index > obj_player.image_number-1
		{
			action++;
			alarm[0] = 60;
			
			with obj_player
			{
				animation_lock = false;
				image_index = 0;
			}
		}
		else
			alarm[0] = 1;
		break;
		
	case 3: //Dialogue
		action++;
		alarm[0] = 10;
	
		conversation = instance_create_depth(0,0,0,obj_dialogue);
		conversation.dialogue = "Amazon Ruins Intro";
		conversation.movement = false;
		break;
		
	case 4: //Do opening animation
		if !instance_exists(obj_dialogue)
		{
			action++;
			alarm[0] = 10;
			
			instance_create_depth(0,0,0,obj_ready);
			global.music = "Level";
		}
		else
		{
			alarm[0] = 1;
			//Start music
		}
		break;
		
	case 5: //Equip armour
		alarm[0] = 1;
		if obj_ready.state = 4
		{
			action++;
			global.hud_toggle = true;
			
			with obj_player
			{
				animation_lock = true;
				image_index = 0;
				sprite_index = spr_player_x_armour_up;
			}
		}
		break;
		
	case 6: //Player idle animation
		if obj_player.image_index > obj_player.image_number-1
		{
			action++;
			alarm[0] = 30;
			
			obj_player.image_index = -1;
			obj_player.image_speed = 0;
		}
		else
			alarm[0] = 1;
		break;
		
	case 7: //Play	
		with obj_player
		{
			movement = true;
			
			animation_lock = false;
			image_index = 0;
		}
		break
}