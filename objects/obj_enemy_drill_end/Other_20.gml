/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x,y+15,"Projectiles",obj_bullet_default)
bullet.speed = random_range(3,4);
bullet.gravity = 0.1; 
bullet.image_xscale = choose(-1,1);

//Less random rubble
bullet.direction = 90+random_range(0,30)*shoot_direction;
shoot_direction *= -1;
	
bullet.damage = bullet_damage;
bullet.villainy = 2;
bullet.sprite_index = spr_bullet_rubble;
bullet.breakable = true;
	
bullet.explosion = spr_explosion_death;
bullet.explosion_sound = snd_explosion;