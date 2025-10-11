/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (action)
	{
		case 0: //If in range
			event_user(3); //Face player
			if distance_to_object(obj_player) < aggro_range
			{
				action++;
				alarm[0] = 30;
			}
			else
				alarm[0] = 1;
			break;
			
		case 1: //Start attacking
			action++;
			alarm[0] = 1;
			
			animation_ended = false;
			image_speed = 1;
			break;
			
		case 2: //Spawn projectile
			if image_index > 3
			{
				event_user(10);
	
				action++;
				alarm[0] = 1;
			}
			else
				alarm[0] = 1;
			break;
			
		case 3: //Finish animating
			if animation_ended = true
			{
				animation_ended = false;
				
				action = 0;
				alarm[0] = 120; 
				
				image_index = 0;
				image_speed = 0;
			}
			else
				alarm[0] = 1;
			break;
	}
}