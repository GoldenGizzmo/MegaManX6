/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_sprite(spr_healingpad_icon,pad_animation/2,x,y);
if wall_animation > 0 and state = 1
	draw_sprite(spr_healingpad_wall_back,wall_animation,x,y);