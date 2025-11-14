/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Appearance":
			switch (action)
			{
				case 0: //Warning
					action++;
					alarm[0] = 60;
					
					rumbling = true;
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.intensity = 2;
					shake.length = 99999;
					shake.style = 1;
					
					scr_make_sound(snd_heatnix_rumble,1,1,false);
					
					x = obj_camera.x-350;
					y = obj_camera.y-80;
					break;
					
				case 1:
					action++;
					alarm[0] = 45;
				
					sprite_index = spr_boss_heatnix_godbird;
					scr_make_sound(snd_heatnix_talk_godbird,1,1,false);
					break;
				
				case 2: //Fly past
					action++;
					alarm[0] = 1;
				
					rumbling = false;
					scr_make_sound(snd_heatnix_godbird,1,1,false);
					damage = bullet_damage_2;
					xspeed = 15;
					break;
					
				case 3: //If offscreen
					if !place_meeting(x,y,obj_spawnzone)
					{
						action++;
						alarm[0] = 60;
					
						instance_destroy(shake);
						damage = damage_store;
						xspeed = 0;
					}
					else
						alarm[0] = 1;
					break;
			
				case 4: //Appear from top
					action++;
					alarm[0] = 90;
				
					event_user(3);
					x = obj_camera.x+130;
					y = obj_camera.y-150;
					
					sprite_index = spr_boss_heatnix_appear;
					yspeed = 1;
					break;
					
				case 5:
					action = 0;
					alarm[1] = 30;
				
					yspeed = 0;
					sprite_index = spr_boss_heatnix_idle;
					break;
			}
			break;
		
		case "Openning":
			switch (action)
			{
				case 0:
					action = 0;
				
					with instance_nearest(x,y,obj_bossmanager)
					{
						bossfight_state++;
						alarm[0] = 10;
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
					
					image_index = 0;
					sprite_index = spr_boss_heatnix_shoot;
					animation_ended = false;
					break;
					
				case 1: //Shoot
					alarm[0] = 1;
					if image_index > 4
					{
						action++;
					
						event_user(10);
						scr_make_sound(snd_heatnix_talk_kah,1,1,false);
					}
					break;
			
				case 2: //Do multiple times
					if animation_ended = true
					{
						animation_ended = false
						sprite_index = spr_boss_heatnix_idle;
						
						if shoot < shoot_amount
						{
							action = 0;
							alarm[0] = 30;
							
							shoot++;
						}
						else
						{
							action = 0;						
							alarm[1] = 60;
							
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
					alarm[0] = 45;
					
					rumbling = true;
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.intensity = 2;
					shake.length = 99999;
					shake.style = 1;
					
					sprite_index = spr_boss_heatnix_godbird;
					scr_make_sound(snd_heatnix_rumble,1,1,false);
					
					image_xscale *= -1;
					x = obj_camera.x-(350*image_xscale);
					switch (shoot)
					{
						case 1: y = obj_camera.y-80; break;
						case 2: y = obj_camera.y+40; break;
						case 3: y = obj_player.y; break;
					}
					
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
					alarm[0] = 90;
				
					event_user(3);
					x = obj_camera.x+130;
					y = obj_camera.y-150;
					
					sprite_index = spr_boss_heatnix_appear;
					yspeed = 1;
					break;
					
				case 7:
					action = 0;
					alarm[1] = 60;
				
					yspeed = 0;
					sprite_index = spr_boss_heatnix_idle;
					break;
			}
			break;
			
		case "Defeated":
			switch (action)
			{
				case 0: //Move to positions
					alarm[0] = 1;
					
					var player_check = false
					var boss_check = false;
					
					with obj_player	
					{
						movement = false;
						
						if airborne = false
						{
							if x < obj_camera.x-45
								xspeed = dash_speed;
							else if x > obj_camera.x-35
								xspeed = -dash_speed
							else
							{
								player_check = true
								xspeed = 0;
								dash = false;
							}
							
							
							if dash = false and player_check = false
							{
								dash = true;
								
								//Dash effect
								effect = instance_create_layer(x-5*image_xscale,y+23,"Explosions",obj_explosion);
								effect.sprite_index = spr_effect_dash_trail;
								effect.image_xscale = image_xscale;
				
								scr_make_sound(snd_player_x_dash,1,1,false);
							}
						}
						else
							xspeed = 0;
					}
					
					if y < obj_camera.y-25
						yspeed = 1;
					else
					{
						yspeed = 0;
						boss_check = true;
					}
						
					//Check that boss characters are in position	
					if boss_check = true and player_check = true
					{
						action++;
						alarm[0] = 30;
					}
					break;
					
				case 1: //Player Jump
					alarm[0] = 1;
					action++;
				
					with obj_player
					{
						yspeed = -jump_height;
						scr_make_sound(snd_player_x_jump,1,1,false);	
						
					}
					break;
					
				case 2: //Meet boss Y position
					alarm[0] = 1;
					
					if obj_player.y < y and obj_player.yspeed > 0
					{
						action++;
						scr_make_sound(snd_bike_dash,1,1,false);	
						scr_make_sound(snd_heatnix_crescent,1,1,false);	
						scr_make_sound(snd_player_x_talk_chargeshot_2,1,1,false);	
						
						with obj_player
						{	
							dash = true;
							xspeed = 8;
							yspeed = 0;
							invul = true;
							
							animation_lock = true;
							weight = 0;
							
							image_speed = -1;
							image_index = 2;
							sprite_index = spr_port_x_bike_reel_end;
						}
					}
					break;
					
				case 3: //Transition into reel animation
					alarm[0] = 1;
					
					if obj_player.image_index < 1
					{
						action++;
						
						with obj_player
						{
							image_index = 2;
							sprite_index = spr_port_x_bike_reel;
						}
					}
					break;
					
				case 4: //Collision with the player
					alarm[0] = 1;
					
					if place_meeting(x,y,obj_player)
					{
						action++;
						obj_player.xspeed = 0.25;
						xspeed = 0.25;
					
						sprite_index = spr_boss_heatnix_stunned;
						scr_make_sound(snd_heatnix_grunt,2,1,false);
						
						shake = instance_create_depth(0,0,0,obj_shake);
						shake.intensity = 4;
						shake.length = 99999;
						shake.style = 1;
						
						alarm[0] = 30;
						
					}
					break;
					
				case 5:
					alarm[0] = 1;
				
					if exploding < 120
					{
						if exploding = 0
							alarm[11] = 1;
						exploding++;

						if exploding%4 = 0
							instance_create_depth(x+random_range(-100,100),y+random_range(-100,100),10,obj_explosion);
					}
					else
						action++;
					break;
					
				case 6:
					action++;
					alarm[0] = 60;
				
					fade = instance_create_depth(0,0,0,obj_fade_swipe);
					
					alarm[11] = -1;
					break;
					
				case 7:
					action++;
					alarm[0] = 120;
					
					audio_pause_sound(global.music);
					instance_destroy(obj_shake);
					with obj_ridechaser
						instance_destroy();
		
		
					with obj_player
					{
						x = 1890;
						y = 950;
			
						xspeed = 0;
						image_xscale = 1;
					}
					
					
					
					actor = instance_create_depth(obj_player.x+30,obj_player.y,depth,obj_actor);
					actor.sprite_index = spr_boss_heatnix_stunned;
					actor.image_xscale = -1;
					actor.speed = obj_player.xspeed;
					
					with obj_fade_swipe
						instance_destroy();
					fade = instance_create_depth(0,0,0,obj_fade_swipe)
					fade.image_xscale = -1;
					break;

				case 8:
					action++;
					alarm[0] = 1;
					
					scr_make_sound(snd_bike_dash,1,1,false);
					scr_make_sound(snd_heatnix_death,2,1,false);
					
					obj_player.xspeed = 10;
					actor.speed = obj_player.xspeed;
					break;
					
				case 9: //Crashing into the wall
					var check = false;
					with actor
						if place_meeting(x,y,obj_solid)
							check = true;
					
					if check = true
					{
						action++;
						alarm[0] = 15;
						
						audio_resume_sound(global.music);
						
						//Stop all speed
						actor.speed = 0;
						obj_player.xspeed = 0;
						
						scr_make_sound(snd_explosion_large,1,1,false);
						
						//Particle effects
						with obj_player
						{
							repeat(4)
							{
								var range = 60;
								var x_range = random_range(-range,range);
								var y_range = random_range(-range,range);
								instance_create_layer(x+x_range,y+y_range,"Explosions",obj_explosion);
							}
							for (var i = 0; i < 3; i++)
							{
								debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
								debris.sprite_index = spr_port_x_bike_debris;
								debris.image_index = i;
							}
						}
					
						shake = instance_create_depth(0,0,0,obj_shake);
						shake.length = 15;
					}
					else
						alarm[0] = 1;
					break;
				
				case 10:
					action++;
					alarm[0] = 15;
					
					scr_make_sound(snd_explosion_large,1,1,false);
						
					//Particle effects
					with obj_player
					{
						repeat(3)
						{
							var range = 60;
							var x_range = random_range(-range,range);
							var y_range = random_range(-range,range);
							instance_create_layer(x+x_range,y+y_range,"Explosions",obj_explosion);
						}
						for (var i = 3; i < 6; i++)
						{
							debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
							debris.sprite_index = spr_port_x_bike_debris;
							debris.image_index = i;
						}
					}
					
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.length = 15;
					break;
					
				case 11:
					action++;
					alarm[0] = 15;
					
					scr_make_sound(snd_explosion_large,1,1,false);
						
					//Particle effects
					with obj_player
					{
						instance_create_layer(x,y,"Explosions",obj_explosion);
						repeat(3)
						{
							var range = 60;
							var x_range = random_range(-range,range);
							var y_range = random_range(-range,range);
							instance_create_layer(x+x_range,y+y_range,"Explosions",obj_explosion);
						}
						for (var i = 6; i < 9; i++)
						{
							debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
							debris.sprite_index = spr_port_x_bike_debris;
							debris.image_index = i;
						}
					}
					
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.length = 60;
					break;
					
				case 12: //Break out of the action
					action++;
					alarm[0] = 1;
				
					with actor
					{
						direction = 135;
						sprite_index = spr_boss_heatnix_idle;
						speed = 4;
					}
					
					
					with obj_player
					{
						animation_lock = false;
						xspeed = -4;
						yspeed = -4;
						dash = false;
					}					
					break;
					
				case 13: //Slow down
					var check_1 = false;
					var check_2 = false;
					
					with obj_player
					{
						if airborne = false
						{
							xspeed = 0;
							check_1 = true;
						}
					}
				
					with actor
					{
						if speed > 0
							speed -= 0.2;
						else
						{
							speed = 0;
							check_2 = true;
						}
					}
					
					if check_1 = true and check_2 = true
					{
						action++;
						alarm[0] = 30;
						
						scr_make_sound(snd_heatnix_talk_kah,2,1,false);
					}
					else
						alarm[0] = 1;
					break;
					
				case 14: //Heatnix flees
					action++;
					alarm[0] = 30;
				
					with actor
					{
						image_xscale = 1;
						direction = 45;
						speed = -1;
					}
					break;
					
				case 15: //Fly away
					action++;
					alarm[0] = 10;
					
					with actor
					{
						sprite_index = spr_boss_heatnix_retreat;
						speed = 6;
					}
					
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.length = 30;
					shake.style = 1;
					
					scr_make_sound(snd_heatnix_crescent,1,1,false);
					break;
					
				case 16: //START
					with obj_player
					{
						movement = true;
						invul = false;
					}
					instance_destroy();
					break;
			}
			break;
	}
}













