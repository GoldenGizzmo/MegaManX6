/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Appearance":
			switch (action)
			{
				case 1: //Spinning down into frame
					action++;
					alarm[0] = 1;
				
					image_speed = 0;
					image_index = 0;
					sprite_index = spr_boss_turtloid_spinning;
					rotate_speed = 6;
					spinning = true;
					
					weight = 0;
					yspeed = 1;
					break;
				
				case 2: //If reaching the bottom of the floor
					if place_meeting(x,y+32,obj_solid)
					{
						action++;
						alarm[0] = 1;
						
						yspeed = 0;
					}
					else
						alarm[0] = 1;
					break;
					
				case 3: //If shell is upright
					if rotate%360 = 0
					{
						action++;
						alarm[0] = 1;
						
						animation_ended = false;
						spinning = false;
						sprite_index = spr_boss_turtloid_shielding;
						image_index = image_number-1;
						image_speed = -1;
						weight = 0.2;
					}
					else
						alarm[0] = 1;
					break;
				
				case 4:
					//Don't repeat
					if image_index < 1
						image_speed = 0;
				
					//Landing
					if airborne = false
					{
						action++;
						alarm[0] = 30;
				
						shake = instance_create_depth(0,0,0,obj_shake);
						shake.style = 1;
						shake.intensity = 2;
						shake.length = 30;
						
						sprite_index = spr_boss_turtloid_idle;
						scr_make_sound(snd_turtloid_land,1,1,false);
					}
					else
						alarm[0] = 1;
					break;
					
				case 5:
					action++;
					alarm[0] = 1;
				
					image_speed = 1;
					break;
				
				case 6:
					with obj_bossmanager
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
				case 0: //Prepare yourself
					action++;
					alarm[0] = 60;
				
					image_speed = 1;
					sprite_index = spr_boss_turtloid_idle;
					scr_make_sound(snd_turtloid_talk_prepareyourself,1,1,false);
					break;
					
				case 1: //Set up attack
					action++;
					alarm[0] = 1;
	
					event_user(3);

					animation_ended = false;
					sprite_index = spr_boss_turtloid_stomp;
					image_index = 0;
					
					break;
			
				case 2: //Spawn projectile
					if image_index > 5
					{
						shake = instance_create_depth(0,0,0,obj_shake);
						shake.style = 1;
						shake.intensity = 2;
						shake.length = 60;
						
						jewel = instance_create_depth(0,0,depth-1,obj_boss_turtloid_jewel);
						jewel.flickering = 0;
						jewel = instance_create_depth(0,0,depth-1,obj_boss_turtloid_jewel);
						jewel.jewel_top = false;
						jewel.flickering = 0;
						
						scr_make_sound(snd_turtloid_crash,1,1,false);
						jewel_activated = true;
						
						action++;
						alarm[0] = 1;
					}
					else
						alarm[0] = 1;
					break;
					
				case 3: //Finish animation
					if animation_ended = true
					{
						animation_ended = false;
						
						action++;
						alarm[0] = 1;
						
						image_speed = 0;
						image_index = -1;
					}
					else
						alarm[0] = 1;
					break;
				
				case 4:
					action = 0;
				
					with obj_bossmanager
					{
						bossfight_state++;
						alarm[0] = 10;
					}
					break;
			}
			break;
	
		case "Rockets":
			switch (action)
			{
				case 0: //Set up
					action++;
					alarm[0] = 60;
				
					image_speed = 2;
					
					event_user(3); //Face player
					attack_interrupt = irandom(1);
					
					//How many rockets fired in a volley
					shoot = 1;
					shoot_amount = 10;
					
					
					break;
					
				case 1: //Shoot rockets
					if shoot < shoot_amount
					{
						shoot++;
						alarm[0] = 10;
						
						event_user(10);
					}
					else
					{
						action++;
						alarm[0] = 30;
						
						image_speed = 1;
						
						//Change attacks
						if attack_interrupt = 0
						{
							action = 3;
							alarm[0] = 1;
						}
					}
					break;
					
				case 2:
					action++;
					alarm[0] = 60;
				
					image_speed = 2;
					
					event_user(3); //Face player
					
					//How many rockets fired in a volley
					shoot = 1;
					shoot_amount = 10;
					break;
					
				case 3: //Shoot rockets
					if shoot < shoot_amount
					{
						shoot++;
						alarm[0] = 10;
						
						event_user(10);
					}
					else
					{
						action = 0;
						alarm[1] = 120;
						//done_stomp = false;
						
						image_speed = 1;
						shoot = 1;
					}
					break;
			}
			break;
			
		case "Rolling":
			switch (action)
			{
				case 0:	//Curl up
					action++;
					alarm[0] = 1;
				
					animation_ended = false;
					sprite_index = spr_boss_turtloid_shielding;
					image_index = 0;
					
					scr_make_sound(snd_turtloid_talk_itsover,1,1,false);
					
					attack_interrupt = irandom(2);
					
					break;
				
				case 1:	//Spawn blades
					alarm[0] = 1;
					if animation_ended = true
					{
						action++;
						
						animation_ended = false;
						sprite_index = spr_boss_turtloid_spinning;
						
						scr_make_sound(snd_turtloid_blades,1,1,false);
					}
					break;
					
				case 2: //Finish animation
					if animation_ended = true
					{
						animation_ended = false;
						image_speed = 0;
						image_index = -1;
						
						action++
						alarm[0] = 15;

					}
					else
						alarm[0] = 1;
					break;
					
				case 3:
					if spinning = false
					{
						spinning = true;
						rotate_speed = 5;
					}
					alarm[0] = 1;
					
					//Spin faster and reach max speed
					if rotate_speed < 15
						rotate_speed += 0.2;
					else
					{
						action++;
						
						move_speed = 5;
						shoot = 1;
						shoot_amount = choose(1,2,3); //How many jumps are performed
						if attack_interrupt = 0
							shoot_amount = 1;
						
						//Move towards the player
						if obj_player.x < x
							xspeed = -move_speed;
						else
							xspeed = move_speed;
					}
					break;
					
				case 4: //Touching a wall
					if place_meeting(x+xspeed,y,obj_solid)
					{
						action++;
						alarm[0] = 1;
						
						//Go up the wall
						weight = 0.075;
						yspeed = -(move_speed);
						
						scr_make_sound(snd_turtloid_blades,1,1,false);
					}
					else
						alarm[0] = 1;
					break;
					
				case 5: //Move to the other side of the arena
					alarm[0] = 1;
					
					if shoot < shoot_amount
					{
						if airborne = false
						{
							action = 4;
							shoot++;
							
							if xspeed = 0
							{
								if x > obj_camera.x
									xspeed = -move_speed;
								else
									xspeed = move_speed;
							}
							else
							{
								if obj_player.x < x
									xspeed = -move_speed;
								else
									xspeed = move_speed;
							}
						}	
					}
					else
						if yspeed > 0
							action++;
					break;
					
				case 6:
					action++;
					alarm[0] = 1;
					
					//Change into bouncing attack
					if attack_interrupt = 0
					{
						state = "Bounce";
						action = 2;
						alarm[0] = 1;
						
						scr_make_sound(snd_turtloid_talk_prepareyourself,1,1,false);
						animation_ended = true
					
						weight = 0.2;
						move_speed = choose(3,4);
						bounce_height = choose(6,7);
					}
					else
					{
						animation_ended = false;
						spinning = false;
						sprite_index = spr_boss_turtloid_shielding;
						image_index = image_number-1;
						image_speed = -1;
						weight = 0.2;
						rotate = 0;
					
						scr_make_sound(snd_turtloid_blades_retract,1,1,false);
						event_user(3);
					}
					break;
				
				case 7:
					//Don't repeat
					if image_index < 1
						image_speed = 0;
				
					//Landing
					if airborne = false
					{
						action = 0;
						alarm[1] = 30;
				
						shake = instance_create_depth(0,0,0,obj_shake);
						shake.style = 1;
						shake.intensity = 2;
						shake.length = 30;
						
						sprite_index = spr_boss_turtloid_idle;
						scr_make_sound(snd_turtloid_land,1,1,false);
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
			
		case "Stomp":
			switch (action)
			{
				case 0: //Set up attack
					action++;
					alarm[0] = 1;
					
					shoot = 1;
					shoot_amount = 2; //Stomp twice
					
					attack_interrupt = irandom(1);
					break;
				
				case 1:
					action++;
					alarm[0] = 1;
	
					event_user(3);

					animation_ended = false;
					sprite_index = spr_boss_turtloid_stomp;
					image_index = 0;
					break;
			
				case 2: //Spawn projectile
					if image_index > 5
					{
						//Shake
						shake = instance_create_depth(0,0,0,obj_shake);
						shake.style = 1;
						shake.intensity = 2;
						shake.length = 60;
						
						event_user(11);
						
						scr_make_sound(snd_turtloid_crash,1,1,false);
						
						//Splash effect
						scr_make_sound(snd_splash,1,1,false);
						effect = instance_create_layer(x+42*image_xscale,y+70,"Explosions",obj_explosion);
						effect.sprite_index = spr_water_splash_meteor;
						
						action++;
						alarm[0] = 1;
					}
					else
						alarm[0] = 1;
					break;
					
				case 3: //Finish animation
					if animation_ended = true
					{
						animation_ended = false;
						
						action++;
						alarm[0] = 30;
						
						image_speed = 0;
						image_index = -1;
						
						
					}
					else
						alarm[0] = 1;
					break;
					
				case 4:
					if shoot < shoot_amount
					{
						action = 1;
						alarm[0] = 60;
						
						shoot++;
						image_speed = 1;
						sprite_index = spr_boss_turtloid_idle;
						
						//Change attacks
						if attack_interrupt = 0
						{
							state = "Rockets";
							
							action = 2;
							alarm[0] = 1;
						}
					}
					else
					{
						action = 0;
						alarm[1] = 30;
						
						shoot = 1;
						//done_stomp = false;
					}
					break;
			}
			break;
			
		case "Bounce":
			switch (action)
			{
				case 0:	//Jump and curl up
					action++;
					alarm[0] = 1;
				
					animation_ended = false;
					sprite_index = spr_boss_turtloid_shielding;
					image_index = 0;
					
					scr_make_sound(snd_turtloid_talk_prepareyourself,1,1,false);
					
					weight = 0.2;
					move_speed = choose(3,4);
					bounce_height = choose(6,7);
					
					if x > obj_camera.x
						xspeed = -1;
					else
						xspeed = 1;
					yspeed = -bounce_height;
					break;
				
				case 1:	//Start spinning in mid air
					alarm[0] = 1;
					if animation_ended = true
					{
						action++;
						
						animation_ended = false;
						sprite_index = spr_boss_turtloid_spinning;
						
						spinning = true;
						rotate_speed = 5;
						
						scr_make_sound(snd_turtloid_blades,1,1,false);
					}
					break;
					
				case 2: //Finish animation
					if animation_ended = true
					{
						animation_ended = false;
						image_speed = 0;
						image_index = -1;
						
						shoot = 1;
						shoot_amount = 60*5;
						
						action++
						alarm[0] = 1;
					}
					else
						alarm[0] = 1;
					break;	
					
				case 3: //Bouncing around
					alarm[0] = 1;
					if shoot < shoot_amount
					{
						shoot++;
						
						if obj_player.x > x
						{
							if xspeed < move_speed
								xspeed += 0.1;
						}
						else
						{
							if xspeed > -move_speed
								xspeed -= 0.1;
							
						}
					
						if airborne = false
						{
							yspeed = -bounce_height;
							
							shake = instance_create_depth(0,0,0,obj_shake);
							shake.style = 1;
							shake.intensity = 2;
							shake.length = 60;
						
							scr_make_sound(snd_turtloid_crash,1,1,false);
						}
					}
					else
					{ 
						if yspeed > 0
							action++;
					}
					break;
					
				case 4: //Uncurl
					action++;
					alarm[0] = 1;
						
					animation_ended = false;
					spinning = false;
					sprite_index = spr_boss_turtloid_shielding;
					image_index = image_number-1;
					image_speed = -1;
					
					weight = 0.2;
					xspeed = 0;
					rotate = 0;
					
					scr_make_sound(snd_turtloid_blades_retract,1,1,false);
					event_user(3);
					break;
				
				case 5:
					//Don't repeat
					if image_index < 1
						image_speed = 0;
				
					//Landing
					if airborne = false
					{
						action = 0;
						alarm[1] = 30;
				
						shake = instance_create_depth(0,0,0,obj_shake);
						shake.style = 1;
						shake.intensity = 2;
						shake.length = 30;
						
						sprite_index = spr_boss_turtloid_idle;
						scr_make_sound(snd_turtloid_land,1,1,false);
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
			
		case "Giga":
			switch (action)
			{
				case 0:	//Curl up
					action++;
					alarm[0] = 1;
				
					animation_ended = false;
					sprite_index = spr_boss_turtloid_shielding;
					image_index = 0;
					break;
				
				case 1:	//Curled up
					alarm[0] = 1;
					if animation_ended = true
					{
						action++;
						alarm[0] = 60;
						
						animation_ended = false;
						sprite_index = spr_boss_turtloid_spinning;
						image_index = 0;
						image_speed = 0;
						
						//Refresh all Jewels
						with obj_boss_turtloid_jewel
							instance_destroy();
						jewel = instance_create_depth(0,0,depth-1,obj_boss_turtloid_jewel);
						jewel.flickering = 0;
						jewel = instance_create_depth(0,0,depth-1,obj_boss_turtloid_jewel);
						jewel.jewel_top = false;
						jewel.flickering = 0;
					
						jewel_respawn_top = 0;
						jewel_respawn_bottom = 0;
						
						spinning = true;
						weight = 0;
						rotate_speed = 6;
					}
					break;
				
				case 2:
					alarm[0] = 1;
					
					action++;
					alarm[0] = 30;
					
					zip_x = obj_camera.x;
					zip_y = y-125;
					
					scr_make_sound(snd_shoot_meteorrain_charged,1,1,false)
					break;
					
				case 3:
					alarm[0] = 1;
					if rotate_speed < 12
					{
						if rotate%360 = 0
							rotate_speed += 2;
					}
					else
					{
						action++;
						scr_make_sound(snd_turtloid_talk_heavenswrath,1,1,false);
					}
					break;
					
				case 4:
					alarm[0] = 1;
					if giga_warning < 0.5
						giga_warning += 0.0075;
					else
						action++;
					break;
					
				case 5:
					event_user(12);
					giga_warning = 0;
					if surface_exists(surface)
						surface_free(surface);
					
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.intensity = 4;
					shake.length = 30;
						
					scr_make_sound(snd_turtloid_thunder,2,1,false);
					rotate_speed = 6;
					
					zip_x = 0;
					zip_y = 0;
						
					shoot = 1;
					shoot_amount = 60*9;
					move_speed = 4;
					shoot_delay = 30;
					
						
					action++;
					alarm[0] = 120;
					break;
					
				case 6: //Moving through the rain
					if shoot < shoot_amount
					{
						shoot++;
						alarm[0] = 1;
						
						if place_meeting(x+(move_speed*35),y,obj_solid)
							move_speed *= -1;
							
						if move_speed > 0
						{
							if xspeed < move_speed
								xspeed += 0.05;
						}
						else
						{
							if xspeed > move_speed
								xspeed -= 0.05;
						}
						
						if global.animate%shoot_delay = 0
						{
							bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_default);
							bullet.damage = bullet_damage_2;
							
							//Spawn in order (not random)
							if giga_sprinkler = 2
								giga_sprinkler = 0;
							else
								giga_sprinkler++;	
							bullet.direction = 80+(30*giga_sprinkler);
							bullet.speed = 2;
							bullet.gravity = 0.1;

							bullet.villainy = 2;
							bullet.sprite_index = spr_bullet_meteor_rain_spawn;
							bullet.animation_next  = spr_bullet_meteor_rain
							bullet.explosion = spr_explosion_projectile;
							bullet.phasing = true;

							scr_make_sound(snd_shoot_meteorrain,1,random_range(0.75,1.25),false);
							
							
							/*
							shoot_delay = 75
							giga_rocket_side = 1;
							if obj_player.x > obj_camera.x
								giga_rocket_side = -1;
							
							var height = irandom(2);
							switch (height)
							{
								case 0: height = obj_player.y; break;
								case 1: height = obj_camera.y+40; break;
								case 2: height = obj_camera.y+120; break;
							}
							
							bullet = instance_create_layer(obj_camera.x+(300*giga_rocket_side),obj_player.y,"Projectiles",obj_bullet_default);
							bullet.damage = bullet_damage;
							bullet.sprite_index = spr_bullet_turtloid_rocket
							bullet.speed = -4*giga_rocket_side;
							bullet.image_xscale = -giga_rocket_side

							bullet.phasing = true;
							bullet.villainy = 2;
							bullet.explosion_sound = snd_explosion;
							bullet.explosion = spr_explosion_death;
							bullet.breakable = true;
							bullet.despawn = false;
							
							scr_make_sound(snd_turtloid_rocket,1,1,false);*/
						}

						
					}
					else
					{ 
						action++;
						alarm[0] = 60;
						
						move_speed = 0;
						xspeed = 0;
						with rain
							rain_active = false;
					}
					break;
				
				case 7: //Uncurl
					action++;
					alarm[0] = 1;
						
					animation_ended = false;
					spinning = false;
					sprite_index = spr_boss_turtloid_shielding;
					image_index = image_number-1;
					image_speed = -1;
					
					weight = 0.2;
					xspeed = 0;
					rotate = 0;
					
					scr_make_sound(snd_turtloid_blades_retract,1,1,false);
					event_user(3);
					break;
				
				case 8:
					//Don't repeat
					if image_index < 1
						image_speed = 0;
				
					//Landing
					if airborne = false
					{
						action = 0;
						alarm[1] = 60;
				
						shake = instance_create_depth(0,0,0,obj_shake);
						shake.style = 1;
						shake.intensity = 2;
						shake.length = 30;
						
						sprite_index = spr_boss_turtloid_idle;
						scr_make_sound(snd_turtloid_land,1,1,false);
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
	}
}













