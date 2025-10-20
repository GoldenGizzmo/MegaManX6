/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x,y-10,"Projectiles",obj_bullet_pillar)
bullet.image_xscale = image_xscale
bullet.direction = 90+(20*image_xscale);
bullet.speed = 5;
bullet.gravity = 0.1;
	
bullet.damage = damage;
bullet.villainy = villainy;
bullet.hop = hop+1;

scr_make_sound(snd_d1000_shoot,1,1,false);