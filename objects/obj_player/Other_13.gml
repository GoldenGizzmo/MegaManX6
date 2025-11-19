/// @description Special Weapons / X-Saber

shot_fired = false;

//Check if not using any of these moves
var is_saber = false;
var saber_check = false
if sprite_index != spr_port_x_saber and sprite_index != spr_port_x_saber_jump and sprite_index != spr_port_x_saber_walljump
	saber_check = true

event_user(6); //Shooting pos

switch (global.weapon[global.weapon_choice].type)
{
	case "X-Saber":
		if global.input_special_pressed and saber_check = true
		{
			bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_saber)
			bullet.image_xscale = image_xscale;
			bullet.melee_damage = 4;
			bullet.melee_frames = 6;
			with bullet
			{
				//Part: Saber Plus
				if ds_list_find_index(global.parts_equipped,3) != -1 {scr_get_part_effect(3,false);}	
			}
			
			scr_make_sound(snd_shoot_saber_x,1,1,false);
			scr_player_voicelines("Weapon");

			attack_action = attack_actions.x_saber
			if global.x_armour_arm = "Blade Arm"
				image_speed = 1.25;

			if wall_slide = true
			{
				bullet.sprite_index = spr_bullet_x_saber_wall;
			}
			else if airborne = false
			{
				attack_priority = 1; //Can be dash cancelled or damaged out of it
				bullet.sprite_index = spr_bullet_x_saber;
				
				xspeed = 0;
				dash = false;	
			}
			else
			{
				wall_jump = false; //Funny X-Saber wall scaling tech
				bullet.sprite_index = spr_bullet_x_saber_jump;
			}
			
			//image_index = 0;
			shot_fired = true;
			is_saber = true;
		}
		break;
		
	case "Yanma Option":
		if global.input_special_pressed and global.weapon[global.weapon_choice].ammo >= global.weapon[global.weapon_choice].ammo_usage
		{
			var count = instance_number(obj_player_yanma)+1
			if count > 6
				count = 6;
			if count < 3
				count = 3;
	
			//Removes existing
			instance_destroy(obj_player_yanma,false);
		
			//Spawn drones
			for (var a = 0; a < count; a++)
			{
				spawn = instance_create_depth(x,y,depth-1,obj_player_yanma);
				spawn.orbit_angle = 0+((360/count)*a);
				spawn.orbit = 0;
				spawn.orbit_speed = 3;
				spawn.orbit_grow = 30;
				spawn.target = self;
	
				//Changeable stats
				spawn.life = 2;
				spawn.bullet_damage = 4;
			}
			
			shot_fired = true;
			attack_action = attack_actions.yanma;
			global.weapon[global.weapon_choice].ammo -= global.weapon[global.weapon_choice].ammo_usage;

			scr_make_sound(snd_yammark_reinforcement,1,1,false);
			effect = instance_create_layer(x,y,"Explosions",obj_particle_reinforcement);
			effect.follow = self;
		}
		break;
	
	case "Meteor Rain":
		if global.input_special_pressed and global.weapon[global.weapon_choice].ammo >= global.weapon[global.weapon_choice].ammo_usage
		{
			bullet_limit_special = 1;
			//Part: Rapid Fire
			if ds_list_find_index(global.parts_equipped,1) != -1 {scr_get_part_effect(1,"Meteor Rain");}	
			with obj_bullet_meteor_rain
				if villainy = 0
					obj_player.bullet_limit_special--;

			if bullet_limit_special > 0
			{
				bullet = instance_create_layer(x+shootpos_x,y+shootpos_y,"Projectiles",obj_bullet_meteor_rain)
				bullet.damage = 3;
				bullet.direction = 90-(90*image_xscale*wall_slide_reverse);
				if global.input_up
					bullet.direction = 90;
				else if global.input_down
					bullet.rise_turnspeed = 3;
				
				scr_make_sound(snd_shoot_meteorrain,1,1,false);
				bullet.special = true;
						
				shot_fired = true;
				attack_action = attack_actions.rain;
				global.weapon[global.weapon_choice].ammo -= global.weapon[global.weapon_choice].ammo_usage;
			}
		}
		break;
		
	case "Magma Blade":
		if global.input_special_pressed and saber_check = true and global.weapon[global.weapon_choice].ammo >= global.weapon[global.weapon_choice].ammo_usage
		{
			bullet_limit_special = 2;
			//Part: Rapid Fire
			if ds_list_find_index(global.parts_equipped,1) != -1 {scr_get_part_effect(1,"Magma Blade");}	
			with obj_bullet_default
				if villainy = 0 and (sprite_index = spr_bullet_magmablade or sprite_index = spr_bullet_magmablade_spawn)
					obj_player.bullet_limit_special--;

			if bullet_limit_special > 0
			{
				bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_saber)
				bullet.image_xscale = image_xscale;
				bullet.melee_damage = 6; //Extra damage
				bullet.melee_frames = 6;
				bullet.special = true;
			
				
				scr_player_voicelines("Weapon");
			
				attack_action = attack_actions.x_saber;
			
				//No moving all falling while swinging the blade
				if airborne = true and wall_slide = false
				{
					attack_priority = 3; 
					xspeed = 0;
					yspeed = 0;
					weight = 0;
				}

				if wall_slide = true
				{
					bullet.sprite_index = spr_bullet_x_saber_fire_wall;
				}
				else if airborne = false
				{
					attack_priority = 1; //Can be dash cancelled or damaged out of it
					bullet.sprite_index = spr_bullet_x_saber_fire;
				
					xspeed = 0;
					dash = false;	
				}
				else
				{
					wall_jump = false; //Funny X-Saber wall scaling tech
					bullet.sprite_index = spr_bullet_x_saber_fire_jump;
				}
				bullet.image_speed = 0.75;
				
				//Visual effect
				bullet.palette_sprite = spr_bullet_saber_fire_palette;
				if underwater = true
				{
					bullet.palette = 1;
					bullet.image_alpha = 0.65;
					
					scr_make_sound(snd_shoot_magmablade,1,0.5,false);
				}
				else
					scr_make_sound(snd_shoot_magmablade,1,1,false);
			
				global.weapon[global.weapon_choice].ammo -= global.weapon[global.weapon_choice].ammo_usage;
				shot_fired = true;
			}
		}
		break;
	
	case "Ray Arrow":
		if global.input_special_pressed and global.weapon[global.weapon_choice].ammo >= global.weapon[global.weapon_choice].ammo_usage
		{
			bullet_limit_special = 2;
			//Part: Rapid Fire
			if ds_list_find_index(global.parts_equipped,1) != -1 {scr_get_part_effect(1,"Ray Arrow");}
			with obj_bullet_default
				if sprite_index = spr_bullet_rayarrow
					obj_player.bullet_limit_special--;

			if bullet_limit_special > 0
			{
				bullet = instance_create_layer(x+shootpos_x,y+shootpos_y,"Projectiles",obj_bullet_default)
				bullet.image_xscale = image_xscale*wall_slide_reverse;
				bullet.speed = 8*bullet.image_xscale;
				bullet.sprite_index = spr_bullet_rayarrow
				bullet.damage = 6;
						
				shot_fired = true;
				global.weapon[global.weapon_choice].ammo -= global.weapon[global.weapon_choice].ammo_usage;
			}
		}
		break;
}

//Shooting will interrupt charging
if shot_fired = true
{
	shooting_charge_flicker = false;
	shooting_charge = 0;
	
	shooting = 15;
	if is_saber = true //Fix gun bug with the saber
		shooting = 1;
	
	/*if sprite_index = spr_player_x_idle_shoot
		image_index = 0;*/
	
	//Fire yanma option drones if not using yanma option
	if global.weapon[global.weapon_choice].type != "Yanma Option"
		with obj_player_yanma
			event_user(10);
}





