/// @description Insert description here
// You can write your code in this editor

if warping_in = true
{
	var warp = warp_y;
	with obj_player
	{
		pal_swap_set(spr_player_x_palette,1,false);
		draw_sprite(spr_player_x_warp_no_armour,0,x,y-warp);
		pal_swap_reset();
	}
}