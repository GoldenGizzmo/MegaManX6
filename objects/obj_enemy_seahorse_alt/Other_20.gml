/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x+11*image_xscale,y-2,"Projectiles",obj_bullet_default)
bullet.direction = point_direction(x,y,obj_player.x,obj_player.y);
//if bullet.direction > 340 and bullet.direction < 200
//	bullet.direction = 90+(110*-image_xscale);

bullet.speed = 4;
bullet.damage = bullet_damage;
bullet.sprite_index = spr_bullet_seahorse_alt;
bullet.explosion = spr_explosion_projectile;

bullet.villainy = 2;

scr_make_sound(snd_seahorse,1,1,false);