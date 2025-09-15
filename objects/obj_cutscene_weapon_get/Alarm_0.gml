/// @description Insert description here
// You can write your code in this editor

switch (action)
{
	case 0: //Portrait appears
		action++;
		alarm[0] = 120;
		break;
		
	case 1: //White shine
		action++;
		alarm[0] = 1;
		
		fade = instance_create_depth(0,0,0,obj_fade_out);
		fade.image_blend = c_white;
		fade.fade_speed = 0.2;
		
		scr_make_sound(snd_pose,1,1,false);
		break;
		
	case 2: //Flash to retrieve power
		if fade.alpha >= 1
		{
			action++;
			alarm[0] = 180;
			
			instance_destroy(fade);
			fade = instance_create_depth(0,0,0,obj_fade_in);
			fade.image_blend = c_white;
			fade.fade_speed = 0.01;
			
			scr_weapon_menus(weapon);
			switch (weapon)
			{
				case "Yanma Option": 
					x_colour = 1; 
					global.weapon_choice = 1;
					break;
			}
			
			//Change background colour
			particle_lines_colour = weapon_ammo_colour;
			obj_background.bg_colour = weapon_ammo_colour;
		}
		else
			alarm[0] = 1;
		break;
	
	case 3: //Fade out to gameplay
		alarm[0] = 1;
	
		if intro_bg.bg_alpha > 0
		{
			intro_bg.bg_alpha -= 0.05;
			particle_lines_alpha -= 0.05;
		}
		else
		{
			alarm[0] = 30;
			action++;
		}
		break
	
	case 4: //Warp sound
		alarm[0] = 1;
		action++;
		
		scr_make_sound(snd_player_x_warp_in,1,1,false);
		break;
	
	case 5:	//Warp in from offscreen
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
				sprite_index = spr_player_x_warp_in;
				image_index = 0;
				image_xscale = 1;
			}
		}
		break;
		
	case 6: //Player idle animation
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
		
	case 7: //Play	
		action++;
		alarm[0] = 180;
	
		with obj_player
		{
			movement = true;
		}
		break
		
	case 8:
		alarm[0] = 1
		if continue_fade < 0.01
			action++;
		break;
}

//obj_player.movement = true;
//spawning_start = true;