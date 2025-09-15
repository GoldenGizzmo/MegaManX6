/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x+3*image_xscale,y+3,"Projectiles",obj_bullet_default)
bullet.direction = point_direction(x,y,obj_player.x,obj_player.y);
bullet.image_angle = bullet.direction;
bullet.speed = 3;
bullet.damage = bullet_damage;
bullet.sprite_index = spr_bullet_met;
bullet.explosion = spr_explosion_projectile;

bullet.villainy = 2;

scr_make_sound(snd_shoot_met,1,1,false);