/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Shooting":
			switch (action)
			{
				case 0: //Set up attack
					if distance_to_object(obj_player) < aggro_range
					{
						action++;
						alarm[0] = 1;
	
						event_user(3);

						animation_ended = false;
						sprite_index = spr_enemy_seahorse_shoot;
						image_index = 0;
					}
					else
						alarm[0] = 1;
					break;
			
				case 1: //Spawn projectile
					if image_index > 5
					{
						event_user(10);
	
						action++;
						alarm[0] = 1;
					}
					else
						alarm[0] = 1;
					break;
					
				case 2: //Finish animation
					if animation_ended = true
					{
						animation_ended = false;
						
						action = 0;
						if shoot < shoot_max-1
						{
							shoot++;
							alarm[0] = 10;
						}
						else
						{
							shoot = 0;
							state = "Diving";
							alarm[0] = 60;
						}
						
						image_index = -1;
						sprite_index = spr_enemy_seahorse;
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
			
		case "Diving":
			switch (action)
			{
				case 0: //Set up attack
					if distance_to_object(obj_player) < aggro_range
					{
						action++;
						alarm[0] = 1;
	
						event_user(3);

						animation_ended = false;
						sprite_index = spr_enemy_seahorse_curled;
						image_index = 0;
					}
					else
						alarm[0] = 1;
					break;
					
				case 1: //Finish animation
					if animation_ended = true
					{
						action++;
						alarm[0] = 1;
						
						animation_ended = false;
						event_user(3);
						
						curled = true;
						image_index = -1
						image_speed = 0;
						
						direction = 90;
						speed = 4.5;
					}
					else
						alarm[0] = 1;
					break;
					
				case 2: //If meetting player Y
					if y < obj_player.y-15
					{
						action++;
						alarm[0] = 30;
			
						speed = 0;
					}
					else
						alarm[0] = 1;
					break;
		
				case 3:
					action++;
					alarm[0] = 1;
				
					if obj_player.x > x
						direction = 0
					else
						direction = 180;
			
					speed = 4.5;
					break;
					
				case 4: //If meetting player X
					if x > obj_player.x-5 and x < obj_player.x+5
					{
						direction = 270;
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
	}
}