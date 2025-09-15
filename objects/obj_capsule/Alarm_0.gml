/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case 0: //Check if player is near
		alarm[0] = 1;
		if obj_player.x > x-60 and obj_player.x < x+60 and distance_to_object(obj_player) < 100 and obj_player.y < y+30
		{
			state++;
			alarm[0] = 30;
			
			with obj_player
			{
				movement = false;
				xspeed = 0;
			}
		}
		break;
		
	case 1: //Reveal Dr. Light
		alarm[0] = 1;
		if active_alpha > 0.4
			active_alpha -= 0.02;
		else
		{
			state++;
			alarm[0] = 1;
		}
		break
		
	case 2: //Fade into his real form
		alarm[0] = 1;
		if dr_light_alpha < 1
			dr_light_alpha += 0.02;
		else
		{
			state++;
			alarm[0] = 30;
		}
		break;
		
	case 3: //Open dialogue
		state++;
		alarm[0] = 10;
	
		audio_stop_sound(global.music);
		global.music = snd_music_dr_light;
		
		conversation = instance_create_depth(0,0,0,obj_dialogue);
		conversation.dialogue = dialogue;
		break;
		
	case 4: //Do opening animation
		alarm[0] = 1;
		if !instance_exists(obj_dialogue)
		{
			obj_player.movement = false;
			if dr_light_alpha > 0
			{
				dr_light_alpha -= 0.05;
				active_alpha -= 0.05;
			}
			else
			{
				state++;
				alarm[0] = 30;
			
				obj_player.movement = true;
				
				audio_stop_sound(global.music);
				global.music = "Level";
			}
		}	
		break;
		
	case 5: //Getting into the capsule
		alarm[0] = 1;
		if place_meeting(x,y,obj_player) and obj_player.airborne = false
		{
			state++;
			alarm[0] = 120;
			
			//Lock the player into the middle of the capsule
			obj_player.x = x;
			obj_player.y = y+4;
			obj_player.xspeed = 0;
			obj_player.movement = false;
			global.weapon_choice = 0; //Basic colour
			
			//Draw upgrading effect
			effect = instance_create_layer(x,y,"Explosions",obj_capsule_effect);
			
			scr_make_sound(snd_capsule_charging,1,1,true);
		}
		break;
		
	case 6: //Spawn lightning
		state++;
		alarm[0] = 10;
	
		for (var i = 0; i < 3; i++)
		{
			var _direction, _x, _y;
			var range = 600;
			switch (i)
			{
				case 0:
					_x = 0;
					_y = -range;
					_direction = 270;
					break;	
				case 1:
					_x = range/1.5;
					_y = -range/1.5;
					_direction = 225;
					break;		
				case 2:
					_x = -range/1.5;
					_y = -range/1.5;
					_direction = 315;
					break;
			}
			
			lightning = instance_create_depth(x+_x,y+_y-5,depth+1,obj_capsule_lightning);
			lightning.direction = _direction;
			lightning.image_angle = _direction;
			lightning.speed = 20;
		}
		break;
		
	case 7: //Struck by lightning
		alarm[0] = 1;
		if !instance_exists(obj_capsule_lightning)
		{
			state++;
			alarm[0] = 60;
			
			audio_stop_sound(snd_capsule_charging);
			scr_make_sound(snd_capsule_finish,1,1,false);
		
			image_speed = 1;
			image_blend = c_white;
			sprite_index = spr_capsule_shocked;
			with effect
				sprite_index = spr_capsule_charge_fully;
		}
		break;
		
	case 8: //Get upgrade
		state++;
		alarm[0] = 10;
		
		active = false;
		
		//Get the upgrade
		switch (upgrade)
		{
			case "Blade Head":
				global.x_armour_head = upgrade;
				global.blade_head_get = true;
				break;
			case "Blade Chest":
				global.x_armour_chest = upgrade;
				global.blade_chest_get = true;
				break;
			case "Blade Arm":
				global.x_armour_arm = upgrade;
				global.blade_arm_get = true;
				break;
			case "Blade Leg":
				global.x_armour_leg = upgrade;
				global.blade_leg_get = true;
				break;
				
			case "Shadow Head":
				global.x_armour_head = upgrade;
				global.shadow_head_get = true;
				break;
			case "Shadow Chest":
				global.x_armour_chest = upgrade;
				global.shadow_chest_get = true;
				break;
			case "Shadow Arm":
				global.x_armour_arm = upgrade;
				global.shadow_arm_get = true;
				break;
			case "Shadow Leg":
				global.x_armour_leg = upgrade;
				global.shadow_leg_get = true;
				break;
		}
		break;
		
	case 9: //Lingering effect
		state++;
		alarm[0] = 1;
		
		with obj_player
		{
			image_index = 0;
			sprite_index = spr_player_x_victory;
			animation_lock = true;
		}
	
		with effect
			instance_destroy();
		break;
		
	case 10:
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
		
	case 11:
		state++;
		
		with obj_player
		{
			movement = true;
			animation_lock = false;
			image_speed = 1;
		}
		break;
}