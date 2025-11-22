/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Follow":
			event_user(3); //Face Player
			if place_meeting(x,y,obj_camera)
			{
				if action < move_length and !place_meeting(x,y,obj_player)
				{
					alarm[0] = 1;
					action++;
				
					direction = point_direction(x,y,obj_player.x,obj_player.y);
					speed = move_speed;
					image_speed = move_speed;
				
					sprite_index = spr_enemy_nightmare_small_move;
				}
				else
				{
					alarm[0] = 60;
					action = 0;
			
					speed = 0;
					image_speed = 1;
					event_user(10);
					sprite_index = spr_enemy_nightmare_small;
				}
			}
			else
			{
				alarm[0] = 1;
				speed = 0;
				sprite_index = spr_enemy_nightmare_small;
			}
			break;
			
		case "Ride Chaser":
			if xstart < x
				image_xscale = -1;
			else
				image_xscale = 1;
		
			switch (action)
			{
				case 0:
					action++;
					alarm[0] = 1;
				
					x = obj_camera.x-random_range(-200,200);
					y = obj_camera.y-150;
					image_alpha = 1;
					break;
					
				case 1:
					if distance_to_point(xstart,ystart) > 5
					{
						alarm[0] = 1;
						
						speed = move_speed*2;
						image_speed = move_speed*2;
						direction = point_direction(x,y,xstart,ystart);
						sprite_index = spr_enemy_nightmare_small_move;
					}
					else
					{
						action = 0;
						alarm[0] = 30;
						
						damage = damage_store;
						state = "Follow";
						speed = 0;
						image_speed = 1;
						event_user(3);
						sprite_index = spr_enemy_nightmare_small;
						aggro_range = 999;
					}
					break;
			}
			break;
	}
}












