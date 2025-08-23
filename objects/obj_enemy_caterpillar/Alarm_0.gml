/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Turn":
			switch (action)
			{
				case 0: //Stop
					action++;
					alarm[0] = 30;
					
					image_speed = 0;
					xspeed = 0;
					break;
				
				case 1: //Start turning
					action++;
					alarm[0] = 1;
					
					image_speed = 1;
					image_index = 0;
					animation_ended = false;
					sprite_index = spr_enemy_caterpillar_turn;
					break;
					
				case 2: //Finish turning
					if animation_ended = true
					{
						image_xscale *= -1;
						state = "Moving";
						action = 0;
						sprite_index = spr_enemy_caterpillar;
						
						turn_delay = true;
						alarm[2] = 10;
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
			
		case "Curl":
			switch (action)
			{
				case 0: //Curl up
					action++;
					alarm[0] = 1;
					
					xspeed = 0;
					armour = true;
					
					//Animation
					animation_ended = false;
					image_index = 0;
					sprite_index = spr_enemy_caterpillar_curl;
					break;
					
				case 1: //Stop
					alarm[0] = 1;
					if animation_ended = true
					{						
						action++;
						alarm[0] = 60;
						
						image_index = -1;
						image_speed = 0;
					}
					break;
					
				case 2: //Start rolling around
					action = 0;
					alarm[1] = 120;
					
					image_speed = 1;
					state = "Rolling"
					sprite_index = spr_enemy_caterpillar_rolling;
					break;
			}
			break;
			
		case "Uncurl":
			switch (action)
			{
				case 0: //Stop
					alarm[0] = 1;
					if image_index < 1
					{
						action++;
						alarm[0] = 60;
					
						xspeed = 0;

						//Animation
						image_speed = 0;
					}
					break;
					
				case 1: //Uncurl
					action++;
					alarm[0] = 1;
							
					armour = false;
					
					//Animation
					animation_ended = false;
					sprite_index = spr_enemy_caterpillar_curl;
					image_index = image_number-1;
					image_speed = -1;
					break;
					
				case 2: //Fully uncurled
					alarm[0] = 1;
					if animation_ended = true
					{
						action = 0;
						
						image_speed = 1;
						state = "Moving"
						sprite_index = spr_enemy_caterpillar;
					}
					break;
			}
			break;
	}
}