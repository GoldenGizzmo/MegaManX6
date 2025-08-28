/// @description Insert description here
// You can write your code in this editor

draw_x += (move_speed*move_direction)*global.ui_scale;

draw_set_alpha(0.5);
draw_rectangle_color(draw_x,draw_y,draw_x+(width*global.ui_scale),draw_y+(height*global.ui_scale),colour,colour,c_white,c_white,false);
draw_set_alpha(1);