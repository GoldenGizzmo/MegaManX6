/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.pause = true
	return;

if life > 0
{
	
	if bounce_height > 0
	{
		rotate -= 10;
		if airborne = false
		{
			yspeed = -bounce_height;
			scr_make_sound(snd_turtloid_blades,0.5,1,false);
		}
	}
	else
	{
		rotate -= 15;
		if airborne = false and global.animate%10 = 0
		{
			effect = instance_create_layer(x,y+27,"Explosions",obj_explosion);
			effect.sprite_index = spr_effect_dash_trail;
			effect.image_speed = 2;
		}
		//if !audio_is_playing(snd_turtloid_buzzsaw)
		//	scr_make_sound(snd_turtloid_buzzsaw,0.5,1,false);
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
		
		for (var i = 0; i < 5; i++)
		{
			debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
			debris.sprite_index = spr_enemy_spiky_debris;
			debris.image_index = i;
		}
	}
}