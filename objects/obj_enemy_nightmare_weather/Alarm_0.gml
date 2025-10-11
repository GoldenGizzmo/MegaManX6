/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	event_user(3); //Face Player
	switch (action)
	{
		case 0:
			if distance_to_object(obj_player) < aggro_range
			{
				alarm[0] = 60;
				action++;
				
				sprite_index = spr_enemy_nightmare_weather_shoot;
			}
			else
				alarm[0] = 1;
			break;
					
		case 1:
			if shoot < shoot_max
			{
				alarm[0] = 10;
				shoot++;
						
				event_user(10);
			}
			else
			{
				alarm[0] = 240;
				action = 0;
				shoot = 0;
						
				sprite_index = spr_enemy_nightmare_weather;
			}
			break;
	}
}