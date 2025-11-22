/// @description Insert description here
// You can write your code in this editor

switch (action)
{
	case 0:
		action++;
		alarm[0] = 120;
	

		shake = instance_create_depth(0,0,0,obj_shake);
		shake.intensity = 2;
		shake.length = 99999;
		shake.style = 1;

		scr_make_sound(snd_heatnix_rumble,1,1,true);
		break;
	
	case 1: //Blast off
		if obj_player.airborne = false
		{
			action++;
			alarm[0] = 15;
			
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
		
	case 2:
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
		
	case 3:	
		if obj_player.image_index < 1
		{
			action++;
			alarm[0] = 40;
		
			with obj_player
			{
				image_index = 2;
				image_speed = 1;
				sprite_index = spr_port_x_bike_reel;
				dash = false;
				invul = false;
			}
		}
		else
			alarm[0] = 1;
		break;
		
	case 4:
		action++;
		alarm[0] = 60;
		
		fade = instance_create_depth(0,0,0,obj_fade_swipe);
		break;
		
	case 5:
		action++;
		alarm[0] = 1;
		
		audio_stop_sound(snd_heatnix_rumble);
		instance_destroy(shake);
		instance_destroy(obj_ridechaser);
		with obj_fire
			instance_destroy();
		
		with obj_player
		{
			x = 7847;
			y = 3769;
			obj_camera.x = x;
			obj_camera.y = y;
			
			xspeed = 15;
			sprite_index = spr_port_x_bike;
		}
		break;
		
	case 6: //Appearing in final location
		action++;
		alarm[0] = 110;
		
		scr_make_sound(snd_bike,0.5,1,true);
	
		with obj_fade_swipe
			instance_destroy();
		fade = instance_create_depth(0,0,0,obj_fade_swipe)
		fade.image_xscale = -1;
		fade.swipe_speed = -20;
		//fade.swipe = 0;

		break;
		
	case 7:
		action++;
		alarm[0] = 1;
	
		with obj_player
		{
			animation_lock = false;
			xspeed = 3;
			yspeed = -8;
			dash = false;
			
			scr_make_sound(snd_player_x_jump,1,1,false);
			scr_make_sound(snd_player_x_talk_jump_2,1,1,false);
			
			instance_create_depth(x,y,depth+1,obj_bike_crashing);
			scr_make_sound(snd_bike_dash,1,1,false);
			audio_stop_sound(snd_bike);
		}	
		break;
		
	case 8:	
		alarm[0] = 1;
		
		if obj_player.airborne = false
		{
			action++;
			alarm[0] = 120;
			
			obj_player.xspeed = 0;
		}
		break;
		
	case 9: //START
		with obj_player
		{
			movement = true;
			invul = false;
		}
		instance_destroy();
		break;	
}