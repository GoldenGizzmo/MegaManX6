/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_default)
bullet.direction = direction-random_range(-15,15);
bullet.image_angle = bullet.direction;

bullet.speed = 5;
bullet.sprite_index = spr_bullet_magmablade_spawn;
bullet.animation_next = spr_bullet_magmablade;
bullet.explosion = spr_bullet_magmablade_end;
bullet.explosion_angle = true;

bullet.damage = 6;		
bullet.villainy = 2;

scr_make_sound(snd_shoot_fire_2,1,1,false);