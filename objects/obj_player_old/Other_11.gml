/// @description Insert description here
// You can write your code in this editor

var shootpos_x = 10*image_xscale;
var shootpos_y = -10;
if sprite_index = spr_player_x_dash_simple or sprite_index = spr_player_x_crouch
	shootpos_y = 0;

if global.input_shoot_pressed
{
	var check = 0;
	with obj_bullet_default
		if sprite_index = spr_bullet_player_lemon
			check++;

	if check < 3
	{
		bullet = instance_create_layer(x+shootpos_x,y+shootpos_y,"Projectiles",obj_bullet_default)
		bullet.image_xscale = image_xscale;
		bullet.speed = 8*bullet.image_xscale;
		bullet.sprite_index = spr_bullet_player_lemon;
		bullet.damage = 3;
		
		shooting = true;
		alarm[6] = 30; 
	}
}

if global.input_shoot_released
{
	if shooting_charge > shooting_charge_lvl_2
	{
		bullet = instance_create_layer(x+shootpos_x,y+shootpos_y,"Projectiles",obj_bullet_charged)
		bullet.image_xscale = image_xscale;
		bullet.speed = 10*bullet.image_xscale;
		bullet.sprite_index = spr_bullet_player_charge_2
		bullet.explosion = spr_explosion_player_charge;
		bullet.damage = 15;
		
		shooting_lock = true;
		alarm[0] = 15;
	}
	else if shooting_charge > shooting_charge_lvl_1
	{
		bullet = instance_create_layer(x+shootpos_x,y+shootpos_y,"Projectiles",obj_bullet_default)
		bullet.image_xscale = image_xscale;
		bullet.speed = 8*bullet.image_xscale;
		bullet.sprite_index = spr_bullet_player_charge_1
		bullet.damage = 7;
		
		shooting_lock = true;
		alarm[0] = 15;
	}
}














