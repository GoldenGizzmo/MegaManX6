/// @description Special Weapons / X-Saber

var shot_fired = false;

var wall_slide_reverse = 1;
if wall_slide = true
	wall_slide_reverse = -1;

var shootpos_x = 10*image_xscale*wall_slide_reverse;
var shootpos_y = -7;
if sprite_index = spr_player_x_dash_simple or sprite_index = spr_player_x_crouch
	shootpos_y = 0;

switch (global.weapon[global.weapon_choice].type)
{
	case "X-Saber":
		if global.input_special_pressed and sprite_index != spr_player_x_idle_saber and sprite_index != spr_player_x_jump_saber and sprite_index != spr_player_x_walljump_saber
		{
			bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_saber)
			bullet.image_xscale = image_xscale;
			bullet.melee_damage = 4;
			bullet.melee_frames = 6;
			
			scr_make_sound(snd_shoot_saber_x,1,1,false);
			scr_player_voicelines("Weapon");

			if wall_slide = true
			{
				attack_action = "X-Saber Wall";
				
				sprite_index = spr_player_x_walljump_saber;
				bullet.sprite_index = spr_bullet_x_saber_wall;
			}
			else if airborne = false
			{
				attack_action = "X-Saber Standing";
				attack_priority = 1; //Can be dash cancelled or damaged out of it
				
				sprite_index = spr_player_x_idle_saber;
				bullet.sprite_index = spr_bullet_x_saber;
				
				xspeed = 0;
				dash = false;	
			}
			else
			{
				attack_action = "X-Saber Jump";
				wall_jump = false; //Funny X-Saber wall scaling tech
				
				sprite_index = spr_player_x_jump_saber;
				bullet.sprite_index = spr_bullet_x_saber_jump;
			}
			
			image_index = 0;
			shot_fired = true;
			crouch = false;
		}
		break;
	
	case "Meteor Rain":
	
		break;
	
	case "Ray Arrow":
		if global.input_special_pressed
		{
			var bullet_limit = 2;
			with obj_bullet_default
				if sprite_index = spr_bullet_rayarrow
					bullet_limit--;

			if bullet_limit > 0
			{
				bullet = instance_create_layer(x+shootpos_x,y+shootpos_y,"Projectiles",obj_bullet_default)
				bullet.image_xscale = image_xscale*wall_slide_reverse;
				bullet.speed = 8*bullet.image_xscale;
				bullet.sprite_index = spr_bullet_rayarrow
				bullet.damage = 6;
		
				
				shot_fired = true;
				global.weapon[global.weapon_choice].ammo--
				
				shooting = true;
				alarm[6] = 30; 
			}
		}
		break;
}

//Shooting will interrupt charging
if shot_fired = true
{
	shooting_charge_flicker = false;
	shooting_charge = 0;
}









