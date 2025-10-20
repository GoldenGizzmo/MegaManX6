/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.pause = true
	return;



//Being openning appearance
if state = "Appearance" and action = 0
{
	action++;
	alarm[0] = 1;
}

if life > 0
{	
	if activated = true
	{
		//Play motor sound
		if !audio_is_playing(snd_dozer)
			scr_make_sound(snd_dozer,0.2,1,false);
			
		
	}
	
	//If nightmare is scared away, deactivate and fall to the ground
	if !instance_exists(obj_enemy_nightmare_polter) and activated = true
	{
		activated = false;
		state = "Falling";
		audio_stop_sound(snd_dozer);
		
		action = 0;
		alarm[0] = 1;
		
		shoot = 0;
		alarm[1] = -1;
		alarm[2] = -1;
	}
}
else
{
	//sprite_index = spr_boss_yammark_death;
	image_speed = 0;
	
	//Death scream
	if death = -2
	{
		death--;
		scr_make_sound(snd_d1000_losepower,1,1,false);
		
		//Remove nightmare
		with obj_enemy_nightmare_polter
			fade_away = 1;
	}
}