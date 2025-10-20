/// @description Insert description here
// You can write your code in this editor

event_inherited();

if setup = false
{
	setup = true;
	image_alpha = 1;
	
	//Starting sprites
	if sprite_index = spr_bullet_highmax_large
		sprite_index = spr_boss_highmax_charge;
	else if sprite_index = spr_bullet_highmax_large_yellow
		sprite_index = spr_boss_highmax_charge_yellow;
}

if sound != 0 and place_meeting(x,y,obj_camera)
{
	if !audio_is_playing(sound)
		scr_make_sound(sound,1,1,false);

}

switch (behaviour)
{
	case 1: //Death Ball Classic
		switch (behaviour_state)
		{
			case 0: //Turn when touching the ground
				if place_meeting(x,y+vspeed,obj_solid)
				{
					behaviour_state++;
					if image_xscale = 1
						direction = 0;
					else
						direction = 180;
				}
				break;
				
			case 1: //Turn up when touching a wall
				if place_meeting(x+hspeed,y,obj_solid)
				{
					behaviour_state++;
					direction = 90;
				}
				break;
		}
		break;
		
	case 2: //Death Ball Split
		switch (behaviour_state)
		{
			case 0:
				if speed > 0
					speed -= 0.25;
				else
				{
					behaviour_state++;
					alarm[0] = 30+split_delay;
				}
				break;
		
			case 2:
				behaviour_state++;
				
				scr_make_sound(snd_highmax_split,1,1.5,false);
				direction = point_direction(x,y,obj_player.x,obj_player.y);
				speed = 6;
				break
		}
		break;
		
	case 3: //Death Ball Split Yellow
		switch (behaviour_state)
		{
			case 0:
				if speed > 0
					speed -= 0.25;
				else
				{
					behaviour_state++;
					alarm[0] = 30+split_delay;
				}
				break;
		
			case 2:
				behaviour_state++;
				
				scr_make_sound(snd_highmax_split,1,1.5,false);
				direction = point_direction(x,y,obj_player.x,obj_player.y);
				speed = 4;
				
				split_delay = 0;
				break
				
			case 3:
				if split_delay < 60
				{
					split_delay++;
					
					//Loosesly follow the player
					if split_delay%3 = 0
					{
						//Homing towards the player with a wide arch
						var a = point_direction(x,y,obj_player.x,obj_player.y);
						direction += sign(dsin(a-direction))*(speed);
					}
				}
				else //Destroy on walls and stop tracking
					phasing = false;
				break;
			/*
				behaviour_state++;
				alarm[0] = 5;
				break;
		
			case 5:
				if speed > 0
					speed -= 0.5;
				else
				{
					behaviour_state++;
					alarm[0] = 15;
				}
				break;
					
			case 7:
				if split_delay < 3
				{
					split_delay++;
					behaviour_state = 3;
				}
				else 
				{
					behaviour_state++;
					alarm[9] = 1;
				}
				
				scr_make_sound(snd_highmax_split,0.5,1.75,false);
				direction = point_direction(x,y,obj_player.x,obj_player.y);
				speed = 6;
				break*/
		}
		break;
		
	case 4: //Death Ball Yellow
		switch (behaviour_state)
		{
			case 0: //Turn down when touching a wall
				if place_meeting(x+hspeed,y,obj_solid)
				{
					behaviour_state++;
					direction = 270;
				}
				break;
			
			case 1: //Turn when touching the ground
				if place_meeting(x,y+vspeed,obj_solid)
				{
					behaviour_state++;
					if image_xscale = -1
						direction = 0;
					else
						direction = 180;
				}
				break;
				
			case 2: //Turn up when touching a wall
				if place_meeting(x+hspeed,y,obj_solid)
				{
					behaviour_state++;
					direction = 90;
				}
				break;
		}
		break;
}

//Split apart after some time
if rupture > 0
	rupture--;
else if rupture = 0
{
	//Slow down
	if speed > 0
		speed -= 0.1;
	else
	{
		//Split apart
		if image_speed != 0
		{
			event_user(10);			
			shake = instance_create_depth(0,0,0,obj_shake);
			
			//Stop sound
			audio_stop_sound(sound);
			sound = 0;
		}
	
		image_speed = 0;
		image_index = 0;
		
		//Fade away
		if image_alpha > 0
			image_alpha -= 0.05;
		else
			instance_destroy();
	}

}