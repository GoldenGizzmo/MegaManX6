/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x-3*image_xscale,y-16,"Projectiles",obj_bullet_seahorse)
bullet.direction = 90;
bullet.speed = 4;
bullet.damage = bullet_damage;
bullet.sprite_index = spr_bullet_seahorse;
bullet.explosion = spr_explosion_projectile;

bullet.villainy = 2;
bullet.target = obj_player;

scr_make_sound(snd_seahorse,1,1,false);