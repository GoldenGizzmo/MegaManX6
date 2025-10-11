/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x,y+20,"Projectiles",obj_bullet_default)
bullet.speed = 1;
bullet.gravity = 0.1; 
bullet.direction = 270;
bullet.image_xscale = image_xscale;
	
bullet.damage = bullet_damage;
bullet.villainy = 2;
bullet.sprite_index = spr_bullet_batbomb;
bullet.breakable = true;
	
bullet.explosion = spr_explosion_death;
bullet.explosion_sound = snd_explosion;