/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Shooting":
			event_user(3); //Face Player
			switch (action)
			{
				case 0: //Wind up to fire blades
					alarm[0] = 1;
					action++;
					
					image_index = 0;
					sprite_index = spr_enemy_grasshopper_swipe;
					animation_ended = false;
					break;
					
				case 1: //Spawn projectile
					if image_index > 6
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
							alarm[0] = 60;
						}
						else
						{
							shoot = 0;
							state = "Spawning";
							alarm[0] = 180;
						}
						
						image_index = -1;
						sprite_index = spr_enemy_grasshopper_idle;
					}
					else
						alarm[0] = 1;
					break;
				
			}
			break;
			
		case "Spawning":
			switch (action)
			{
				case 0: //Reel up
					alarm[0] = 1;
					action++;
					
					image_index = 0;
					sprite_index = spr_enemy_grasshopper_spawn;
					animation_ended = false;
					break;
					
				case 1: //Spawn minions
					if image_index > 6
					{
						event_user(10);
						
						if shoot < spawn_max
						{
							shoot++;
							image_index = 2;
							image_speed = 1;
						}
						else
						{
							action++;
							image_speed = 1;
						}
					}
					alarm[0] = 1;
					break;
					
				case 2: //Finish animation
					if animation_ended = true
					{
						animation_ended = false;
						
						action = 0;
						shoot = 0;
						state = "Shooting";
						alarm[0] = 180;
						
						image_index = -1;
						sprite_index = spr_enemy_grasshopper_idle;
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
	}
}












