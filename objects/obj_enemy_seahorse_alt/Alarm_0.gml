/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Jumping":
			switch (action)
			{
				case 0: //Set up attack
					if distance_to_object(obj_player) < aggro_range
					{
						action++;
						alarm[0] = 1;
	
						event_user(3);

						sprite_index = spr_enemy_seahorse_jump;
						image_index = 0;
						
						yspeed = 0.5;
					}
					else
						alarm[0] = 1;
					break;
			
				case 1: //Spawn projectile
					if image_index > 3
					{
						image_speed = 0;
						yspeed = -5.5;
	
						action++;
						alarm[0] = 1;
					}
					else
						alarm[0] = 1;
					break;
					
				case 2: //Finish animation
					if yspeed < 0 //Slow down
					{
						weight = 0.1;
						alarm[0] = 1;
					}
					else
					{
						action++;
						alarm[0] = 1;
						
						yspeed = 0;
						weight = 0;
					
						image_speed = 1;
					}
					break;
					
				case 3: //Spawn projectile
					if image_index > 6
					{
						event_user(3);
						event_user(10);
						animation_ended = false;
	
						action++;
						alarm[0] = 1;
					}
					else
						alarm[0] = 1;
					break;
					
				case 4:
					if animation_ended = true
					{
						animation_ended = false;
						
						action++;
						alarm[0] = 1
						
						image_speed = 0;
						image_index = -1;
					
						weight = 0.1;
					}
					else
						alarm[0] = 1;
					break;
					
				case 5:
					if y < ystart
						alarm[0] = 1;
					else
					{
						action++;
						alarm[0] = 1;
						
						weight = 0;
						yspeed = 1;
						
						image_speed = 1;
						image_index = 0;
						sprite_index = spr_enemy_seahorse_alt;
					}
					break;
					
				case 6:
					if y > ystart
					{
						alarm[0] = 1;
						if yspeed > -1
							yspeed -= 0.1;
					}
					else
					{
						action = 0;
						alarm[0] = 60;
						
						yspeed = 0;
					}
					break;
			}
			break;
	}
}