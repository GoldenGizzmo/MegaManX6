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









