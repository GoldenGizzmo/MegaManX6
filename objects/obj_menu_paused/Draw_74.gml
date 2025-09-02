/// @description Insert description here
// You can write your code in this editor

if global.pause_screen = true
{
	global.hud_toggle = false;
	pause_animate++;
	
	scr_get_character("X");
	var menu_colour = character_colour;
	
	draw_sprite_ext(spr_white_space,0,x,y,room_width,room_height,0,menu_colour,1)
	
	
	draw_sprite_ext(spr_pause_gradient,0,display_get_gui_width()/2,display_get_gui_height()/2,global.ui_scale*2,global.ui_scale,0,c_white,1);
	draw_sprite_ext(spr_pause_gradient,0,display_get_gui_width()/2,display_get_gui_height()/2,global.ui_scale*2,-global.ui_scale,0,c_white,1);
	
	gpu_set_blendmode(bm_add)
	draw_sprite_tiled_ext(spr_pause_grid,0,pause_animate,pause_animate,global.ui_scale,global.ui_scale,c_white,0.3);
	gpu_set_blendmode(bm_normal)
}