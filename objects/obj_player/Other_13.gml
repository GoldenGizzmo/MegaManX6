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
		
	case "Yanma Option":
		if global.input_special_pressed and global.weapon[global.weapon_choice].ammo > 0
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
			global.weapon[global.weapon_choice].ammo--;

			scr_make_sound(snd_yammark_reinforcement,1,1,false);
			effect = instance_create_layer(x,y,"Explosions",obj_particle_reinforcement);
			effect.follow = self;
		}
		break;
	
	case "Meteor Rain":
	
		break;
	
	case "Ray Arrow":
		if global.input_special_pressed and global.weapon[global.weapon_choice].ammo > 0
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
				global.weapon[global.weapon_choice].ammo--;
			}
		}
		break;
}

//Shooting will interrupt charging
if shot_fired = true
{
	shooting_charge_flicker = false;
	shooting_charge = 0;
	
	shooting = 30;
	if sprite_index = spr_player_x_idle_shoot
		image_index = 0;
	
	//Fire yanma option drones if not using yanma option
	if global.weapon[global.weapon_choice].type != "Yanma Option"
		with obj_player_yanma
			event_user(10);
}





