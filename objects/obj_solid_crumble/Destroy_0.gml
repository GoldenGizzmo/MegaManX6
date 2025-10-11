/// @description Insert description here
// You can write your code in this editor

//Death event
scr_make_sound(snd_explosion,1,1,false);
		
repeat(5)
{
	var range = 35;
	var x_range = random_range(-range,range);
	var y_range = random_range(-range,range);
	instance_create_layer(x+32+x_range,y+24+y_range,"Explosions",obj_explosion);
}
		
for (var i = 0; i < 6; i++)
{
	debris = instance_create_layer(x+32,y+24,"Explosions",obj_particle_debris)
	if i < 4
	{
		debris.sprite_index = spr_effect_rubble;
		debris.image_index = irandom(1);
	}
	else
		debris.sprite_index = spr_bullet_rubble;
}