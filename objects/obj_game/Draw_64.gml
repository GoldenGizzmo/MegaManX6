/// @description Insert description here
// You can write your code in this editor

var x_pos = 20*global.ui_scale;
var y_pos = (display_get_gui_height()/2)-10*global.ui_scale;

//HUD
draw_sprite_ext(spr_hud_player,0,x_pos,y_pos,global.ui_scale,global.ui_scale,0,c_white,1);

//Health Bar
var bar_height = -(30*global.ui_scale)-1;
var bar_start_y = y_pos;

//Normal life bar
var bar_limit = (global.life/global.lifemax)
if global.life > global.lifemax //If breaching the limit
	bar_limit = 1;
			
//White bar that appears when player takes damage
if life_tick != global.life
	life_tick += (global.life-life_tick)*0.025;
	
draw_rectangle_color(x_pos,bar_start_y,x_pos+(2*global.ui_scale)-1,bar_start_y+(bar_height+global.ui_scale)*(life_tick/global.lifemax),c_red,c_red,c_red,c_red,0);
if global.life > 0
	draw_rectangle_color(x_pos,bar_start_y,x_pos+(2*global.ui_scale)-1,bar_start_y+bar_height*bar_limit,c_lime,c_lime,c_yellow,c_yellow,0);














