/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (action)
	{
		case 0: //Check if above the player
			if x < obj_player.x+aggro_range and x > obj_player.x-aggro_range and y < obj_player.y
			{	
				action++;
				alarm[0] = 1;
						
				image_index = 0;
				image_speed = 1;
				animation_ended = false;
			}
			else
			{
				alarm[0] = 1;
				
				xspeed = 2*image_xscale;
				//Move towards the player at a delayed rate
				if global.animate%60 = 0
					event_user(3);
			}
			break;
			
		case 1: //Turned towards the camera
			if animation_ended = true
			{
				action++;
				
				//Activate the drill
				with drill	
					alarm[0] = 1;
				
				animation_ended = false;
				
				image_index = -1;
				image_speed = 0;
				xspeed = 0;			
			}
			else
				alarm[0] = 1;
			break;
	}
}