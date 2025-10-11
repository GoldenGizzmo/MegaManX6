/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (action)
	{
		case 0: //Fly forward		
			action++;
			alarm[0] = 15;
			
			xspeed = 6*image_xscale;
			sprite_index = spr_enemy_probe_move;
			break;
			
		case 1: //Stop
			action++;
			alarm[0] = 30;
		
			xspeed = 0;
			sprite_index = spr_enemy_probe;
			image_index = 0;
			image_speed = 0;
			break;
			
		case 2: //Aim direction
			action++;
			alarm[0] = 1;
			
			event_user(3);
			image_index = 0; //Look forward
			if obj_player.y < y-30 and (obj_player.x < x+15 and obj_player.x > x-15) {image_index = 1;} //Look all the way up	
			else if obj_player.y > y+30 and (obj_player.x < x+15 and obj_player.x > x-15) {image_index = 4;} //Look all the way down	
			else if obj_player.y < y-30 {image_index = 2;} //Look up
			else if obj_player.y > y+30 {image_index = 3;} //Look down	
			
			shoot = 0;
			shoot_amount = 3;
			break;
			
		case 3:
			if shoot < shoot_amount
			{
				shoot++;
				alarm[0] = 10; //Fire rate
				
				event_user(10);
			}
			else
			{
				action++;
				alarm[0] = 60;
			}
			break;
			
		case 4: //If player retreats away, move closer
			if distance_to_object(obj_player) > aggro_range
			{
				action++;
				alarm[0] = 15;
			
				xspeed = 6*image_xscale;
				sprite_index = spr_enemy_probe_move;
			}
			else
			{
				//If already close, attack again
				action = 6;
				alarm[0] = 1;
			}
			break;
			
		case 5: //Stop
			action++;
			alarm[0] = 60;
		
			xspeed = 0;
			sprite_index = spr_enemy_probe;
			image_index = 0;
			image_speed = 0;
			break;
			
		case 6: //Aim direction
			action++;
			alarm[0] = 1;
			
			event_user(3);
			image_index = 0; //Look forward
			if obj_player.y < y-30 and (obj_player.x < x+15 and obj_player.x > x-15) {image_index = 1;} //Look all the way up	
			else if obj_player.y > y+30 and (obj_player.x < x+15 and obj_player.x > x-15) {image_index = 4;} //Look all the way down	
			else if obj_player.y < y-30 {image_index = 2;} //Look up
			else if obj_player.y > y+30 {image_index = 3;} //Look down	
			
			shoot = 0;
			shoot_amount = 3;
			break;
			
		case 7:
			if shoot < shoot_amount
			{
				shoot++;
				alarm[0] = 10; //Fire rate
				
				event_user(10);
			}
			else
			{
				action++;
				alarm[0] = 60;
				
				shoot = 0;
				shoot_amount = 10;
			}
			break;
			
		case 8: //GO CRAZY
			if shoot < shoot_amount
			{
				shoot++;
				alarm[0] = 10; //Fire rate
				
				if image_index > 0
					image_index--;
				else 
					image_index = 4;
				event_user(10);
			}
			else
			{
				//Leave out of shame
				image_index = 0;
				yspeed = -4;
			}
			break;
	}
}