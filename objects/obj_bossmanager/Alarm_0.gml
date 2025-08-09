/// @description Insert description here
// You can write your code in this editor

switch (bossfight_state)
{
	case 1: //Check if the player is on the ground first
		if obj_player.airborne = false
		{
			bossfight_state++;
			alarm[0] = 30;
		}
		else
			alarm[0] = 1;
		break;
		
	case 2: //Spawn Warning
		bossfight_state++;
		alarm[0] = 1;
	
		if !instance_exists(obj_warning)
			instance_create_depth(0,0,0,obj_warning)
		break;
		
	case 3: //Walk towards the boss intro
		if !place_meeting(x,y,obj_player)
		{
			//Once the warning is over
			if !instance_exists(obj_warning)
			{
				bossfight_state++;
				alarm[0] = 60;
			}
			else
				alarm[0] = 1;
				
			//Stop running
			with obj_player
				sprite_index = spr_player_x_idle;
		}
		else
		{
			alarm[0] = 1;
			
			var move_direction = run_direction;
			with obj_player
			{
				animation_lock = true;
				x += move_speed*move_direction;
				sprite_index = spr_player_x_move_simple;
			}
		}
		break;
		
	case 4: //Boss appears (Boss object has the openning code)
		with boss
			state = "Openning";
		break;
		
	case 5: //Dialogue (Skipped on retry)
		break;
		
	case 6: //Do opening animation
		break;
		
	case 7:	//Fill healthbar
	
		break;
		
	case 8: //Being bossfight
	
		break;
}














