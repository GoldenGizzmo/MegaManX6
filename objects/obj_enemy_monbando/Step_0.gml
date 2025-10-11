/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	if state = "Blocking"
	{
		event_user(3); //Face player
		if animation_ended = true
		{
			image_index = -1;
			image_speed = 0;
		}
	}
	
	//Ready to explode
	if flickering > 0
	{
		flickering++;
		if flickering%2 = 0
		{
			if flicker = false
				flicker = true;
			else
				flicker = false;
		}
	}
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		scr_make_sound(snd_explosion,1,1,false);
		
		for (var i = 0; i < 4; i++)
		{
			debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
			debris.sprite_index = spr_enemy_monbando_debris;
			debris.image_index = i;
		}
		
		death = 1;
	}
}