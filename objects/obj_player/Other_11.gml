/// @description X-Buster Shooting

shot_fired = false;

	
event_user(6); //Shooting pos


//Uncharged shots
if global.input_shoot_pressed
{
	bullet_limit = 3;
	
	//Part: Rapid Fire
	if ds_list_find_index(global.parts_equipped,1) != -1 {scr_get_part_effect(1,"X-Buster");}	
	
	with obj_bullet_default
		if sprite_index = spr_bullet_player_lemon or sprite_index = spr_bullet_bike
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
			//Part: Phase Shot
			if ds_list_find_index(global.parts_equipped,7) != -1 {scr_get_part_effect(7,false);}
		}
		
		bullet.explosion_sound = snd_explosion_bullet;
		scr_make_sound(snd_shoot_small,1,1,false);
		
		//Effect
		effect = instance_create_layer(bullet.x,bullet.y,"Explosions",obj_particle_muzzle_player);
		effect.sprite_index = spr_effect_muzzle_x;
		effect.x_pos = shootpos_x;
		effect.y_pos = shootpos_y;
		effect.image_xscale = image_xscale*wall_slide_reverse;
		effect.image_alpha = bullet.image_alpha;
		with effect
		{
			//Part: Rapid Fire
			if ds_list_find_index(global.parts_equipped,1) != -1 {scr_get_part_effect(1,"Set Colour");}
		}
		
		//Ride Chaser version
		if bike = true
		{
			bullet.phasing = true;
			bullet.image_xscale = 1;
			bullet.sprite_index = spr_bullet_bike;
			if image_xscale = -1
				bullet.speed *= -1;
			
			effect.image_xscale = 1;
			effect.sprite_index = spr_effect_muzzle_bike;
		}
		
		//Part: V Shot
		if ds_list_find_index(global.parts_equipped,4) != -1 {scr_get_part_effect(4,0);}	
		
		shot_fired = true; 
	}
}

//Charge shots
if global.input_shoot_released
{
	shooting_charged = false;
	if shooting_charge > shooting_charge_lvl_2
	{
		switch (global.x_armour_arm)
		{
			case "Blade Arm":
				bullet = instance_create_layer(x+shootpos_x+(5*image_xscale*wall_slide_reverse),y+shootpos_y,"Projectiles",obj_bullet_bladeshot)
				bullet.image_xscale = image_xscale*wall_slide_reverse;
				bullet.speed = 10*bullet.image_xscale;
				bullet.sprite_index = spr_bullet_blade_spawn;
				bullet.animation_next = spr_bullet_blade;
				
				bullet.explosion = spr_explosion_player_blade;
				bullet.damage = 16;
		
				bullet.explosion_sound = snd_explosion_bullet;
				scr_make_sound(snd_shoot_large,1,1,false);
				scr_player_voicelines("Charge Shot");
		
				with bullet
				{
					//Part: Phase Shot
					if ds_list_find_index(global.parts_equipped,7) != -1 {scr_get_part_effect(7,false);}
				}
		
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
					effect.image_alpha = bullet.image_alpha;
				}
				break;
		
			default:
				bullet = instance_create_layer(x+shootpos_x+(5*image_xscale*wall_slide_reverse),y+shootpos_y,"Projectiles",obj_bullet_charged)
				bullet.image_xscale = image_xscale*wall_slide_reverse;
				bullet.speed = 10*bullet.image_xscale;
				bullet.sprite_index = spr_bullet_player_charge_2_spawn;
				bullet.animation_next = spr_bullet_player_charge_2;
				
				bullet.explosion = spr_explosion_player_charge;
				bullet.damage = 15;
		
				bullet.explosion_sound = snd_explosion_bullet;
				scr_make_sound(snd_shoot_large,1,1,false);
				scr_player_voicelines("Charge Shot");
		
				with bullet
				{
					//Part: Phase Shot
					if ds_list_find_index(global.parts_equipped,7) != -1 {scr_get_part_effect(7,false);}
				}
		
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
					effect.image_alpha = bullet.image_alpha;
				}
				break;
		}
		
		shot_fired = true;
		shooting_charged = true;
		shooting_charged = shooting_charge_level.two;
		shooting_lock = true;
		alarm[0] = 15;
		
		//Ride Chaser version
		if bike = true
		{
			bullet.phasing = true;
			bullet.image_xscale = 1;
			bullet.sprite_index = spr_bullet_bike_charge_spawn;
			bullet.animation_next = spr_bullet_bike_charge;
			if image_xscale = -1
				bullet.speed *= -1;
			
			effect.image_xscale = 1;
		}
	}
	else if shooting_charge > shooting_charge_lvl_1 and bike = false
	{
		bullet = instance_create_layer(x+shootpos_x,y+shootpos_y,"Projectiles",obj_bullet_charged)
		bullet.image_xscale = image_xscale*wall_slide_reverse;
		bullet.speed = 8*bullet.image_xscale;
		bullet.sprite_index = spr_bullet_player_charge_1
		
		bullet.damage = 7;
		
		bullet.explosion_sound = snd_explosion_bullet;
		scr_make_sound(snd_shoot_mid,1,1,false);
		
		with bullet
		{
			//Part: Phase Shot
			if ds_list_find_index(global.parts_equipped,7) != -1 {scr_get_part_effect(7,false);}
		}
		
		//Effect
		effect = instance_create_layer(bullet.x,bullet.y,"Explosions",obj_particle_muzzle_player);
		effect.sprite_index = spr_effect_muzzle_x_charge_1;
		effect.x_pos = shootpos_x;
		effect.y_pos = shootpos_y;
		effect.image_xscale = image_xscale*wall_slide_reverse;
		effect.image_alpha = bullet.image_alpha;
		
		shot_fired = true;
		shooting_charged = shooting_charge_level.one;
		shooting_lock = true;
		alarm[0] = 15;
	}
}

//Shooting will interrupt charging
if shot_fired = true
{
	shooting_charge_flicker = false;
	shooting_charge = 0;
	
	shooting = 15;
	/*
	if sprite_index = spr_player_x_idle_shoot
		image_index = 0;
	*/
	
	//Fire yanma option drones
	with obj_player_yanma
		event_user(10);
}













