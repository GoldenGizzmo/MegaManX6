/// @description Insert description here
// You can write your code in this editor

if !instance_exists(obj_trigger)
{
	if rise = 0
	{
		rise++;
		alarm[0] = 120;
	
		shake = instance_create_depth(0,0,0,obj_shake);
		shake.intensity = 2;
		shake.length = 99999;
		shake.style = 1;
					
		scr_make_sound(snd_heatnix_rumble,1,1,false);
	}
	else if rise = 2
	{
		y -= rise_speed;
		if rise_speed < 1.5
			rise_speed += 0.005;
		
		image_speed = 2;
		
		
		if !audio_is_playing(snd_heatnix_rumble)
			scr_make_sound(snd_heatnix_rumble,1,1,false);
	}
}
