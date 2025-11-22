/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Appearance":
			switch (action)
			{		
				case 1: //Appear from top
					action++;
					alarm[0] = 90;
				
					event_user(3);
					x = obj_camera.x+130;
					y = obj_camera.y-150;
					
					sprite_index = spr_boss_heatnix_appear;
					yspeed = 1;
					break;
					
				case 2:
					action++;
					alarm[0] = 30;
				
					yspeed = 0;
					sprite_index = spr_boss_heatnix_idle;
					break;
			
				case 3:
					with instance_nearest(x,y,obj_bossmanager)
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
					
					scr_make_sound(snd_fire,1,1,false);

					image_index = 0;
					sprite_index = spr_boss_heatnix_flare;
					animation_ended = false;
					break;
			
				case 1:
					alarm[0] = 1;
					
					if image_index > 4
					{	
						scr_make_sound(snd_heatnix_flare,1,1,false);
						action++;
					}
					break;
					
				case 2:
					if animation_ended = true
					{
						animation_ended = false;
					
						action++;
						alarm[0] = 1;
					
						sprite_index = spr_boss_heatnix_idle;
					}
					else
						alarm[0] = 1;
					break;
				
				case 3:
					action = 0;
				
					with instance_nearest(x,y,obj_bossmanager)
					{
						bossfight_state++;
						alarm[0] = 10;
					}
					break;
			}
			break;
			
		case "Fly Around":
			switch (action)
			{
				case 0:
					action++;
					alarm[0] = 1;
					
					shoot = 0;
					shoot_amount = 30*(1+irandom(2)); //Time flying around
					
					sprite_index = spr_boss_heatnix_idle;
					break;
			
				case 1:			
					if shoot < shoot_amount
					{
						shoot++;
						alarm[0] = 1;
						
						var x_pos = obj_player.x+70+random_range(-20,20);
						if obj_player.x > x
							x_pos = obj_player.x-70+random_range(-20,20);;
						var y_pos = obj_player.y-45+random_range(-20,20);;
						var velocity = 0.2;
						var move_speed = 2;
						
						event_user(3); //Face player
						if x > x_pos+20 {if xspeed > -move_speed {xspeed -= velocity;}}
						else if x < x_pos-20 {if xspeed < move_speed {xspeed += velocity;}}
						else 
						{
							//Slow down
							if xspeed > 0 {xspeed -= velocity;}
							else if xspeed < 0 {xspeed += velocity;}	
							else { xspeed = 0;}	
						}
						
						if y > y_pos+20 and obj_player.y > obj_camera.y-100 {if yspeed > -move_speed {yspeed -= velocity;}}
						else if y < y_pos-20 {if yspeed < move_speed {yspeed += velocity;}}
						else 
						{
							//Slow down
							if yspeed > 0 {yspeed -= velocity;}
							else if yspeed < 0 {yspeed += velocity;}	
							else { yspeed = 0;}	
						}
					}
					else
					{
						shoot = 0;
						
						xspeed = 0;
						yspeed = 0;
						
						action = 0;
						alarm[1] = 1;
					}
					break;
			}
			break;
			
		case "Shooting":
			switch (action)
			{
				case 0:
					action++;
					alarm[0] = 1;
				
					shoot = 1;
					shoot_amount = 2;
					if done_giga = true
						shoot_amount = 3;
					break;
				
				case 1:
					action++;
					alarm[0] = 1;
					
					event_user(3); //Face player
					image_index = 0;
					sprite_index = spr_boss_heatnix_shoot;
					image_speed = 1.5;
					animation_ended = false;
					break;
					
				case 2: //Shoot
					alarm[0] = 1;
					if image_index > 4
					{
						action++;
					
						event_user(3);
						event_user(10);
						scr_make_sound(snd_heatnix_talk_kah,1,1,false);
					}
					break;
			
				case 3: //Do multiple times
					if animation_ended = true
					{
						animation_ended = false
						sprite_index = spr_boss_heatnix_idle;
						image_speed = 1;
						event_user(3);
						
						if shoot < shoot_amount
						{
							action = 1;
							alarm[0] = 1;
							
							shoot++;
						}
						else
						{
							action = 0;						
							alarm[1] = 1;
							
							shoot = 1;
						}
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
			
		case "God Bird":
			switch (action)
			{
				case 0:
					action++;
					alarm[0] = 30;
				
					image_xscale = -1;
				
					yspeed = 1;
					xspeed = 1;
					
					shoot = 1;
					shoot_amount = 2;
					if done_giga = true
						shoot_amount = 3;
					break;
				
				case 1: //Fly away
					action++;
					alarm[0] = 30;
					
					sprite_index = spr_boss_heatnix_retreat;
					
					scr_make_sound(snd_heatnix_crescent,1,1,false);
						
					yspeed = -6;
					xspeed = -6;
					break;
					
				case 2:
					action++;
					alarm[0] = 15;
				
					scr_make_sound(snd_heatnix_talk_godbird,1,1,false);
					break;
					
				case 3: //Warning
					action++;
					alarm[0] = 60;
					if shoot > 1
						alarm[0] = 30;
					
					rumbling = true;
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.intensity = 2;
					shake.length = 99999;
					shake.style = 1;
					
					sprite_index = spr_boss_heatnix_godbird;
					scr_make_sound(snd_heatnix_rumble,1,1,false);
					
					image_xscale *= -1;
					x = obj_camera.x-(350*image_xscale);
					
					if shoot = 1
						y = obj_camera.y+40;
					else
						y = obj_player.y;
						
					xspeed = 0;
					yspeed = 0;
					break;
				
				case 4: //Fly past
					action++;
					alarm[0] = 1;
				
					rumbling = false;
					scr_make_sound(snd_heatnix_godbird,1,1,false);
					xspeed = 15*image_xscale;
					damage = bullet_damage_2;
					break;
					
				case 5: //If offscreen
					if !place_meeting(x,y,obj_spawnzone)
					{
						if shoot < shoot_amount
						{
							action = 3;
							alarm[0] = 15;
							
							shoot++;
						}
						else
						{
							action++;
							alarm[0] = 60;
							
							shoot = 1;
						}
					
						instance_destroy(shake);
						xspeed = 0;
						damage = damage_store;
					}
					else
						alarm[0] = 1;
					break;
					
				case 6: //Appear from top
					action++;
					alarm[0] = 45;
				
					x = obj_camera.x+choose(-130,130);
					y = obj_camera.y-150;
					
					event_user(3);
					
					sprite_index = spr_boss_heatnix_appear;
					yspeed = 2;
					break;
					
				case 7:
					action = 0;
					alarm[1] = 1;
				
					yspeed = 0;
					sprite_index = spr_boss_heatnix_idle;
					break;
			}
			break;
			
		case "Magma Stream":
			switch (action)
			{
				case 0: //Move up
					if y > obj_camera.y-80-xspeed
					{
						yspeed = -3;
						alarm[0] = 1;
					}
					else
					{
						action++;
						alarm[0] = 1;
						
						yspeed = 0;
					}
					break;
			
				case 1: //Spawn fire
					action++;
					alarm[0] = 1;
					
					image_index = 0;
					sprite_index = spr_boss_heatnix_stream;
					
					event_user(3);
					scr_make_sound(snd_heatnix_talk_magmastream,1,1,false);
					scr_make_sound(snd_heatnix_rumble,1,1,true);
					
					fire = instance_create_layer(obj_camera.x-300,obj_camera.y+120,"Explosions",obj_fire);
					fire.image_xscale = 30;
					fire.image_yscale = 15;
					
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.intensity = 2;
					shake.length = 99999;
					shake.style = 1;
					break;
					
				case 2: //Fire rises slowly while doing animation
					if image_index > 6
						image_speed = 0;
					
					alarm[0] = 1;
					fire.y -= 0.5;
					
					if fire.y < obj_camera.y+80 //Top
					{
						action++;
						scr_make_sound(snd_heatnix_magma,1,1,false);
					}
					break;
					
				case 3: //Fire rises faster
					if fire.y > obj_camera.y-40 //Top
					{
						alarm[0] = 1;
						fire.y -= 3;
					}
					else
					{
						action++;
						alarm[0] = 1;
						
						image_speed = 1;
						animation_ended = false;
					}
					break;
					
				case 4: //Animation for the boss finishes
					if animation_ended = true
					{
						animation_ended = false;
						sprite_index = spr_boss_heatnix_idle;
						
						action++;
						alarm[0] = 30;
					}
					else
						alarm[0] = 1;
					break;
					
				case 5: //Fire sinks down
					if fire.y > fire.ystart
					{
						instance_destroy(fire);
						instance_destroy(shake);
						audio_stop_sound(snd_heatnix_rumble);
					
						action = 0;
						alarm[1] = 1;
					}
					else
					{
						alarm[0] = 1;
						fire.y += 3;
					}
					break;
			}
			break;
			
		case "Dive":
			switch (action)
			{
				case 0:
					action++;
					alarm[0] = 30;
					
					event_user(3); //Face player
					direction = point_direction(x,y,obj_player.x,obj_player.y);
					speed = -2;
					break;
					
				case 1:
					action++;
					alarm[0] = 1;
				
					image_index = 0;
					sprite_index = spr_boss_heatnix_dive;
					
					speed = 4;
					direction = point_direction(x,y,obj_player.x,obj_player.y);
					image_xscale = 1;
					image_angle = direction
					if image_angle > 90 and image_angle < 270 //Prevent flipping upside down
						image_yscale = -1;
					else 
						image_yscale = 1;
					
					scr_make_sound(snd_heatnix_crescent,1,1,false);
					break;
					
				case 2:
					alarm[0] = 1;
					if distance_to_object(obj_player) < 50 //Reach the player
					{
						action++;
						
						image_index = 0;
						sprite_index = spr_boss_heatnix_flap;
						
						scr_make_sound(snd_heatnix_flap_slower,1,1,false);
					}
					else
					{
						if point_direction(x,y,obj_player.x,obj_player.y) < direction-6 
							direction += 3;
						else if point_direction(x,y,obj_player.x,obj_player.y) > direction+6
							direction -= 3;
						else
							direction = point_direction(x,y,obj_player.x,obj_player.y);
						
						image_angle = direction
				
						speed += 0.1;
						
						if image_angle > 90 and image_angle < 270 //Prevent flipping upside down
							image_yscale = -1;
						else
							image_yscale = 1;
					}
					break;
					
				case 3:
					if image_index > 2
					{
						action++
						
						shoot = 1;
						shoot_amount = 6;
					}
					alarm[0] = 1;
					break;
					
				case 4:
					if shoot < shoot_amount
					{
						shoot++;
						alarm[0] = 7;
							
						event_user(11);
						speed = -2;
					}
					else
					{
						action = 0;
						alarm[1] = 1;
						
						shoot = 1;
						speed = 0;
						image_angle = 0;
						direction = 0;
						
						event_user(3);
						image_yscale = 1;
						
						sprite_index = spr_boss_heatnix_idle;
					}
					break;
				
			}
			break
			
		case "Flare":
			switch (action)
			{
				case 0:
					action++;
					alarm[0] = 1;
					
					scr_make_sound(snd_fire,1,1,false);
					
					shoot = 0;
					shoot_amount = 10;
				
					image_index = 0;
					sprite_index = spr_boss_heatnix_flare;
					animation_ended = false;
					break;
					
				case 1: //Charging up
					alarm[0] = 1;
				
					if image_index > 3
					{
						if shoot < shoot_amount
						{
							shoot++;
							image_index--;
						}
						else
							action++;
					}
					break
			
				case 2:
					alarm[0] = 1;
					
					if image_index > 4
					{	
						event_user(12);
						action++;
					}
					break;
					
				case 3:
					if animation_ended = true
					{
						animation_ended = false;
					
						action = 0;
						alarm[1] = 120;
					
						sprite_index = spr_boss_heatnix_idle;
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
	}
}













