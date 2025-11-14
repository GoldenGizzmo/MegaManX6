/// @description Insert description here
// You can write your code in this editor

scr_make_sound(snd_explosion_large,1,1,false);
						
//Particle effects
instance_create_layer(x,y,"Explosions",obj_explosion);
repeat(3)
{
	var range = 60;
	var x_range = random_range(-range,range);
	var y_range = random_range(-range,range);
	instance_create_layer(x+x_range,y+y_range,"Explosions",obj_explosion);
}
for (var i = 0; i < 9; i++)
{
	debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
	debris.sprite_index = spr_port_x_bike_debris;
	debris.image_index = i;
}
					
shake = instance_create_depth(0,0,0,obj_shake);
shake.length = 60;