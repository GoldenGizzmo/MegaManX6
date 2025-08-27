/// @description Insert description here
// You can write your code in this editor

if state > 1
{
	//Shadow
	if state < 6
		draw_sprite_ext(spr_ready_shadow,0,display_get_gui_width()/2,display_get_gui_height()/2,global.ui_scale,global.ui_scale,0,c_white,1);

	//Ready
	draw_sprite_ext(sprite_index,ready_animate,display_get_gui_width()/2+draw_x,display_get_gui_height()/2+draw_y,global.ui_scale,global.ui_scale,0,c_white,1);

	//Other ready when dispersing
	if state = 6
	{
		draw_x += 8*global.ui_scale;
		draw_sprite_ext(sprite_index,ready_animate,display_get_gui_width()/2-draw_x,display_get_gui_height()/2+draw_y,global.ui_scale,global.ui_scale,0,c_white,1);
	}
}