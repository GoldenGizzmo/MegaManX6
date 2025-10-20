/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Appearance":
			switch (action)
			{
				case 1: //Eye appears and starts posessing
					action++;
					alarm[0] = 60;
					
					//Choose a side to spawn at
					var side = boss_direction
					with obj_enemy_nightmare_polter_spawn
						if image_xscale = side
							side = id;
					
					//Spawn nightmare polter
					instance_destroy(obj_enemy_nightmare_polter); //Remove level ones
					eye = instance_create_depth(side.x-50,side.y,depth+1,obj_enemy_nightmare_polter);
					eye.fade_in = true;
					eye.possess_target = id;
					eye.image_alpha = 0;
					eye.fade_away = 40;
					scr_make_sound(snd_polter_teleport,1,1,false);
					
					shaking = 0;
					break;
				
				case 2: //Shaking as it's getting possessed
					if shaking < 30
					{
						shaking++;
						alarm[0] = 2;
						
						//Left and right
						if x = xstart
							x += 2;
						else
							x = xstart;	
						
						if shaking%5 = 0
							scr_make_sound(snd_d1000_shift,1,0.5,false);
					}
					else
					{
						action++;
						alarm[0] = 1;
						
						image_speed = 1;
						animation_ended = false;
						
						scr_make_sound(snd_d1000_rise,1,1,false);
						obj_enemy_nightmare_polter.quiet = true;
					}
					break;
				
				case 3: //Rising
					if animation_ended = true
					{
						animation_ended = false;
						
						image_speed = 0;
						image_index = -1;
					}
				
					//If below height
					if y > ystart
					{
						alarm[0] = 1;
						
						yspeed = -1; //Rise
						weight = 0;
					}
					else
					{
						action++;
						alarm[0] = 1;
						
						yspeed = 0;
						
						image_speed = -1;
						scr_make_sound(snd_d1000_shift,1,1,false);
						activated = true;
					}
					break;
				
				case 4:
					if image_index > 0
						alarm[0] = 1;	
					else
					{
						image_speed = 1;
						image_index = 0;
						sprite_index = spr_boss_d1000_idle;
						
						action++;
						alarm[0] = 1;
					}
					break;
				
				case 5:
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
				
					scr_make_sound(snd_d1000_shift,1,1,false);
					break;
				
				case 1: //Get into position
					with obj_enemy_nightmare_polter
					{
						if x < xstart+60
							xspeed = 1;
						else
							xspeed = 0;
					}
					
					if y < ystart+60
						yspeed = 5;
					else
					{
						if yspeed != 0
						{
							scr_make_sound(snd_d1000_drop,1,1,false);
						
							shaking = 15;
							alarm[2] = 1;
							
							yspeed = 0;	
						}
					}
						
					alarm[0] = 1
					if obj_enemy_nightmare_polter.xspeed = 0 and yspeed = 0
						action++;
					break; 
	
				case 2:
					action = 0;
				
					with instance_nearest(x,y,obj_bossmanager)
					{
						bossfight_state++;
						alarm[0] = 10;
					}
					break;
			}
			break;
			
		case "Falling":
			switch (action)
			{
				case 0:
					xspeed = 0;
					yspeed = 0;
		
					weight = 0.2;
					scr_make_sound(snd_d1000_losepower,1,1,false);
					
					sprite_index = spr_boss_d1000_possess;;
					image_speed = 1;
					image_index = 0;
					animation_ended = false;
					
					action++;
					alarm[0] = 1;
					break;
			
				case 1: //Falling in the air
					if animation_ended = true
					{
						animation_ended = false;
						
						image_speed = 0;
						image_index = -1;
					}
				
					//Hitting the ground
					if airborne = false
					{
						action++;
						
						scr_make_sound(snd_d1000_crash,1,1,false);
						
						life -= 30;
						boss_iframes = 240;
									
						shake = instance_create_depth(0,0,0,obj_shake);
						shake.length = 60;
						shake.style = 2;
						
						image_speed = -1;
					}
						
					alarm[0] = 1;
					break;
					
				case 2: //Landing animation
					if image_index < 1
					{
						image_speed = 0;
						image_index = 0;
						
						action++;
						alarm[0] = 60;
					}
					else
						alarm[0] = 1;	
					break;
					
				case 3: //Eye appears and starts posessing
					action++;
					alarm[0] = 60;
					
					//Choose a side to spawn at
					boss_direction = 1;
					if obj_player.x > obj_camera.x
						boss_direction = -1; //other side
					var side = boss_direction
					with obj_enemy_nightmare_polter_spawn
						if image_xscale = side
							side = id;
					
					//Spawn nightmare polter
					eye = instance_create_depth(side.x,side.y,depth+1,obj_enemy_nightmare_polter);
					eye.fade_in = true;
					eye.possess_target = id;
					eye.image_alpha = 0;
					eye.fade_away = 40;
					eye.invul = true;
					scr_make_sound(snd_polter_teleport,1,1,false);
					
					shaking = 0;
					store_x = x;
					break;
				
				case 4: //Shaking as it's getting possessed
					if shaking < 30
					{
						shaking++;
						alarm[0] = 2;
						
						//Left and right
						if x = store_x
							x += 2;
						else
							x = store_x;	
						
						if shaking%5 = 0
							scr_make_sound(snd_d1000_shift,1,0.5,false);
					}
					else
					{
						action++;
						alarm[0] = 1;
						
						image_speed = 1;
						animation_ended = false;
						
						scr_make_sound(snd_d1000_rise,1,1,false);
						obj_enemy_nightmare_polter.quiet = true;
					}
					break;
				
				case 5: //Rising
					if animation_ended = true
					{
						animation_ended = false;
						
						image_speed = 0;
						image_index = -1;
					}
					
					//Move x over the eye
					x += ((obj_enemy_nightmare_polter.x-(30*boss_direction))-x)*0.02;
				
					//If below height
					if y > ystart
					{
						alarm[0] = 1;
						
						yspeed = -1; //Rise
						weight = 0;
						
					}
					else
					{
						action++;
						alarm[0] = 1;
						
						yspeed = 0;
						
						image_speed = -1;
						scr_make_sound(snd_d1000_shift,1,1,false);
						activated = true;
					}
					break;
				
				case 6:
					if image_index > 0
						alarm[0] = 1;	
					else
					{
						image_speed = 1;
						image_index = 0;
						sprite_index = spr_boss_d1000_idle;
						
						obj_enemy_nightmare_polter.invul = false;
						
						action = 0;
						alarm[1] = 1;
					}
					break;
			}
			break;
			
		case "Shoot":
			switch (action)
			{
				case 0:
					action++;
					alarm[0] = 1;
					
					shoot = 0;
					shoot_amount = 4;
					break;
					
				case 1:
					if shoot < shoot_amount
					{
						shoot++;
						alarm[0] = 10;
				
						with obj_enemy_nightmare_polter
							event_user(10);
					}
					else
					{
						action = 0;
						alarm[1] = 60;
						
						shoot = 0;				
					}
					break;
			}
			break;
		
		case "Crush":
			switch (action)
			{
				case 0:
					alarm[0] = 1;
					event_user(3); //Face player
						
					//Hover above the player
					image_speed = 2;
					if obj_player.x > x+70
						xspeed = 1;
					else if obj_player.x < x-70
						xspeed = -1;
					else
					{
						action++;
							
							
						image_speed = 1;
						scr_make_sound(snd_d1000_shift,1,1,false);
					}
					break;
					
				case 1: //Drop
					xspeed = 0;
					alarm[0] = 1;
					
					if y < ystart+80
						yspeed = 4;
					else
					{
						action++;
						alarm[0] = 120;
						
						scr_make_sound(snd_d1000_drop,1,1,false);
						
						shaking = 30;
						alarm[2] = 1;
							
						yspeed = 0;	
					}
					break;
					
				case 2:
					if y > ystart
					{
						alarm[0] = 1;
						
						yspeed = -1;
					}
					else
					{
						alarm[1] = 30;
						action = 0;
						
						scr_make_sound(snd_d1000_shift,1,1,false);
						yspeed = 0;
						
						shaking = 15;
						alarm[2] = 1;
					}
					break;
			}
			break;
			
		case "Charge":
			switch (action)
			{
				case 0:
					action++;
					alarm[0] = 1;
					
					shoot = 0;
					shoot_amount = 90;
					break;
				
				case 1:
					alarm[0] = 1;
					
					if shoot < shoot_amount
					{
						shoot++;
						event_user(3); //Face player
						
						//Hover above the player
						image_speed = 2;
						if obj_player.y > y+5
							yspeed = 2;
						else if obj_player.y < y-5
							yspeed = -2;
						else
							yspeed = 0;
					}
					else
					{
						action++;
						alarm[0] = 30;
						
						yspeed = 0;
								
						image_speed = 1;
						scr_make_sound(snd_d1000_shift,1,1,false);
						
						shaking = 10;
						alarm[2] = 1;
					}
					break;
					
				case 2:	//Wind up
					action++;
					alarm[0] = 15;
				
					xspeed = -2*image_xscale;
					break;
					
				case 3: //Charge
					action++;
					alarm[0] = 1;
					
					xspeed = 8*image_xscale;
					sprite_index = spr_boss_d1000_charge;
					scr_make_sound(snd_d1000_rise,1,1,false);
					break;
					
				case 4:
					alarm[0] = 1;
				
					if place_meeting(x+xspeed,y,obj_solid)
					{
						action++;
						
						scr_make_sound(snd_d1000_crash,1,1,false);
						sprite_index = spr_boss_d1000_idle;
						xspeed = -xspeed;
						
						shake = instance_create_depth(0,0,0,obj_shake);
						shake.length = 30;
					}	
					break;
					
				case 5:
					if xspeed < 0.1 and xspeed > -0.1
					{
						xspeed = 0;
						
						if y > ystart
						{
							alarm[0] = 1;
							
							yspeed = -1;
						}
						else
						{
							action = 0;
							alarm[1] = 30;
							
							yspeed = 0;
						}
					}
					else
					{
						alarm[0] = 1;
						
						xspeed /= 1.05;
					}
					break;
			}
			break;
			
		case "Giga":
			switch (action)
			{
				case 0: //Start attacking
					action++;
					alarm[0] = 1;
			
					animation_ended = false;
					sprite_index = spr_boss_d1000_shoot;
					image_index = 0;
					break;
			
				case 1: //Spawn projectile
					if image_index > 3
					{
						event_user(10);
	
						action++;
						alarm[0] = 1;
					}
					else
						alarm[0] = 1;
					break;
			
				case 2: //Finish animating
					if animation_ended = true
					{
						animation_ended = false;
				
						action = 0;
						alarm[1] = 240; 
				
						image_index = 0;
						sprite_index = spr_boss_d1000_idle;
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
	}
}













