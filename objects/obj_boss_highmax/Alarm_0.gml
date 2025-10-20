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
					alarm[0] = 1;
					
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.intensity = 1;
					shake.length = 99999;
					scr_make_sound(snd_highmax_humming,4,1,false);
					break;
				
				case 2: //Hover down
					if y < ystart
					{
						yspeed = 1;
						alarm[0] = 1;
					}
					else
					{
						action++;
						alarm[0] = 1;
						
					}
					break;
					
				case 3:
					if yspeed > 0
					{
						alarm[0] = 1;
					
						yspeed -= 0.05;
						shake.intensity = 0.5;
					}
					else
					{
						action++;
						alarm[0] = 120;
						
						audio_sound_gain(snd_highmax_humming,0,2000);
						instance_destroy(shake);
					}
					break;
			
				case 4:
					audio_stop_sound(snd_highmax_humming);
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
				case 0: //Set up
					action++;
					alarm[0] = 1;
					
					attack_type = irandom(1); //If it will shoot blue or yellow projectiles
					attack_split = choose(0,0,1); //If doing the spread shot or not
					shoot = 0;
					shoot_amount = 4;
					if attack_split = 1 //Spread shot
						shoot_amount = 0;
					
					second_hand = false;
					
					image_index = 0;
					sprite_index = spr_boss_highmax_shoot;
					if attack_type = 1 //Yellow 
						sprite_index = spr_boss_highmax_shoot_yellow;
					scr_make_sound(snd_highmax_talk_die,1,1,false);
					
					image_xscale = 1;
					if obj_camera.x < x
						image_xscale = -1;
					break;
			
				case 1:
					alarm[0] = 1;
					if image_index > 8
					{
						event_user(10);
						
						if shoot < shoot_amount
						{
							shoot++;
							image_index = 4;
						}
						else
						{
							action++;
							alarm[0] = 30;
							//if attack_split = 1
							//	alarm[0] = 60;
							
							shoot = 0;
							second_hand = true;
							image_speed = 0;
						}
					}
					break;
					
				case 2:
					alarm[0] = 1;
					image_speed = 1;
					
					if image_index > 19
					{
						if shoot < shoot_amount
						{
							shoot++;
							image_index = 15;
						}
						else
						{
							action++;
							alarm[0] = 30;
							
							shoot = 0;
							image_speed = 0;
						}
						
						event_user(10);
					}
					break;
					
				case 3:
					action++;
					alarm[0] = 1;
				
					animation_ended = false;
					image_speed = 1;
					break;
					
				case 4:
					if animation_ended = true
					{
						action = 0;
						alarm[1] = 30;
					
						animation_ended = false;
						
						sprite_index = spr_boss_highmax;
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
			
		case "Punching":
			switch (action)
			{
				case 0: //Set up
					action++;
					alarm[0] = 1;
					
					image_index = 0;
					sprite_index = spr_boss_highmax_punch;
					attack_type = irandom(1);
					attack_split = choose(0,0,1);
					
					//If during that intro cutscene
					if instance_exists(obj_cutscene_intro_ending)
					{	
						attack_type = 0;
						attack_split = 0;
					}
					
					image_xscale = 1;
					if obj_camera.x < x
						image_xscale = -1;
					break;
			
				case 1: //Wind up
					alarm[0] = 1;
					
					if image_index > 4
					{
						action++;
						alarm[0] = 30;
					
						image_speed = 0;
						
						energy = instance_create_depth(x,y,depth+1,obj_bullet_charge);
						energy.target = self;
						energy.target_x = 2*image_xscale;
						energy.target_y = -24;
						energy.sound = snd_highmax_charge;
						energy.damage = bullet_damage_2;
						energy.villainy = 2;
						
						if attack_type = 1
						{
							energy.sprite_index = spr_boss_highmax_charge_yellow;
							xspeed = 2*image_xscale;
						}
					}
					break;
					
				case 2: //Stronger
					action++;
					alarm[0] = 30;
					
					energy.sprite_index = spr_bullet_highmax_large;
					if attack_type = 1
					{
						energy.sprite_index = spr_bullet_highmax_large_yellow;
						
						//Within range
						if obj_player.x < x+5 and obj_player.x > x-5
						{
							alarm[0] = 60;
							xspeed = 0;
						}
						else
						{
							alarm[0] = 1;
							action = 2;
						}
					}
					break;
				
				case 3: //Move
					alarm[0] = 1;
				
					if place_meeting(x,y+15,obj_solid)
					{
						action++
						alarm[0] = 1;
						
						if attack_type = 1
							event_user(3); //Face player
						xspeed = 10*image_xscale;
						yspeed = 0;
					}
					else
					{
						xspeed = 0;
						yspeed = 10;	
					}
					break;
					
				case 4:
					alarm[0] = 1
					image_speed = 1;
					
					if image_index > 7
					{
						action++;
						image_speed = 0;
						
						energy.target_x = 47*image_xscale;
						energy.target_y = -7;
						energy.depth = depth-1;
					}
					break;
					
				case 5:
					alarm[0] = 1;
					if place_meeting(x+xspeed+(25*image_xscale),y,obj_solid)
					{
						action++;
						
						xspeed = 0;
						
						shake = instance_create_depth(0,0,0,obj_shake);
						
						scr_make_sound(snd_highmax_punch,1,1,false);
						
						//Split into 4 projectiles
						if attack_split = 1
							alarm[0] = 60;
					}
					break;
					
				case 6:
					var check = false;
					alarm[0] = 1;
					
					with energy
					{
						//Split apart
						if obj_boss_highmax.attack_split = 1
						{
							event_user(10);
							obj_boss_highmax.attack_split = 0;
							
							shake = instance_create_depth(0,0,0,obj_shake);
						}
						
						image_speed = 0;
						image_index = 0;
						
						if image_alpha > 0
							image_alpha -= 0.05;
						else
						{
							check = true;
							instance_destroy();
						}
					}
					
					if check = true
					{
						action++;
						alarm[0] = 1;
					}
					break;
					
				case 7: //Little delay
					action++;
					alarm[0] = 1;
				
					image_speed = 1;
					animation_ended = false;
					break;
					
				case 8:
					if animation_ended = true
					{
						animation_ended = false;
						
						action++;
						alarm[0] = 60;
					
						sprite_index = spr_boss_highmax;
						
						//Which side do we go?
						if x < obj_camera.x //Go to closest side
							side = -1;
						else
							side = 1;
					}
					else
						alarm[0] = 1;
					break;					
					
				case 9: //Move to side of screen
					if distance_to_point(obj_camera.x+(140*side),ystart-10) > 5
					{
						alarm[0] = 1;
						
						speed = 4;
						direction = point_direction(x,y,obj_camera.x+(140*side),ystart-10);
					}
					else
					{
						action = 0;
						alarm[1] = 60;
								
						speed = 0;
						event_user(3);
					}
					break;
			}
			break;
		
		case "Death Ball":
			switch (action)
			{
				case 0: //Set up
					action++;
					alarm[0] = 1;
					
					shoot = 0;
					shoot_amount = 10; //Charge time
					attack_type = irandom(1);
					attack_split = choose(0,0,1);
					
					image_index = 0;
					sprite_index = spr_boss_highmax_ball;
					if attack_type = 1
						sprite_index = spr_boss_highmax_ball_yellow;
					
					image_xscale = 1;
					if obj_camera.x < x
						image_xscale = -1;
					break;
			
				case 1: //Charge up death ball
					alarm[0] = 1;
					
					if image_index > 10
					{
						if shoot < shoot_amount
						{
							image_index = 8;
							shoot++;	
							
							//Talk
							if shoot = shoot_amount/2
								scr_make_sound(snd_highmax_talk_deathball,1,1,false);
							
							//Charging sound
							if !audio_is_playing(snd_highmax_shield_charge)
								scr_make_sound(snd_highmax_shield_charge,1,1,false);
						}
						else
						{
							action++;
							
							event_user(11); //Shoot
						}
					}
					break;
					
				case 2: //Hold pose
					alarm[0] = 1;
					
					if image_index > 15
					{
						action++;
						alarm[0] = 180;
						
						image_speed = 0;
						
						if attack_type = 1 //Shorter
							alarm[0] = 15;
					}
					break;
				
				case 3: //Return to idle
					action++;
					alarm[0] = 1;
				
					image_speed = 1;
					
					//Trash talk
					//scr_make_sound(snd_highmax_talk_muda,1,1,false);
					
					animation_ended = false;
					break;
					
				case 4:
					if animation_ended = true
					{
						animation_ended = false;
						
						action = 0;
						alarm[1] = 60;
					
						sprite_index = spr_boss_highmax;
						
						if attack_type = 1 //Move out of the way of the death ball
						{
							alarm[1] = 135;
							side *= -1;
							xspeed = 2*image_xscale;
						}
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
			
		case "Overcharge":
			switch (action)
			{
				case 0: //Set up
					action++;
					alarm[0] = 1;
					
					shoot = 0;
					shoot_amount = 5; //Charge time
					attack_type = irandom(1);
					attack_split = choose(0,0,1);
					
					image_index = 0;
					sprite_index = spr_boss_highmax_ball;
					if attack_type = 1
						sprite_index = spr_boss_highmax_ball_yellow;
					
					image_xscale = 1;
					if obj_camera.x < x
						image_xscale = -1;
					break;
			
				case 1: //Charge up death ball
					alarm[0] = 1;
					
					if image_index > 10
					{
						if shoot < shoot_amount
						{
							image_index = 8;
							shoot++;	

							//Charging sound
							if !audio_is_playing(snd_highmax_shield_charge)
								scr_make_sound(snd_highmax_shield_charge,1,1,false);
						}
						else
						{
							action++;
							alarm[0] = 60;
							
							image_index = 4;
							image_speed = 0;
							
							scr_make_sound(snd_highmax_talk_muda,1,1,false);
							
							shoot = 0;
							shoot_amount = 120+irandom(60); //Charge time
							if attack_type = 1
								shoot_amount = 180+irandom(60); //Longer charge time
							if attack_split = 1
								shoot_amount /= 2; //Shorter time
							
							shake = instance_create_depth(0,0,0,obj_shake);
							shake.intensity = 0.5;
							shake.length = 99999;
							
							energy = instance_create_depth(x,y,depth-1,obj_bullet_charge);
							energy.target = self;
							energy.target_x = -3*image_xscale;
							energy.target_y = -2;
							energy.sound = snd_highmax_charge;
						
							energy.damage = bullet_damage_2;
							energy.villainy = 2;
							
							if attack_type = 1
								energy.sprite_index = spr_boss_highmax_charge_yellow;
						}
					}
					break;
					
				case 2: //Chase after the player
					if shoot < shoot_amount
					{	
						shoot++;
						alarm[0] = 2;
						
						speed = 2;
						direction = point_direction(x,y,obj_player.x,obj_player.y);
						
						shake.intensity = 1;
					
						sprite_index = spr_boss_highmax_overcharge;
						energy.sprite_index = spr_bullet_highmax_large;
						
						//Yellow attack
						if attack_type = 1
						{
							//Move slower
							energy.sprite_index = spr_bullet_highmax_large_yellow;
							speed = 1;
							
							if shoot%20 = 0
								event_user(13); //Periodically shoot projectiles
						}
					}
					else
					{	
						if attack_split = 1 //Fire the energy
						{
							//Announce
							if shoot != 999
							{
								scr_make_sound(snd_highmax_talk_deathball,1,1,false);
								shoot = 999;
							}
							
							if speed > 0
							{
								alarm[0] = 1;
							
								speed -= 0.05;
							}
							else
							{
								action = 6;
								alarm[0] = 30;
							}
						}
						else
						{
							//Crush energy
							if speed > 0
							{
								alarm[0] = 1;
							
								speed -= 0.02;
								image_speed = 4;
								energy.sprite_index = spr_boss_highmax_charge_small;
								shake.intensity = 2;
								
								if attack_type = 1
									energy.sprite_index = spr_boss_highmax_charge_small_yellow;
							}
							else
							{
								action++;
								alarm[0] = 30;
							
								scr_make_sound(snd_highmax_grunt,1,1,false);
							}
						}
					}
					break;
					
				case 3: //Shockwave
					action++;
					alarm[0] = 30;
					
					scr_make_sound(snd_highmax_crush,1,1,false);
					
					sprite_index = spr_boss_highmax;
					image_speed = 1;
					
					instance_destroy(energy);
					
					fade = instance_create_depth(0,0,0,obj_fade_in);
					fade.alpha = 1;
					fade.fade_type = 1;
					fade.image_blend = c_white;
					fade.fade_speed = 0.01;
					
					instance_destroy(shake);
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.length = 240;
					
					shoot = 0;
					shoot_amount = 10;
					break;
					
				case 4:
					if shoot < shoot_amount
					{
						shoot++;
						alarm[0] = 15;
						
						event_user(12); //Falling debris
					}
					else
					{
						action++;
						alarm[0] = 10;
						
						event_user(3);
						
						//Which side do we go?
						if x < obj_camera.x //Go to closest side
							side = -1;
						else
							side = 1;
					}
					break;
					
				case 5: //Move to side of screen
					if distance_to_point(obj_camera.x+(140*side),ystart-10) > 5
					{
						alarm[0] = 1;
						
						speed = 2;
						direction = point_direction(x,y,obj_camera.x+(140*side),ystart-10);
					}
					else
					{
						action = 0;
						alarm[1] = 60;
						
						speed = 0;
						event_user(3);
					}
					break;
					
					
				case 6: //ALTERNATE ending
					action++;
					alarm[0] = 1;
				
					sprite_index = spr_boss_highmax_ball
					image_index = 10;
					image_speed = 1;
					instance_destroy(energy);
					instance_destroy(shake);
					
					event_user(11);
					break;
					
				case 7: //Hold pose
					alarm[0] = 1;
					
					if image_index > 15
					{
						action++;
						alarm[0] = 120;
						
						image_speed = 0;
					}
					break;
				
				case 8: //Return to idle
					action++;
					alarm[0] = 1;
				
					image_speed = 1;
					animation_ended = false;
					break;
					
				case 9:
					alarm[0] = 1;
					if animation_ended = true
					{
						animation_ended = false;
						
						action = 5;
						event_user(3);
						sprite_index = spr_boss_highmax;
					}	
					
					//Which side do we go?
					if x < obj_camera.x //Go to closest side
						side = -1;
					else
						side = 1;
					break;
			}
			break;
	}
}













