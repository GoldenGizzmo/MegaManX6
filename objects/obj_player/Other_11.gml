/// @description X-Buster Shooting

var shot_fired = false;

var wall_slide_reverse = 1;
if wall_slide = true
	wall_slide_reverse = -1;

var shootpos_x = 10*image_xscale*wall_slide_reverse;
var shootpos_y = -7;
if sprite_index = spr_player_x_dash_simple or sprite_index = spr_player_x_crouch
	shootpos_y = 0;

//Uncharged shots
if global.input_shoot_pressed
{
	var bullet_limit = 3;
	with obj_bullet_default
		if sprite_index = spr_bullet_player_lemon
			bullet_limit--;

	if bullet_limit > 0
	{
		bullet = instance_create_layer(x+shootpos_x,y+shootpos_y,"Projectiles",obj_bullet_default)
		bullet.image_xscale = image_xscale*wall_slide_reverse;
		bullet.speed = 8*bullet.image_xscale;
		bullet.sprite_index = spr_bullet_player_lemon;
		bullet.damage = 3;
		
		bullet.explosion_sound = snd_explosion_bullet;
		scr_make_sound(snd_shoot_small,1,1,false);
		
		shot_fired = true; 
	}
}

//Charge shots
if global.input_shoot_released
{
	if shooting_charge > shooting_charge_lvl_2
	{
		bullet = instance_create_layer(x+shootpos_x+(5*image_xscale*wall_slide_reverse),y+shootpos_y,"Projectiles",obj_bullet_charged)
		bullet.image_xscale = image_xscale*wall_slide_reverse;
		bullet.speed = 10*bullet.image_xscale;
		bullet.sprite_index = spr_bullet_player_charge_2
		bullet.explosion = spr_explosion_player_charge;
		bullet.damage = 15;
		
		bullet.explosion_sound = snd_explosion_bullet;
		scr_make_sound(snd_shoot_large,1,1,false);
		scr_player_voicelines("Charge Shot");
		
		shot_fired = true;
		shooting_lock = true;
		alarm[0] = 15;
	}
	else if shooting_charge > shooting_charge_lvl_1
	{
		bullet = instance_create_layer(x+shootpos_x,y+shootpos_y,"Projectiles",obj_bullet_charged)
		bullet.image_xscale = image_xscale*wall_slide_reverse;
		bullet.speed = 8*bullet.image_xscale;
		bullet.sprite_index = spr_bullet_player_charge_1
		bullet.damage = 7;
		
		bullet.explosion_sound = snd_explosion_bullet;
		scr_make_sound(snd_shoot_mid,1,1,false);
		
		shot_fired = true;
		shooting_lock = true;
		alarm[0] = 15;
	}
}

//Shooting will interrupt charging
if shot_fired = true
{
	shooting_charge_flicker = false;
	shooting_charge = 0;
	
	shooting = 30;
	/*
	if sprite_index = spr_player_x_idle_shoot
		image_index = 0;
	*/
	
	//Fire yanma option drones
	with obj_player_yanma
		event_user(10);
}













