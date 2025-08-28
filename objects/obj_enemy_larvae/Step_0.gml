/// @description Insert description here
// You can write your code in this editor

event_inherited();

if life > 0
{
	scr_collision();
	if airborne = false //Turn at wall and ledges
	{
		event_user(0);
		event_user(1);
	}
	
	//Check if the main grasshopper is alive
	if owner != 0
	{
		if instance_exists(owner)
		{
			if owner.life <= 1
				life = 0;
		}
		else
			life = 0
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
		for (i = 4; i < 6; i++)
		{
			debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
			debris.sprite_index = spr_enemy_grasshopper_debris;
			debris.image_index = i;
		}	
		death = 1;
	}
}