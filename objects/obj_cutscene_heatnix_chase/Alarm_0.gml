/// @description Insert description here
// You can write your code in this editor

switch (action)
{
	case 0:
		if place_meeting(x,y,obj_player)
		{
			action++;
			alarm[0] = 15;
			
			obj_player.x = x;
			obj_player.y = y;
			
			image_alpha = 0;
			
			with obj_player
			{
				movement = false;
				xspeed = -2;
				yspeed = 0;
				image_xscale = 1;

				invul = true;
				dash = false;
				
				animation_lock = true
				sprite_index = spr_port_x_bike;
				weight = 0;
			}
		}
		else
			alarm[0] = 1;
		break;

	case 1:
		action++;
		alarm[0] = 1;
	
		with obj_player
		{
			dash = true;
			xspeed = 10;
				
			//Dash effect
			effect = instance_create_layer(x-5*image_xscale,y+23,"Explosions",obj_explosion);
			effect.sprite_index = spr_effect_dash_trail;
			effect.image_xscale = image_xscale;
			
			sprite_index = spr_port_x_bike_reel_end;
			image_speed = -1;
			image_index = 2;
				
			scr_make_sound(snd_heatnix_crescent,1,1,false);
			scr_make_sound(snd_bike_dash,1,1,false);
		}
		break;
		
	case 2:	
		if obj_player.image_index < 1
		{
			action++;
			alarm[0] = 60;
			
			fade = instance_create_depth(0,0,0,obj_fade_swipe);
						
			with obj_player
			{
				image_index = 2;
				sprite_index = spr_port_x_bike_reel;
			}
		}
		else
			alarm[0] = 1;
		break;
		
	case 3:
		action++;
		alarm[0] = 1;
		
		with obj_player
		{
			x = 1120;
			y = 1626;
		}
		
		instance_create_depth(0,0,0,obj_cutscene_level_start_bike);
		break;
		
	case 4:
		action++;
		alarm[0] = 1;
	
		with obj_fade_swipe
			instance_destroy();
		fade = instance_create_depth(0,0,0,obj_fade_swipe)
		fade.image_xscale = -1;
		//fade.swipe_speed *= -1;
		//fade.swipe = 0;
	
		//with obj_cutscene_level_start_bike
		//	alarm[1] = -1;
		
		instance_destroy();
		break;
}