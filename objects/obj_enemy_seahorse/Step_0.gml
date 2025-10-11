/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Can be paused
if global.pause = true
	return;

if life > 0
{
	//If underwater
	var water_check = false;
	with instance_place(x,y,obj_water) //Check if fully submerged
		water_check = true;
	
	if yspeed != 0 or speed != 0
	{
		//Splash when entering and exiting water
		if underwater = false and water_check = true
		{		
			underwater = true;
			with instance_place(x,y,obj_water)
			{
				effect = instance_create_depth(other.x,y,depth+1,obj_explosion);
				effect.sprite_index = spr_water_splash;
				
				scr_make_sound(snd_splash,1,1,false);
			}
		}
		else if underwater = true and water_check = false
		{
			underwater = false;
			with instance_place(x,y+10,obj_water)
			{
				effect = instance_create_depth(other.x,y,depth+1,obj_explosion);
				effect.sprite_index = spr_water_splash;
				
				scr_make_sound(snd_splash,1,1,false);
			}
		}
	}	
	
	//Spin around
	if curled = true
		image_angle -= 20*image_xscale;
	else
		image_angle = 0;
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
			debris.sprite_index = spr_enemy_seahorse_debris;
			if object_index = obj_enemy_seahorse_alt
				debris.sprite_index = spr_enemy_seahorse_debris_alt;
				
			debris.image_index = i;
		}
	}
}
