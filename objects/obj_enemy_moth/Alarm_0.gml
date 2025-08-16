/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (action)
	{
		case 0: //If player is close
			alarm[0] = 1;
			if distance_to_object(obj_player) < aggro_range
			{
				action++;
				image_speed = 1;	
			}
			break;
		
		case 1:
			event_user(3);
			//Fly towards a point above their head
			if distance_to_point(obj_player.x,obj_player.y-hover_height) < 10
			{	
				action++;
				alarm[0] = 10;
			}
			else
			{
				speed = 2;
				direction = point_direction(x,y,obj_player.x,obj_player.y-hover_height);
				
				alarm[0] = 1;
			}
			break;
			
		case 2: //Follow a path where it spins in a circle
			action++;
			alarm[0] = 20;
		
			sprite_index = spr_enemy_moth_spin;
			path_start(path_circle,0.8,path_action_continue,false);
			
			image_speed = 1;
			break;
			
		case 3: //Drop powder
			if shoot < shoot_max
			{
				alarm[0] = 20;
				
				shoot++;
				event_user(10);
			}
			else
			{
				action = 1;
				alarm[0] = 1;
				
				shoot = 0;
				path_end();
				
				hover_height = random_range(40,60);
				sprite_index = spr_enemy_moth;
				image_index = 0;
			}
			break;
	}
}