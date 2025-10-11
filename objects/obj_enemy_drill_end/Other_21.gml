/// @description Insert description here
// You can write your code in this editor

particle = instance_create_layer(x,y+15,"Projectiles",obj_particle_rubble)
particle.speed = random_range(3,4);
particle.gravity = 0.1; 
particle.direction = 90+random_range(-30,30);
particle.image_xscale = choose(-1,1);
	
particle.image_index = irandom(1);