/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_default);
bullet.damage = bullet_damage;
bullet.direction = image_angle;
bullet.speed = 3.5;

bullet.villainy = 2;
bullet.breakable = true;

bullet.sprite_index = spr_bullet_yanma_boss;
bullet.explosion = spr_explosion_yanma_small;
bullet.explosion_angle = bullet.direction;

scr_make_sound(snd_yammark_shoot,1,1,false);