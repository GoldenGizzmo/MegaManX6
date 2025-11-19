/// @description Insert description here
// You can write your code in this editor

switch (action)
{
	case 0: //READY
		alarm[0] = 1;
		if obj_ready.state = 6
			action++;
		break;
		
	case 1: //Warp sound
		alarm[0] = 1;
		action++;
		
		global.hud_toggle = true;
		scr_make_sound(snd_player_x_warp_in,1,1,false);
		break;
	
	case 2:	//Warp in from offscreen
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
				change_sprite(spr_manager, spr_port_x_warp_in, undefined, sprite_loop_type.no_loop)
				image_index = 0;
				image_xscale = 1;
			}
		}
		break;
		
	case 3: //Player idle animation
		if obj_player.image_index > obj_player.image_number-1
		{
			action++;
			alarm[0] = 1;
			
			with obj_player
			{
				animation_lock = false;
				image_index = 0;
			}
		}
		else
			alarm[0] = 1;
		break;
		
	case 4: //Play	
		with obj_player
			movement = true;
		break
}

//obj_player.movement = true;
//spawning_start = true;