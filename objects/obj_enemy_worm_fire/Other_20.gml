/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x+11*image_xscale,y-27*image_yscale,"Projectiles",obj_bullet_default)
bullet.direction = point_direction(bullet.x,bullet.y,obj_player.x,obj_player.y);
bullet.image_angle = bullet.direction;
bullet.speed = 4;
bullet.damage = bullet_damage;
bullet.sprite_index = spr_bullet_fire;
bullet.explosion = spr_explosion_fire;
bullet.expiry = 30;
bullet.animation_loop = false;

bullet.villainy = 2;

effect = instance_create_layer(bullet.x,bullet.y,"Explosions",obj_explosion);
effect.sprite_index = spr_explosion_fire;

if shoot%4 = 0
	scr_make_sound(snd_fire_2,1,1,false);