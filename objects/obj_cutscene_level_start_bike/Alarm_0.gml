/// @description Insert description here
// You can write your code in this editor

switch (action_player)
{
	case 0: //Appear from offscreen
		alarm[0] = 1;
		if obj_player.x < obj_camera.x
			xspeed = 8;
		else
		{
			action_player++;
			obj_player.colliding = true;
		}
		break;
		
	case 1: //Reel back to player position	
		alarm[0] = 1;
		if obj_player.x > 1120
		{
			if xspeed > -8
				xspeed -= 0.2
		
		}
		else
			action_player++;
		break
		
	case 2: //Stopping
		alarm[0] = 1;
		if xspeed < 0
			xspeed += 0.5;
		else
		{
			if obj_player.image_index > 2 //Sync with reeling down animation
			{
				action_player++;
				obj_player.image_index = 0;
				obj_player.sprite_index = spr_port_x_bike_reel_end;
			}
			
			xspeed = 0;
		}
		break;
		
	case 3: //Finishing reeling down animation
		alarm[0] = 1;
		if obj_player.image_index > 2
		{
			action_player++;
			obj_player.animation_lock = false;
		}
		break;
		
	case 4: //READY
		obj_player.movement = true;
		instance_destroy();
		break;
}