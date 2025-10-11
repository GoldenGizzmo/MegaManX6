/// @description Insert description here
// You can write your code in this editor

//draw_text_transformed_color(16*global.ui_scale,1*global.ui_scale,global.weapon_get,global.ui_scale/2,global.ui_scale/2,0,c_yellow,c_yellow,c_yellow,c_yellow,1);

if global.fps_display = true
	draw_text_transformed_color(16*global.ui_scale,1*global.ui_scale,"FPS = "+string(fps),global.ui_scale/2,global.ui_scale/2,0,c_yellow,c_yellow,c_yellow,c_yellow,1);