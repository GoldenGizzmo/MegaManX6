/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.pause_screen = true
{
	audio_stop_sound(snd_dozer);
	audio_stop_sound(snd_dozer_fast);
}

//Can be paused
if global.pause = true
	return;

if life > 0
{
	if shield_life > 0
	{
		xspeed = 0.5*image_xscale;
		
		//Play motor sound
		if !audio_is_playing(snd_dozer)
			scr_make_sound(snd_dozer,0.5,1,true);
	}
	else
	{
		if shield_death = false
		{
			shield_death = true;
			
			//Stop slow motor sound
			audio_stop_sound(snd_dozer);
			scr_make_sound(snd_explosion,1,1,false);
			
			repeat(5)
			{
				var range = 30;
				var x_range = random_range(-range,range);
				var y_range = random_range(-range,range);
				instance_create_layer(x+(57*image_xscale)+x_range,y-30+y_range,"Explosions",obj_explosion);
			}
			for (var i = 0; i < 6; i++)
			{
				debris = instance_create_layer(x+(57*image_xscale),y-30,"Explosions",obj_particle_debris)
				debris.sprite_index = spr_enemy_dozer_shield_debris;
				debris.image_index = i;
			}
			
			//Stay still
			xspeed = 0;
			image_speed = 0;
			alarm[0] = 60;
		}
	
		sprite_index = spr_enemy_dozer_shieldless;
		
		//If moving fast
		if image_speed > 0
			if !audio_is_playing(snd_dozer_fast)
				scr_make_sound(snd_dozer_fast,0.5,1,true);
	}
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		scr_make_sound(snd_explosion,1,1,false);
		audio_stop_sound(snd_dozer);
		audio_stop_sound(snd_dozer_fast);
		
		repeat(3)
		{
			var range = 30;
			var x_range = random_range(-range,range);
			var y_range = random_range(-range,range);
			instance_create_layer(x+x_range,y+y_range,"Explosions",obj_explosion);
		}
		for (var i = 0; i < 6; i++)
		{
			debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
			debris.sprite_index = spr_enemy_dozer_debris;
			debris.image_index = i;
		}
		
		death = 1;
	}
}