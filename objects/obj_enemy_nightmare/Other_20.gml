/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x+4*image_xscale,y,"Projectiles",obj_bullet_default)
bullet.direction = point_direction(x,y,obj_player.x,obj_player.y);
bullet.speed = 8;
bullet.damage = bullet_damage;
bullet.sprite_index = spr_bullet_nightmare;

bullet.villainy = 2;
bullet.piercing = true;
bullet.phasing = true;

scr_make_sound(snd_shoot_nightmare,1,1,false);











