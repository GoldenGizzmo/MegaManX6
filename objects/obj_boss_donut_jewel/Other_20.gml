/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x+x_pos,y+y_pos,"Projectiles",obj_bullet_default)
bullet.direction = point_direction(x+x_pos,y+y_pos,obj_player.x,obj_player.y);
bullet.speed = 4.5;
bullet.damage = bullet_damage;
bullet.sprite_index = spr_bullet_donut;

bullet.explosion = spr_explosion_death;
bullet.explosion_sound = snd_explosion;

bullet.villainy = 2;
bullet.breakable = true;
bullet.despawn = false;

scr_make_sound(snd_shoot_nightmare,1,1,false);
