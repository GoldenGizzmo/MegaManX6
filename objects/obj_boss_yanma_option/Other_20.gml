/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_missile);
bullet.damage = bullet_damage_2;
bullet.direction = 90+(90*image_xscale)+random_range(-30,30);
bullet.image_angle = bullet.direction;
bullet.target = obj_player;
bullet.target_offset = 20;
bullet.speed = 4;

bullet.villainy = 2;

scr_make_sound(snd_yammark_shoot,1,1,false);