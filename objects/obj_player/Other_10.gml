/// @description Insert description here
// You can write your code in this editor

if animation_lock = true
	exit;

var loop = false;
image_speed = 1;
changing_sprite = sprite_index;

if hurt = false
{
	if airborne = true
	{
		if wall_slide = true
			sprite_index = spr_player_x_walljump_simple;
		else
			sprite_index = spr_player_x_jump;
	}
	else
	{
		if dash = true
			sprite_index = spr_player_x_dash_simple;
		else
		{
			if xspeed != 0
			{
				sprite_index = spr_player_x_move_simple;
				loop = true;
			}
			else
			{
				if crouch = true
					sprite_index = spr_player_x_crouch;
				else
				{
					sprite_index = spr_player_x_idle;
					loop = true;
				}
			}
		}
	}
}
else
{
	sprite_index = spr_player_x_hurt;
	loop = true;
}

if changing_sprite != sprite_index
	image_index = 0;

if loop = false and image_index > image_number-1
	image_speed = 0;


/*
var loop = false;
image_speed = 1;
changing_sprite = sprite_index;

if airborne = false
{
	if dash = false
	{
		if (global.input_left or global.input_right) and !place_meeting(x+xspeed,y,obj_solid)
		{
			if sprite_index != spr_player_x_move and xspeed != 0
			{
				image_index = 2
				changing_sprite = spr_player_x_move;
			}
			
			sprite_index = spr_player_x_move;
			if image_index > image_number-1
				image_index = 2
		}
		else
		{			
			loop = true;
			if sprite_index != spr_player_x_dash
				sprite_index = spr_player_x_idle;
				
			if shooting = true
			{
				loop = true;
				if global.input_shoot_pressed
					changing_sprite = noone;
				sprite_index = spr_player_x_idle_shoot;
			}
			else
				shooting = false;
				
			if landing = true and sprite_index = spr_player_x_idle
			{
				if shooting = true
				{
					if sprite_index = spr_player_x_jump_land
						changing_sprite = sprite_index
					sprite_index = spr_player_x_jump_land_shoot;
				}
				else
				{
					if sprite_index = spr_player_x_jump_land_shoot
						changing_sprite = sprite_index
					sprite_index = spr_player_x_jump_land;
				}
				loop = true;
			}
			else
				landing = false;
		}
			
		if crouch = true
		{
			if shooting = true
			{
				if sprite_index = spr_player_x_crouch or sprite_index = spr_player_x_idle
					changing_sprite = sprite_index
				sprite_index = spr_player_x_crouch_shoot;
			}
			else
			{
				if sprite_index = spr_player_x_crouch_shoot or sprite_index = spr_player_x_idle_shoot
					changing_sprite = sprite_index
				sprite_index = spr_player_x_crouch;
			}
			loop = false;
		}
	}
	else
	{
		if !place_meeting(x+xspeed,y,obj_solid)
		{
			if global.input_dash_pressed
				changing_sprite = noone;
			sprite_index = spr_player_x_dash;
			if image_index > 3
				image_index = 2;
		}
		else
		{
			sprite_index = spr_player_x_idle;
			loop = true;
		}
	}	
}
else
{
	if yspeed > 0
	{
		if shooting = true
		{
			if sprite_index = spr_player_x_jump
				changing_sprite = sprite_index
			sprite_index = spr_player_x_jump_shoot;
		}
		else
		{
			if sprite_index = spr_player_x_jump_shoot
				changing_sprite = sprite_index
			sprite_index = spr_player_x_jump;
		}
	}
	else
	{
		if sprite_index != spr_player_x_walljump
		{
			if shooting = true
			{
				if sprite_index = spr_player_x_jump_rise
					changing_sprite = sprite_index
				sprite_index = spr_player_x_jump_rise_shoot;
			}
			else
			{
				if sprite_index = spr_player_x_jump_rise_shoot
					changing_sprite = sprite_index
				sprite_index = spr_player_x_jump_rise;
			}
		}
		else
			loop = true;
	}
	
	if wall_slide = true
	{
		sprite_index = spr_player_x_walljump;
		if yspeed < 0 and image_index < 4
			image_index = 4;
		else if image_index > 3
			image_index = 3;
			
		loop = true;
	}
}

if changing_sprite != sprite_index
	image_index = 0;

if loop = false and image_index > image_number-1
	image_speed = 0;









