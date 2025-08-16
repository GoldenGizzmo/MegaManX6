/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case "Appearance":
		switch (action)
		{
			case 1:
				if y < obj_player.y-40
				{
					alarm[0] = 1;
					
					yspeed = 1;
				}
				else
				{
					action++;
					alarm[0] = 1;
					
					yspeed = 0;
				}
				break;
				
			case 2:
				with obj_bossmanager
				{
					bossfight_state++;
					alarm[0] = 60;
				}
				break;
		}
		break;
		
	case "Openning":
		switch (action)
		{
			case 0:
				action++;
				alarm[0] = 1;
			
				sprite_index = spr_player_x_climb
				image_speed = 0;
				break;
				
			case 1:
				with obj_bossmanager
				{
					bossfight_state++;
					alarm[0] = 10;
				}
				break;
		}
		break;
	
}














