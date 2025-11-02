/// @description X-Buster Shooting

var wall_slide_reverse = 1;
if wall_slide = true
	wall_slide_reverse = -1;

var shootpos_x = 20*image_xscale*wall_slide_reverse;
var shootpos_y = -7;
if airborne = true
	shootpos_y = -9;
else
{
	if crouch = true or dash = true
	{
		shootpos_y = 5;
		shootpos_x = 25*image_xscale*wall_slide_reverse;
		if dash = true
			shootpos_x = 32*image_xscale*wall_slide_reverse;
	}
	else
	{
		if xspeed != 0
		{
			shootpos_y = -8;
			shootpos_x = 27*image_xscale*wall_slide_reverse;
		}
	}
}

//Uncharged shots
if global.input_shoot_pressed
{
	bullet_limit = 3;
	
	//Part: Rapid Fire
	if ds_list_find_index(global.parts_equipped,1) != -1 {scr_get_part_effect(1,"X-Buster");}	
	
	with obj_bullet_default
		if sprite_index = spr_bullet_player_lemon
			obj_player.bullet_limit--;

	if bullet_limit > 0
	{
		bullet = instance_create_layer(x+shootpos_x,y+shootpos_y,"Projectiles",obj_bullet_default)
		bullet.image_xscale = image_xscale*wall_slide_reverse;
		bullet.speed = 8*bullet.image_xscale;
		bullet.sprite_index = spr_bullet_player_lemon;
		bullet.damage = 3;
		with bullet
		{
			//Part: Rapid Fire
			if ds_list_find_index(global.parts_equipped,1) != -1 {scr_get_part_effect(1,"Set Colour");}
		}
		
		bullet.explosion_sound = snd_explosion_bullet;
		scr_make_sound(snd_shoot_small,1,1,false);
		
		//Effect
		effect = instance_create_layer(bullet.x,bullet.y,"Explosions",obj_particle_muzzle_player);
		effect.sprite_index = spr_effect_muzzle_x;
		effect.x_pos = shootpos_x;
		effect.y_pos = shootpos_y;
		effect.image_xscale = image_xscale*wall_slide_reverse;
		with effect
		{
			//Part: Rapid Fire
			if ds_list_find_index(global.parts_equipped,1) != -1 {scr_get_part_effect(1,"Set Colour");}
		}
		
		//Part: V Shot
		if ds_list_find_index(global.parts_equipped,4) != -1 {scr_get_part_effect(4,0);}	
		
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
		bullet.sprite_index = spr_bullet_player_charge_2_spawn
		bullet.explosion = spr_explosion_player_charge;
		bullet.damage = 15;
		
		bullet.explosion_sound = snd_explosion_bullet;
		scr_make_sound(snd_shoot_large,1,1,false);
		scr_player_voicelines("Charge Shot");
		
		//Effect
		for (var i = 0; i < 2; i++)
		{
			effect = instance_create_layer(bullet.x,bullet.y,"Explosions",obj_particle_muzzle_player);
			effect.sprite_index = spr_effect_muzzle_x_charge_2;
			if i = 0 //Behind the player
			{
				effect.sprite_index = spr_effect_muzzle_x_charge_2_back;
				effect.depth = obj_player.depth+10;
			}
			effect.x_pos = shootpos_x;
			effect.y_pos = shootpos_y;
			effect.image_xscale = image_xscale*wall_slide_reverse;
		}
		
		shot_fired = true;
		shooting_charged = shooting_charge_level.two;
		shooting_lock = true;
		alarm[0] = 30;
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
		
		//Effect
		effect = instance_create_layer(bullet.x,bullet.y,"Explosions",obj_particle_muzzle_player);
		effect.sprite_index = spr_effect_muzzle_x_charge_1;
		effect.x_pos = shootpos_x;
		effect.y_pos = shootpos_y;
		effect.image_xscale = image_xscale*wall_slide_reverse;
		
		shooting_charged = shooting_charge_level.one;
		
		shot_fired = true;
		shooting_lock = true;
		alarm[0] = 30;
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













