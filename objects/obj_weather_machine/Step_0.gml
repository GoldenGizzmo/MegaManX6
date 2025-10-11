/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	//Get shield strength
	var shielded = 0;
	var shielded_self = id;
	with obj_enemy_nightmare_weather
		if shielding = shielded_self
			shielded++;

	shield_strength = shielded;
	
	if shield_strength > 0
	{
		shield_fade = 0.7+dsin((current_time)*0.2)*0.5;
		invul = true;
	}
	else
	{
		invul = false;
		if shield_fade > 0
			shield_fade -= 0.01;
	}
	 
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		scr_make_sound(snd_explosion,1,1,false);
		death = 1;
		
		for (var i = 0; i < 4; i++)
		{
			debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
			debris.sprite_index = spr_weather_machine_debris;
			debris.image_index = i;
		}
		
		ruin = instance_create_layer(x,y,"Instances_Lower",obj_explosion);
		ruin.image_speed = 0;
		ruin.sprite_index = spr_weather_machine_destroyed;
		
		//End rain
		with obj_acid_rain
			rain_active = false;
	}
}