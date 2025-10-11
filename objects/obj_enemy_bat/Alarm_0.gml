/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (action)
	{
		case 0:
			//Fly towards a point above their head
			event_user(3);
			if x < obj_player.x+5 and x > obj_player.x-5 and y < obj_player.y
			{	
				action++;
				alarm[0] = 1;
				
				sprite_index = spr_enemy_bat_drop;
				image_index = 0;
				event_user(10);
			
				animation_ended = false;
				
				speed = 0;
				/*
				xspeed = 0;
				yspeed = 0;*/
			}
			else
			{
				//xspeed = 1.5*image_xscale;
				//yspeed = -0.1;
				//if obj_player.y-hover_height < y
				//	yspeed = -0.5;
				
				hspeed = 1.5;
				vspeed = 0.2;
				direction = point_direction(x,y,obj_player.x,obj_player.y-hover_height)
				
				alarm[0] = 1;
			}
			break;
			
		case 1: //Stop animating
			if animation_ended = true
			{
				action++;
				alarm[0] = 20;
				
				animation_ended = false;
				
				image_speed = 0;
				image_index = -1;
			}
			else
				alarm[0] = 1;
			break;
			
		case 2: //Fly away
			image_index = 0;
			sprite_index = spr_enemy_bat;
			image_speed = 1;
			
			xspeed = 3*image_xscale;
			yspeed = -0.2;
			break;
	}
}