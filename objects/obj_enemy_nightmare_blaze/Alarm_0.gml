/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Follow":
			if (action < 60 and !place_meeting(x,y,obj_player)) or place_meeting(x,y,obj_solid)
			{
				alarm[0] = 1;
				action++;

				speed = 1;
				sprite_index = spr_enemy_nightmare_blaze_move;
				
				//Move out of walls
				if place_meeting(x,y,obj_solid) or instance_exists(obj_ridechaser) //Prevent flying offscreen during chase
				{
					direction = point_direction(x,y,obj_camera.x,obj_camera.y);
					event_user(3);
				}
			}
			else
			{
				alarm[0] = 30;
				action = 0;
			
				speed = 0;
				event_user(3); //Face Player
				sprite_index = spr_enemy_nightmare_blaze;
				state = "Shooting"
			}
			break;
		
		case "Shooting":
			event_user(3); //Face Player
			switch (action)
			{
				case 0: //Prepare to attack
					alarm[0] = 1;
					if place_meeting(x,y,obj_camera)
					{
						action++;
		
						sprite_index = spr_enemy_nightmare_blaze_shoot;
						image_index = 0;
						animation_ended = false;
				
						scr_make_sound(snd_fire,1,1,false);
					}
					else if instance_exists(obj_ridechaser) //Prevent getting stuck in bike sections
					{
						action = 0;
						state = "Follow"
					}
					break;
	
				case 1: //Reaching attack animation
					alarm[0] = 1;
					if image_index > 4
					{
						action++;
						image_speed = 2;
					}
					break;
			
				case 2: //Loop attacking animation
					alarm[0] = 1;
					if shoot < shoot_amount
					{		
						if animation_ended = true
						{
							animation_ended = false;
			
							image_index = 4;
						}
			
						shoot++;
						if shoot%30 = 0 and obj_player.movement = true
							event_user(10);
					}
					else
					{
						action++;
				
				
						image_index = 4;
						image_speed = -1;
					}
					break;
			
				case 3:
					if image_index > 1
						alarm[0] = 1;
					else
					{
						action = 0;
						alarm[0] = 60;
				
						shoot = 0;
						state = "Follow"
						
						image_xscale = 1;
						direction = irandom(359);
						if direction > 90 and direction < 270
							image_xscale = -1;
					
						image_speed = 1;
						sprite_index = spr_enemy_nightmare_blaze;
					}
					break;
			}
			break;
			
		case "Appear":
			alarm[0] = 1;
			if animation_ended = true
			{
				animation_ended = false;
				
				action = 0;
				alarm[0] = 30;
				
				event_user(3); //Face Player
				sprite_index = spr_enemy_nightmare_blaze;
				state = "Shooting"
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
						
						speed = 2;
						direction = point_direction(x,y,xstart,ystart);
						sprite_index = spr_enemy_nightmare_blaze_move;
					}
					else
					{
						action = 0;
						alarm[0] = 30;
						
						damage = damage_store;
						speed = 0;
						event_user(3);
						state = "Shooting";
						sprite_index = spr_enemy_nightmare_blaze;
						aggro_range = 999;
					}
					break;
			}
			break;
	}
}












