/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (action)
	{
		case 0:
			alarm[0] = 1;
			if distance_to_object(obj_player) < aggro_range
			{
				action++;
				
				sprite_index = spr_enemy_met_fly_shoot;
				image_index = 0;
				animation_ended = false;
			}	
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
					alarm[0] = 180;
						
					image_index = -1;
					sprite_index = spr_enemy_met_fly;
				}
				else
					alarm[0] = 1;
				break;
	}
}