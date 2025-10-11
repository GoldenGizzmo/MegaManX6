/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	if xspeed > 0
		xspeed -= 0.02;
	else if xspeed < 0
		xspeed += 0.02;
		
	rotate -= xspeed*2;
	
	
	/*
	box.x = x-32;
	box.y = y-32;*/
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		scr_make_sound(snd_explosion,1,1,false);
		//instance_destroy(box);
		
		repeat(5)
		{
			var range = 35;
			var x_range = random_range(-range,range);
			var y_range = random_range(-range,range);
			instance_create_layer(x+x_range,y+y_range,"Explosions",obj_explosion);
		}
		
		for (var i = 0; i < 3; i++)
		{
			debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
			debris.sprite_index = spr_enemy_wheel_debris;
			debris.image_index = i;
		}
		
		death = 1;
	}
}