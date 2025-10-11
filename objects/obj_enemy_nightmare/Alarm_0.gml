/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Follow":
			event_user(3); //Face Player
			if action < 160 and !place_meeting(x,y,obj_player)
			{
				alarm[0] = 1;
				action++;
			
				direction = point_direction(x,y,obj_player.x,obj_player.y);
				
				sprite_index = spr_enemy_nightmare_move;
			}
			else
			{
				alarm[0] = 60;
				action = 0;
			
				sprite_index = spr_enemy_nightmare;
			}
			break;
		
		case "Shooting":
			event_user(3); //Face Player
			switch (action)
			{
				case 0:
					if distance_to_object(obj_player) < aggro_range
					{
						alarm[0] = 60;
						action++;
				
						sprite_index = spr_enemy_nightmare_shoot;
					}
					else
					{
						direction = point_direction(x,y,obj_player.x,obj_player.y);
						sprite_index = spr_enemy_nightmare_move;
						alarm[0] = 1;
					}
					break;
					
				case 1:
					if distance_to_object(obj_player) < aggro_range+60 //If still in aggro range
					{
						if shoot < shoot_max 
						{
							alarm[0] = 60;
							shoot++;
						
							event_user(10);
						}
						else
						{
							alarm[0] = 120;
							action = 0;
							shoot = 0;
							state = "Follow"
						
							sprite_index = spr_enemy_nightmare;
						}
					}
					else
					{
						//If out of range, pursue
						alarm[0] = 30;
						action = 0;
						shoot = 0;
						state = "Follow"
						
						sprite_index = spr_enemy_nightmare;
					}
					break;
			}
			break;
	}
}












