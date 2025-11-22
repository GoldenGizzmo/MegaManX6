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
				
				scr_make_sound(snd_worm,1,1,false);
				
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
				shoot = 0;
				
				action++;
				sprite_index = spr_enemy_worm_shoot_fire;
			}
			break;
			
		case 3:
			if image_index > 3
			{
				//Shoot a stream of fire
				if shoot < shoot_amount
				{
					shoot++;
					image_index = 2;
					
					event_user(10);
				}
				else
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