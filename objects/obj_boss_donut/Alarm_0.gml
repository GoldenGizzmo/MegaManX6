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
					alarm[0] = 45;
				
					
					jewel_activated = true
					for (var i = 0; i < 4; i++)
					{
						jewel = instance_create_depth(0,0,depth-1,obj_boss_donut_jewel);
						jewel.jewel_position = i;
						jewel.bullet_damage = bullet_damage;
						switch (i)
						{
							case 0: jewel.sprite_index = spr_boss_donut_jewel_1; break;
							case 1: jewel.sprite_index = spr_boss_donut_jewel_2; break;
							case 2: jewel.sprite_index = spr_boss_donut_jewel_3; break;
							case 3: jewel.sprite_index = spr_boss_donut_jewel_4; break;
						}
					
					}
					
					var get_lifemax = 0
					with obj_boss_donut_jewel
						get_lifemax += life;
			
					lifemax = get_lifemax;
					life = lifemax;
					obj_bossmanager.lifebar_intro = lifemax;
					
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.length = 9999;
					shake.intensity = 4;;
					
					sprite_index = spr_boss_donut_spawn;
					image_index = 0;
					image_speed = 0;
					break;
				
				case 2: //Absorbing nightmares
					alarm[0] = 1;
					
					image_speed = 0.07;
					if image_index < 7
					{
						
						image_alpha += 0.1;
						
					}
					else
					{
						action++;
						
						image_speed = 1;
						animation_ended = false;
						
						audio_stop_sound(snd_heatnix_rumble)
						scr_make_sound(snd_nightmare_transform,1,0.5,false);
					}
					break;
					
				case 3:
					if animation_ended = true
					{
						animation_ended = false;
						shake.length = 30;
						
						action++;
						alarm[0] = 1;
						
						sprite_index = spr_boss_donut;
					}
					else
						alarm[0] = 1;
					break;
				
				case 4:
					with instance_nearest(x,y,obj_bossmanager)
					{
						bossfight_state++;
						alarm[0] = 1;
					}
					break;
			}
			break;
		
		case "Openning":
			if action = 0
			{
				action++;
				alarm[0] = 30;
			
				scr_make_sound(snd_roar,1,1,false);
				shake = instance_create_depth(0,0,0,obj_shake);
				shake.length = 60;
				shake.intensity = 4;
			}
			else
			{
				action = 0;
				
				with instance_nearest(x,y,obj_bossmanager)
				{
					bossfight_state++;
					alarm[0] = 10;
				}
			}
			break;
	
		case "Moving":
			if action = 0 //Choosing direction
			{
				//Alternate between aligning with the players X and Y axis

				//Alternate axis
				if moving_vertical = true 
				{
					moving_vertical = false;
					
					if obj_player.x < x
						direction = 180;
					else
						direction = 0;
				
				}
				else
				{
					moving_vertical = true; 
					
					if obj_player.y-50 > y
						direction = 270;
					else
						direction = 90;
				}
				
				action++;
				alarm[0] = 30;
				
				//Variable for hitting walls and ceilings
				crash = false;
				
				xspeed = 0;
				yspeed = 0;
				
				//Move more accurate as more jewels are destroyed
				move_delay = 60;
				if instance_number(obj_boss_donut_jewel) = 2
					move_delay = 30;
				else if instance_number(obj_boss_donut_jewel) = 1
					move_delay = 15;
				
				if direction != 270 //Causes the boss to be stuck for too long
				{
					//Do someting bullet snakes
					if summoning > 0
						summoning--;
					else
						summoning = 2+irandom(3);
				}
			}
			else
			{
				alarm[0] = 1;
				
				//Move to player's axis and then turn after a delay
				var acceleration = 0.2;
				if move_delay > 0
					move_delay--;
				
				switch (direction)
				{
					case 0: //Moving right
						if xspeed < move_speed
							xspeed += acceleration; 
						if (obj_player.x < x and move_delay = 0)
						{
							action = 0;
							alarm[0] = 1;
						}
						break; 
					case 90:  //Moving up
						if yspeed > -move_speed
							yspeed -= acceleration; 
						if (obj_player.y > y and move_delay = 0)
						{
							action = 0;
							alarm[0] = 1;
						}
						break; 
					case 180: //Moving left
						if xspeed > -move_speed
							xspeed -= acceleration; 
						if (obj_player.x > x and move_delay = 0)
						{
							action = 0;
							alarm[0] = 1;
						}
						break; 
					case 270: 
						if yspeed < move_speed	
							yspeed += acceleration; 
						if (obj_player.y-50 < y and move_delay = 0)
						{
							action = 0;
							alarm[0] = 1;
						}
						break; 
				}
			
				if move_delay = 0 and summoning = 0 and !instance_exists(obj_boss_donut_fire)
				{
					alarm[1] = 1;
					
					action = 0;
					alarm[0] = -1
				}
			}
			break;
			
		case "Summon":
			//Slow down
			xspeed /= 2;
			yspeed /= 2;
			with obj_boss_donut_jewel {image_speed = 1;}
		
			switch (action)
			{
				case 0:
					action++;
					alarm[0] = 30;
					break;
					
				case 1:
					action++;
					alarm[0] = 30;
				
					energy = instance_create_depth(x,y,depth-1,obj_bullet_charge);
					energy.target = self;
					energy.sound = snd_highmax_charge;
					energy.damage = bullet_damage_2;
					energy.villainy = 2;
					energy.phasing = true;
					energy.despawn = false;
					
					energy.sprite_index = spr_bullet_nightmare_huge_spawn;
					energy.animation_next = spr_bullet_nightmare_huge;
					break;
			
				case 2:
					if shoot < shoot_amount
					{
						shoot++;
						alarm[0] = 30;
					
						event_user(10);
						//Orb gets smaller
						if shoot > 2
						{
							with energy
							{
								sprite_index = spr_bullet_nightmare_big
								animation_next = 0;
							}
						}
					}
					else
					{
						action++;
						alarm[0] = 60;
						
						with energy
							sprite_index = spr_bullet_nightmare;
							
						shoot = 0;
					}
					break;
					
				case 3:
					action = 0;
					alarm[1] = 30;
					
					with energy
						instance_destroy();
					break;
			}
			break;
	}
}













