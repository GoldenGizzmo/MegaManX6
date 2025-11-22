/// @description Insert description here
// You can write your code in this editor

if blade_marked > 0
{
	var size = spr_blade_mark;
	if sprite_get_width(sprite_index) < 50 and sprite_get_height(sprite_index) < 50
		size = spr_blade_mark_small;
		
	blade_marked_fade = 0.5+dsin((blade_marked)*20)*0.25;
	
	//draw_sprite_ext(size,0,x,y,1,1,0,c_white,0.5);
	gpu_set_blendmode(bm_add)
		draw_sprite_ext(size,0,x,y,1,1,0,c_white,blade_marked_fade);
	gpu_set_blendmode(bm_normal)
}