/// @description Insert description here
// You can write your code in this editor

//Start openning
if open_state = 0 and ((image_xscale = 1 and obj_player.x < x) or (image_xscale = -1 and obj_player.x > x))
{
	open_state++;
	with obj_player	
	{
		movement = false;
		animation_lock = true;
		
		if sprite_index != spr_player_x_move_simple
			image_speed = 0;
	}
	image_speed = 1;
	
	with boundary
	{
		image_xscale = 0; 
		image_yscale = 0;
	}
	
	with obj_enemy_hostile
		instance_destroy(id,false);
	with obj_bullet_default
		instance_destroy(id,false);
}
	
	














