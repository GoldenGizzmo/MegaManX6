/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x+8*image_xscale,y-13,"Projectiles",obj_bullet_default)
bullet.speed = 2*image_xscale;
bullet.damage = bullet_damage;
bullet.villainy = 2;
bullet.breakable = true;

bullet.sprite_index = spr_bullet_junk;
bullet.explosion = spr_explosion_death;
bullet.explosion_sound = snd_explosion;

scr_make_sound(snd_fish_bite,1,1,false);