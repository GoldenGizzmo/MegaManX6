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
			alarm[0] = 30;
			
			obj_player.animation_lock = false;
		}
		break;
		
	case 4: //Dialogue
		action_player++;
		alarm[0] = 10;
	
		conversation = instance_create_depth(0,0,0,obj_dialogue);
		conversation.dialogue = "Magma Furnace Intro";
		conversation.movement = false;
		break;

	case 5: //Do opening animation
		if !instance_exists(obj_dialogue)
		{
			action_player++;
			alarm[0] = 10;
			
			global.hud_toggle = true;
			
			instance_create_depth(0,0,0,obj_ready);
			global.music = "Level";
		}
		else
		{
			alarm[0] = 1;
			//Start music
		}
		break;	
		
	case 6: //READY
		alarm[0] = 1;
		if obj_ready.state = 4
		{
			action_player++;
			alarm[0] = 30;
		}
		break;
		
	case 7:
		obj_player.movement = true;
		instance_destroy();
		break
}