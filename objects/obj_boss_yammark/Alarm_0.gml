/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Appearance":
			switch (action)
			{
				case 1:
					action++;
					alarm[0] = 30;
			
					zipping = true;
				
					zip_x = x-60
					zip_y = y+120;
				
					scr_make_sound(snd_yammark_wings_zip,1,1,false);
					break;
				
				case 2:
					action++;
					alarm[0] = 30;
				
					zip_x = x+45
					zip_y = y-20;
				
					scr_make_sound(snd_yammark_wings_zip,1,1,false);
					break;
				
				case 3:
					action++;
					alarm[0] = 30;
				
					zip_x = x-90
					zip_y = y+120;
				
					scr_make_sound(snd_yammark_wings_zip,1,1,false);
					break;
				
				case 4:
					action++;
					alarm[0] = 60;
				
					zip_x = x+60
					zip_y = y-60;
				
					scr_make_sound(snd_yammark_wings_zip,1,1,false);
					break;
				
				case 5:
					zipping = false;
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
				case 0: //Charge
					action++;
					alarm[0] = 30;
			
					sprite_index = spr_boss_yammark_charge;
					break;
				
				case 1: //Spawn yanma
					action++;
					alarm[0] = 120;
			
					sprite_index = spr_boss_yammark_charge_release;
					event_user(10);
					break;
				
				case 2:
					action++;
					alarm[0] = 1;
			
					sprite_index = spr_boss_yammark_attack;
					scr_make_sound(snd_yammark_talk_there,1,1,false);
					break;
				
				case 3:
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
				case 0: //Random movement
					action++;
					alarm[0] = 30;
					
					//Pick a direction based on position in the room
					side = 1;
					if x < obj_camera.x
						side = -1;
				
					zip_x = x-(100*side)
					zip_y = y-50;
				
					scr_make_sound(snd_yammark_wings_zip,1,1,false);
					break;
				
				case 1: //Move to position
					action++;
					alarm[0] = 30;
			
					zip_x = obj_camera.x-(150*side);
					zip_y = obj_camera.y+random_range(-50,50);
				
					scr_make_sound(snd_yammark_wings_zip,1,1,false);
					break;
				
				case 2: //Formation
					scr_make_sound(snd_yammark_talk_formation,1,1,false);
				
					//Spin faster
					orbit_change = "Faster";
					
					action++;
					alarm[0] = 45;
					break;
				
				case 3:
					action++;
					alarm[0] = 30;
				
					scr_make_sound(snd_yammark_guard,1,1,false);
					shoot_amount = instance_number(obj_boss_yanma_option);
					break;
				
				case 4:
					if shoot < shoot_amount and instance_exists(obj_boss_yanma_option)
					{
						var firing = shoot		
						with obj_boss_yanma_option
							if order = firing
								event_user(10);
				
						shoot++;
						alarm[0] = 10;
					}
					else
					{
						action++;
						alarm[0] = 60;
						
						scr_make_sound(snd_yammark_talk_takethis,1,1,false);
						shoot = 0;
					}
					break;
				
				case 5:
					if shoot < shoot_amount and instance_exists(obj_boss_yanma_option)
					{
						var firing = shoot		
						with obj_boss_yanma_option
							if order = firing
								event_user(10);
				
						shoot++;
						alarm[0] = 10;
					}
					else
					{
						action = 0;
						alarm[1] = 60;
					
						shoot = 0;
						orbit_change = "Slower";
					}
					break;
			}
			break;
			
		case "Bullets":
			switch (action)
			{
				case 0: //Set up
					action++;
					alarm[0] = 1;
					
					shoot_repeat = 1
					break;		
				
				case 1: //Random movement
					action++;
					alarm[0] = 30;
				
					zip_x = obj_camera.x+random_range(-100,100);
					zip_y = obj_camera.y+random_range(-50,50);
				
					scr_make_sound(snd_yammark_wings_zip,1,1,false);
					break;
					
				case 2: //Random movement
					action++;
					alarm[0] = 30;
				
					var pursue = irandom(1);
					if pursue = 0
					{
						zip_x = obj_camera.x+random_range(-100,100);
						zip_y = obj_camera.y+random_range(-50,50);
					}
					else
					{
						zip_x = obj_player.x;
						zip_y = obj_player.y;
					}
					//zip_x = x+lengthdir_x(20,point_direction(x,y,obj_player.x,obj_player.y))
					//zip_y = y+lengthdir_y(20,point_direction(x,y,obj_player.x,obj_player.y))
				
					scr_make_sound(snd_yammark_wings_zip,1,1,false);
					break;
					
				case 3: //Prepare for attack
					scr_make_sound(snd_yammark_talk_shoot,1,1,false);
					zipping = false;
					sprite_index = spr_boss_yammark_attack;
					
					shoot_amount = 8;
					with obj_boss_yanma_option
						aim = true;
						
					action++;
					alarm[0] = 60;
					break;
					
				case 4:
					zipping = true;
					with obj_boss_yanma_option
						aim_lock = true;
					
					if shoot < shoot_amount and instance_exists(obj_boss_yanma_option)
					{
						alarm[0] = 10;
						shoot++;
						
						//Firing projectiles
						with obj_boss_yanma_option
							event_user(11);	
					}
					else
					{
						shoot = 0;
						with obj_boss_yanma_option
							aim = false;

						if shoot_repeat > 0 and instance_exists(obj_boss_yanma_option)
						{
							alarm[0] = 30;
							action = 1;
							
							shoot_repeat--;
						}
						else
						{
							alarm[1] = 120;
							action = 0;
						}
					}
					break;
			}
			break;
			
		case "Bombs":
			switch (action)
			{
				case 0: //Cause drones to shrink in orbit
					action++;
					alarm[0] = 45;
					
					scr_make_sound(snd_yammark_talk_formation,1,1,false);
					
					with obj_boss_yanma_option
						follow = true;
					break;
			
				case 1:	//Start flying away
					action++;
					alarm[0] = 1;
				
					scr_make_sound(snd_yammark_talk_wing,1,1,false);
					zipping = false;
					
					
					sprite_index = spr_boss_yammark_fly_away;
					image_index = 0;
					image_speed = 1;
					animation_ended = false;
					
					//Pick a direction based on position in the room
					side = 1;
					if x < obj_camera.x
						side = -1;
					break;
					
				case 2: //Flying offscreen
					if animation_ended = true
					{
						animation_ended = false;
						image_speed = 0;
						image_index = -1;
					}
						
					if place_meeting(x,y,obj_spawnzone)
					{
						image_xscale = -side;
						xspeed += 0.1*image_xscale;
						yspeed -= 0.02;
						
						alarm[0] = 1;
					}
					else
					{
						action++;
						alarm[0] = 60;
					
						xspeed = 0;
						yspeed = 0;
						wing_sound = false;
						
						scr_make_sound(snd_yammark_talk_go,1,1,false);
					}
					break;
					
				case 3: //Flying across the screen at the top
					image_xscale = side;
					x = obj_camera.x-(250*image_xscale);
					y = obj_camera.y-100;
					with obj_boss_yanma_option
					{
						x = obj_boss_yammark.x;
						y = obj_boss_yammark.y;
						invul = false;
					}
					
					xspeed = 14*image_xscale;
					image_angle = 0-(30*image_xscale);
					scr_make_sound(snd_yammark_flyby_short,1,1,false);
					
					//Shake the screen
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.intensity = 3;
					shake.smooth = true;
					shake.style = 1;
					
					action++;
					alarm[0] = 30;
					break;
					
				case 4:
					action++;
					alarm[0] = 90;
					
					event_user(11); //Drop bombs
					break;
					
				case 5: //Flying across the screen at the top
					image_xscale = -side;
					x = obj_camera.x-(250*image_xscale);
					y = obj_camera.y-100;
					with obj_boss_yanma_option
					{
						x = obj_boss_yammark.x;
						y = obj_boss_yammark.y;
					}
					
					xspeed = 14*image_xscale;
					image_angle = 0-(30*image_xscale);
					scr_make_sound(snd_yammark_flyby_short,1,1,false);
					
					//Shake the screen
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.intensity = 3;
					shake.smooth = true;
					shake.style = 1;
					
					action++;
					alarm[0] = 30;
					break;
					
				case 6:
					action++;
					alarm[0] = 90;
					
					event_user(11); //Drop bombs
					break;
					
				case 7:
					action++;
					alarm[0] = 60;
			
					image_angle = 0;
					image_speed = 1;
					zipping = true;
					wing_sound = true;
				
					zip_x = obj_camera.x+(100*side)
					zip_y = obj_camera.y-200;
					x = zip_x;
					y = zip_y;
					
					with obj_boss_yanma_option
					{
						follow = false;
						orbit_grow = 35;
						orbit = orbit_grow;
						target = obj_boss_yammark;
						
						x = obj_boss_yammark.x;
						y = obj_boss_yammark.y;
					}
					break;
					
				case 8:
					action++;
					alarm[0] = 30;
				
					zip_x = x-30
					zip_y = y+130;
				
					scr_make_sound(snd_yammark_wings_zip,1,1,false);
					break;
				
				case 9:
					action++;
					alarm[0] = 30;
				
					zip_x = x+45
					zip_y = y-30;
				
					scr_make_sound(snd_yammark_wings_zip,1,1,false);
					break;
				
				case 10:
					action = 0;
					alarm[1] = 30;
				
					zip_x = x-90
					zip_y = y+70;
				
					scr_make_sound(snd_yammark_wings_zip,1,1,false);
					break;
			}
			break;
			
		case "Reinforcement":
			switch (action)
			{
				case 0: //Charge
					action++;
					alarm[0] = 30;
			
					zipping = false;
					sprite_index = spr_boss_yammark_charge;
					break;
				
				case 1: //Spawn yanma
					action = 0;
			
					sprite_index = spr_boss_yammark_charge_release;
					summon_count += 2;
					
					if life <= lifemax/3 and done_giga = false
					{
						done_giga = true;
						summon_state = 3
						state = "Giga";
						
						alarm[0] = 60;
					}
					else
						alarm[1] = 1;
					
					event_user(10);
					break;
			}
			break;
			
		case "Giga":
			switch (action)
			{
				case 0: //Charge
					action++;
					alarm[0] = 60;
			
					zipping = false;
					sprite_index = spr_boss_yammark_charge;
					yspeed = 0.5;
					break;
					
				case 1: //Fly off screen at high speed
					action++;
					alarm[0] = 1;
					
					sprite_index = spr_boss_yammark_fly_upwards;
					animation_ended = false;
					yspeed = -14;
					
					scr_make_sound(snd_yammark_flyby_short,1,1,false);
					
					//Shake the screen
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.intensity = 8;
					shake.smooth = true;
					shake.style = 1;
					break;
					
				case 2:
					alarm[0] = 1;
				
					if animation_ended = true
					{
						animation_ended = false;
						
						image_speed = 0;
						image_index = -1;
					}
					
					if !place_meeting(x,y,obj_camera)
					{
						action++;
						alarm[0] = 90;
						
						zipping = true;
						zip_x = obj_camera.x;
						zip_y = obj_camera.y-175;
						x = zip_x;
						y = zip_y;
						with obj_boss_yanma_option
						{
							x = obj_boss_yammark.x;
							y = obj_boss_yammark.y;
						}
					}
					break;
					
				case 3:
					action++;
					alarm[0] = 30;
					
					zip_y += 90;
					scr_make_sound(snd_yammark_wings_zip,1,1,false);
					break;
					
				case 4:
					action++;
					alarm[0] = 45;
					
					zipping = false;
					sprite_index = spr_boss_yammark_charge;
					
					scr_make_sound(snd_yammark_talk_formation,1,1,false);
					
					//Spin faster
					orbit_change = "Faster";
					break;
					
				case 5:
					action++;
					alarm[0] = 1;
					
					sprite_index = spr_boss_yammark_charge_release;
					scr_make_sound(snd_yammark_talk_final,1,1,false);
					
					shoot = 0;
					shoot_amount = 30;
					break;
					
				case 6:
					if shoot < shoot_amount
					{
						alarm[0] = 10;
						shoot++;
					
						//Firing projectiles
						with obj_boss_yanma_option
							if order%3 = 0
								event_user(12);
					}
					else
					{				
						action = 0;
						alarm[1] = 120;
						
						shoot = 0;
						zipping = true;
						
						//Spin faster
						orbit_change = "Slower";
						with obj_boss_yanma_option
							sprite_index = spr_yanma_option;
					}
					break;
			}
			break;
	}
}













