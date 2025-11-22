/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_default);
bullet.damage = bullet_damage_2;
bullet.expiry = 1;
bullet.villainy = 2;

bullet.explosive = true
bullet.explosion = spr_explosion_large;

scr_make_sound(snd_fire,1,0.5,false);