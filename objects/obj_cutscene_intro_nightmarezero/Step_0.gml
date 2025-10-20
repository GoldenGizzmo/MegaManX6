/// @description Insert description here
// You can write your code in this editor

if action = 13
{
	with obj_player
	{
		animation_lock = true;
		x += move_speed;
		sprite_index = spr_player_x_move_simple;
	}
}
else
{
	with obj_player
	{
		animation_lock = false;
		sprite_index = spr_player_x_idle;
	}
}
