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
					alarm[0] = 120;
					
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.intensity = 2;
					shake.length = 99999;
					shake.style = 1;
					
					xspeed = 1;
					scr_make_sound(snd_heatnix_rumble,1,1,true);
					break;
				
				case 2:
					xspeed = 0;
					
					instance_destroy(shake)
					audio_stop_sound(snd_heatnix_rumble);
				
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
				shake.style = 1;
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
			
		case "First Moving":
			switch (action)
			{
				case 0:
					action++;
					alarm[0] = 30;
				
					xspeed = -3;
					direction = 180;
					break;
					
				case 1:
					action++;
					alarm[0] = 80;
				
					xspeed = 5;
					direction = 0;
					scr_make_sound(snd_d1000_drop,1,1,false);
					break;
					
				case 2:
					if xspeed > 0
					{
						alarm[0] = 1;
					
						xspeed -= 0.2;
						direction = 180;
					}
					else
					{
						action = 0;
						alarm[1] = 30;
						
						x_pos = x;
						xspeed = 0;
					}
					break;
			}
			break;
			
		case "Moving":
			if action > (60*bounce_amount) and (y < obj_camera.y-100 or y > obj_camera.y) and shoot < shoot_delay
			{
				direction = 0;
				yspeed = 0;
				
				action = 0;
				alarm[1] = 15;
			}
			else
			{
				action++;
				alarm[0] = 1;
		
				//Direction moving
				if direction = 90
					yspeed = -2;
				else
					yspeed = 2;
			
				//Bouncing up and down
				if y < obj_camera.y-100
				{
					direction = 270;
				
					if shake = false
					{
						shake = true;
						scr_make_sound(snd_donut_bounce,1,1,false);
							
						shake = instance_create_depth(0,0,0,obj_shake);
						shake.length = 15;
						shake.style = 1;
					}
				}
				else if y > obj_camera.y
				{
					direction = 90;
				
					if shake = false
					{
						shake = true;
						scr_make_sound(snd_donut_bounce,1,1,false);
							
						shake = instance_create_depth(0,0,0,obj_shake);
						shake.length = 15;
						shake.style = 1;
					}
				}
				else
					shake = false;
			}
			break;
			
		case "Charge":
			//y = clamp(y,obj_camera.y-100,obj_camera.y);
			
			switch (action)
			{
				case 0:
					action++;
					alarm[0] = 20;
					
					//Reel back
					direction = 0;			
					xspeed = 2;
					break;
			
				case 1:
					action++
					alarm[0] = 30;
					
					direction = 180;
					xspeed = -7;
					
					scr_make_sound(snd_d1000_drop,1,1,false);
					
					//Go in an arch
					if y < obj_camera.y
						yspeed = 1;
					break;
					
				case 2:
					//Turn around
					direction = 180
					if xspeed > 0
						direction = 0;
					
					if x < x_pos
					{
						alarm[0] = 1;
			
						if xspeed < 8
							xspeed += 0.2;		
					}
					else
					{
						action = 0
						alarm[1] = 1;
										
						yspeed = 0;
						xspeed = 0;
					}
					break;
			}
			break;
	}
}













