/// @description Insert description here
// You can write your code in this editor

var offset_x = 10*image_xscale;
var offset_y = 0;
switch (image_index)
{
	case 1:
		offset_x = 0;
		offset_y = -13;
		break;
	case 4:
		offset_x = 0;
		offset_y = 13;
		break;
	
	case 2:
		offset_x = 10*image_xscale;
		offset_y = -10;
		break;
	case 3:
		offset_x = 10*image_xscale;
		offset_y = 10;
}


bullet = instance_create_layer(x+offset_x,y+offset_y-1,"Projectiles",obj_bullet_default)


bullet.speed = 2;
var offset = 0; //Up
switch (image_index)
{
	case 0: offset = -90; break; //Forward
	case 1: offset = 0; break; //Up
	case 4: offset = 180; break; //Down
	case 2: offset = -45; break; //Diagonal Up
	case 3: offset = -135; break; //Diagonal Down
}
bullet.direction += 90+(offset*image_xscale);
	
bullet.damage = bullet_damage;
bullet.villainy = 2;
bullet.sprite_index = spr_bullet_probe;
bullet.breakable = true;
	
bullet.explosion = spr_explosion_death;
bullet.explosion_sound = snd_explosion;

effect = instance_create_layer(bullet.x,bullet.y,"Explosions",obj_explosion);
effect.sprite_index = spr_effect_muzzle_flash;

scr_make_sound(snd_shoot_pew_2,1,1,false);