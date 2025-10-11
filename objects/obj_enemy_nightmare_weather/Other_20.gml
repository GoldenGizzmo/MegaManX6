/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x+4*image_xscale,y,"Projectiles",obj_bullet_homing)
var shoot_direction = 90
if shoot = 1
	shoot_direction = 135;
else if shoot = 2
	shoot_direction = 45;
bullet.direction = 90-(shoot_direction*image_xscale);
bullet.speed = 0.5;
bullet.damage = bullet_damage;
bullet.sprite_index = spr_bullet_nightmare_big;

bullet.villainy = 2;
bullet.phasing = true;
bullet.piercing = true;

bullet.target = obj_player;
bullet.expiry = 5*60;

scr_make_sound(snd_shoot_nightmare,1,0.5,false);











