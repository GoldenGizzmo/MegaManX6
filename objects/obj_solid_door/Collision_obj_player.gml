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
		movement_freeze = true;
		colliding = false;
		
		if sprite_index != spr_port_x_move_loop// and sprite_index != spr_port_x_dash
			image_speed = 0;
	}
	
	image_speed = 1;
	scr_make_sound(snd_door,1,1,false);
	
	with boundary
	{
		image_xscale = 0; 
		image_yscale = 0;
	}
	
	var check = x;
	with obj_enemy_parent //Destroy all enemies to the left
		if boss = false and x < check and life > 0 //Bosses don't get removed
			instance_destroy(id,false);
	with obj_bullet_default
		instance_destroy(id,false);
}
	
	














