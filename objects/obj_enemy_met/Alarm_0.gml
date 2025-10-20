/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Moving":	
			if distance_to_object(obj_player) < aggro_range
			{
				state = choose("Hide","Shoot");
				xspeed = 0;
					
				event_user(3); //Face player
				alarm[0] = 1;
			}
			else
				alarm[0] = 1;
			break
	
		case "Hide":
			switch (action)
			{
				case 0: //Start hiding
					action++;
					alarm[0] = 1;
					
					image_index = 0;
					sprite_index = spr_enemy_met_hide;
					animation_ended = false;
					
					scr_make_sound(snd_caterpillar_curl,0.5,1,false);
					shielding = true;
					break;
				
				case 1: //Stay hiding
					if animation_ended = true
					{
						animation_ended = false;
					
						action++;
						alarm[0] = 120; //Hiding length
						
						image_index = -1;
						image_speed = 0;
					}
					else
						alarm[0] = 1;
					break;
					
				case 2: //Unhiding
					action++;
					alarm[0] = 1;
					
					shielding = false;
					
					image_speed = -1;
					scr_make_sound(snd_caterpillar_uncurl,0.5,1,false);
					break;
					
				case 3: //Back to moving
					if image_index > 0
						alarm[0] = 1;
					else
					{
						action = 0;
						alarm[0] = 1;
					
						image_speed = 1;
						image_index = 0;
						state = "Shoot";
					}
					break;
			}
			break;

		case "Shoot":
			switch (action)
			{
				case 0: //Start shooting
					action++;
					alarm[0] = 1;
					
					image_index = 0;
					sprite_index = spr_enemy_met_shoot;
					animation_ended = false;
					
					event_user(3); //Face player
					break;
					
				case 1: //Spawn projectile
					alarm[0] = 1;
					if image_index > 3
					{
						action++;
					
						event_user(10);
					}
					break;
				
				case 2: //Stand for a bit after shooting
					if animation_ended = true
					{
						animation_ended = false;
					
						action++;
						alarm[0] = 60;
						
						image_index = 0;
						image_speed = 0;
					}
					else
						alarm[0] = 1;
					break;
					
				case 3: //Walk again
					action = 0;
					alarm[0] = 120;
					
					image_speed = 1;
					image_index = 0;
					sprite_index = spr_enemy_met;
					
					state = "Moving";
					break;
			}
			break;
			
		case "Jump":
			switch (action)
			{
				case 0: //Prepare to jump
					action++;
					alarm[0] = 1;
					
					image_index = 0;
					sprite_index = spr_enemy_met_jump_rise;
					animation_ended = false;
					
					xspeed = 0;
					break;
					
				case 1: //Jump up
					alarm[0] = 1;
					if image_index > 1
					{
						action++;
					
						yspeed = -2;
						xspeed = 1*image_xscale;
					}
					break;
				
				case 2: //Don't repeat
					if animation_ended = true
					{
						animation_ended = false;
					
						action++;
						alarm[0] = 1;
						
						image_index = -1;
						image_speed = 0;
					}
					else
						alarm[0] = 1;
					break;
					
				case 3: //Falling down animation
					alarm[0] = 1;
					if yspeed > 0
					{
						action++;
					
						image_index = 0;
						image_speed = 1;
						sprite_index = spr_enemy_met_jump_fall;
						animation_ended = false;
					}
					break;
					
				case 4: //Landing on the ground
					alarm[0] = 1;
					if airborne = false
					{
						action++;
						
						xspeed = 0;
					
						image_index = 0;
						image_speed = 1;
						sprite_index = spr_enemy_met_jump_land;
						animation_ended = false;
					}
					else
					{
						if animation_ended = true
						{
							animation_ended = false;
							image_index = 1;
						}
					}
					break;
					
				case 5:
					if animation_ended = true
					{
						animation_ended = false;
					
						action = 0
						alarm[0] = 1;
						
						image_index = 0;
						image_speed = 1;
						sprite_index = spr_enemy_met;
						state = "Moving";
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
	}
}