/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.pause = true
	return;

if life > 0
{
	//Cool down
	if heat > 0
		heat -= 0.01;
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		scr_make_sound(snd_explosion_large,1,1,false);
		shake = instance_create_depth(0,0,0,obj_shake);
		
		with box
			instance_destroy();
		
		repeat(5)
		{
			var range = 40;
			var x_range = random_range(-range,range);
			var y_range = random_range(-range,range);
			instance_create_layer(x+x_range,y+y_range,"Explosions",obj_explosion);
		}
		
		for (var i = 0; i < 3; i++)
		{
			debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
			debris.sprite_index = spr_block_yanma_debris;
			debris.image_index = i;
		}
		
		death = 1;
	}
}