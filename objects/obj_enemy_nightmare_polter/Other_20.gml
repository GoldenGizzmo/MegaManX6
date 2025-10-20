/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x+(6*image_xscale),y,"Projectiles",obj_bullet_default)
bullet.speed = 2;
bullet.direction = point_direction(x,y,obj_player.x,obj_player.y);
	
bullet.damage = bullet_damage;
bullet.villainy = 2;
bullet.sprite_index = spr_bullet_nightmare_big;
bullet.phasing = true;

scr_make_sound(snd_polter_shoot,1,1,false);