/// @description Insert description here
// You can write your code in this editor

if shoot_delay = 0
{
	
	
	bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_default);
	bullet.damage = bullet_damage;
	bullet.direction = image_angle;
	bullet.speed = 6*image_xscale;;

	bullet.sprite_index = spr_bullet_yanma_boss;
	bullet.explosion = spr_explosion_yanma_small;

	scr_make_sound(snd_yammark_shoot,1,1,false);
	
	shoot_delay = shoot_delay_max;
}