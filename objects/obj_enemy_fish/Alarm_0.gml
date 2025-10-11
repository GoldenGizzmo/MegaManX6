/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (action)
	{
		case 0: //If nearby, bite
			if distance_to_object(obj_player) < aggro_range and biting_cooldown = 0
			{
				action++;
				alarm[0] = 15+irandom(15);
	
				speed = 0;
			}
			else
			{
				alarm[0] = 1;
				
				//Move towards the player
				direction = point_direction(x,y,obj_player.x,obj_player.y);
				speed = 0.5;
				
				event_user(3);
			}
			break;
			
		case 1:
			action++;
			alarm[0] = 1;
			
			//Dash towards the player to bite them
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			speed = 5;
			event_user(3);
			
			scr_make_sound(snd_grasshopper_swipe,1,1,false);
		
			//Bite animation
			biting = true;
			animation_ended = false;
			sprite_index = spr_enemy_fish_bite;
			image_index = 0;
			break;
	
		case 2:
			//Keep mouth open
			if image_index > 1
				image_speed = 0;
		
			//Start slowing down
			if speed > 1
			{
				speed -= 0.15;
				alarm[0] = 1;
			}
			else
			{
				if shoot < shoot_amount
				{
					shoot++;
					
					action = 1;
				}
				else
				{
					action++;

					shoot = 1;			
				}
				alarm[0] = 1;
				image_speed = 1;
			}
			break;
			
		case 3:
			//Start closing mouth
			if animation_ended = true
			{
				animation_ended = false;
				scr_make_sound(snd_fish_bite,1.5,1,false);
				
				image_speed = 0;
				image_index = -1;
			}
		
			if speed > 0
			{
				speed -= 0.15;
				alarm[0] = 1;
			}
			else
			{
				action = 0;
				alarm[0] = 15;
				
				biting_cooldown = 30+irandom(30);
				
				biting = false;
				image_speed = 1;
				sprite_index = spr_enemy_fish;
				image_index = 0;
			}
			break;
	}
}