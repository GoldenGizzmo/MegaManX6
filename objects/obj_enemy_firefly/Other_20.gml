/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_depth(x,ystart+10,depth+1,obj_bullet_default)
bullet.direction = 270;
bullet.image_angle = bullet.direction;
bullet.speed = 5;
bullet.damage = bullet_damage;
bullet.sprite_index = spr_bullet_firefly;
bullet.explosion = spr_explosion_firefly;

bullet.villainy = 2;

scr_make_sound(snd_firefly,1,1,false);


