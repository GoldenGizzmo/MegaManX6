// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro AXIS_HORIZONTAL 0
#macro AXIS_VERTICAL 1

//You can edit these

#macro SLOPE_CHECK_REACH 16 //How far should the code check for a slope under the player
#macro SLOPE_SPEED_FACTOR 1 //The factor the player speed should be multiplied by when going up a slope
//Sqrt(2) works for 45º angles, as it reduces the diagonal speed to be the same as the hspd/vspd.

#macro PLAYER_BASE_IMAGE_SPEED 0.5

#macro CROUCH_SPRITES [spr_port_x_crouch, spr_port_x_crouch_shooting, spr_port_x_crouch_shot]
#macro FALLING_SPRITES [spr_port_x_falling, spr_port_x_falling_shooting, spr_port_x_saber_jump]
#macro X_SABER_SPRITES [spr_port_x_saber, spr_port_x_saber_jump, spr_port_x_saber_walljump]


enum shooting_charge_level {
	none,
	one,
	two
}

enum dynamic_type {
	base,
	player,
	grasshopper_alt
}

enum animation_sync_type {
	base,
	match_image,
	override,
	last,
}

enum sprite_loop_type {
	base,
	no_loop
}

enum attack_actions {
	none,
	x_saber,
	rain,
	yanma
}