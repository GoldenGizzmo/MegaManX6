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
		scr_make_sound(snd_explosion,1,1,false);
		
		repeat(3)
		{
			var range = 30;
			var x_range = random_range(-range,range);
			var y_range = random_range(-range,range);
			instance_create_layer(x+x_range,y+y_range,"Explosions",obj_explosion);
		}
		for (var i = 0; i < 4; i++)
		{
			debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
			debris.sprite_index = spr_enemy_junk_debris;
			debris.image_index = i;
		}
		
		death = 1;
	}
}