/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x-15,y+5,"Projectiles",obj_bullet_default);
bullet.damage = bullet_damage;
bullet.villainy = 2;
bullet.speed = 8;
bullet.direction = point_direction(x-15,y+5,obj_player.x,obj_player.y)

bullet.piercing = true;
bullet.phasing = true;				
bullet.sprite_index = spr_bullet_nightmare_huge;


scr_make_sound(snd_shoot_powerful,1,1,false);
