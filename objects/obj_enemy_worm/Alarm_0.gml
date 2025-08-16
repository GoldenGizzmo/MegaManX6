/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	alarm[0] = 1;
	switch (action)
	{
		case 0: //Rises out of the ground	
			if distance_to_object(obj_player) < aggro_range
			{
				action++;
				
				image_speed = 1;
				invul = false;
			}
			break;
		
		case 1:
			if animation_ended = true
			{
				animation_ended = false;
				
				action++;
				sprite_index = spr_enemy_worm_idle;
			}
			break;
			
		case 2:
			if animation_ended = true
			{
				animation_ended = false;
				
				action++;
				sprite_index = spr_enemy_worm_shoot;
			}
			break;
			
		case 3:
			if image_index > 11
			{
				event_user(10);
				
				action++;
			}
			break;
			
		case 4:
			if animation_ended = true
			{
				animation_ended = false;
				
				action = 1;
				sprite_index = spr_enemy_worm_idle;
			}
			break;
	}
}