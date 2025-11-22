/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x+11*image_xscale,y-27*image_yscale,"Projectiles",obj_bullet_default)
bullet.direction = point_direction(x+11*image_xscale,y-27*image_yscale,obj_player.x,obj_player.y);
bullet.speed = 4;
bullet.damage = bullet_damage;
bullet.sprite_index = spr_bullet_worm;
bullet.explosion = spr_explosion_projectile;

bullet.villainy = 2;

scr_make_sound(snd_worm_shoot,1,1,false);