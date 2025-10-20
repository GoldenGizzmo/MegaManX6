/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (action)
	{
		case 0: //Rev up when in range
			if x < obj_player.x+aggro_range and x > obj_player.x-aggro_range and y < obj_player.y and !place_meeting(x,y,obj_solid)
			{
				action++;
				alarm[0] = 60;
				
				image_speed = 1;
				lights = "Down";
				
				scr_make_sound(snd_drill,1,1,false);
			}
			else
			{
				alarm[0] = 1;
				lights = "Nothing";
			}
			break;
	
		case 1: //Drop
			if !place_meeting(x,y,obj_solid)
			{
				action++;
				alarm[0] = 1;
			
				thruster = false;
			
				scr_make_sound(snd_jets_lift,1,1,false);
		
				weight = 0.5;
				colliding = true;
				yspeed = 1;
			}
			else
			{
				action = 0;
				alarm[0] = 1;
				
				image_speed = 0;
				lights = "Nothing";
			}
			break;
			
		case 2: //Hit ground
			alarm[0] = 1;
			
			if airborne = false or place_meeting(x,y+yspeed,obj_pit)
			{
				action++;
				
				//Destroy this platform
				with instance_place(x,y+1,obj_solid_crumble)
					instance_destroy();	
				
				weight = 0;
				colliding = false;
				
				yspeed = -2;
				lights = "Nothing";
				
				shake = instance_create_depth(0,0,0,obj_shake);
				shake.style = 1;
				shake.intensity = 2;
				shake.length = 30;
				
				scr_make_sound(snd_monbando_slam,1,1.5,false);
			}	
			break;
			
		case 3: //Recoil
			if yspeed < 0
			{
				alarm[0] = 1;
			
				yspeed += 0.1;
			}
			else
			{
				action++;
				alarm[0] = 60;
				if faster = true
					alarm[0] = 10;
				
				yspeed = 0;
				image_speed = 0;
				
				thruster = true;
			}
			break;
		
		case 4: //Rise back to start
			if y > ystart
			{
				yspeed = -1;
				if faster = true
					yspeed = -2;
				
				lights = "Up";
				
				if !audio_is_playing(snd_jets_hover) and place_meeting(x,y,obj_camera)
					scr_make_sound(snd_jets_hover,1,1,false);
			
				alarm[0] = 1;
			}
			else
			{
				action = 0;
				alarm[0] = 60;
				
				y = ystart;
				yspeed = 0;
				
				lights = "Nothing";
			}
			break;
	}
}