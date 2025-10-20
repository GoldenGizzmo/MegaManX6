/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x+(57*image_xscale),y-8,"Projectiles",obj_bullet_pillar)
bullet.speed = 2*image_xscale;
bullet.image_xscale = -image_xscale;
bullet.gravity = 0.1;
	
bullet.damage = bullet_damage;
bullet.villainy = 2;


scr_make_sound(snd_d1000_shoot,1,1,false);