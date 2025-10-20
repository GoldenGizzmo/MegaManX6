/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{

}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		scr_make_sound(snd_explosion_boss_final,1,1,false);
		
		repeat(8)
		{
			var range = 60;
			var x_range = random_range(-range,range);
			var y_range = random_range(-range,range);
			instance_create_layer(x+x_range,y+y_range,"Explosions",obj_explosion);
		}
		
		for (var i = 0; i < 6; i++)
		{
			debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
			debris.sprite_index = spr_boss_d1000_debris;
			debris.image_index = i;
		}
		
		death = 1;
	}
}