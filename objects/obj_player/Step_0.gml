/// @description Insert description here
// You can write your code in this editor

if global.death return;

global.input_left = keyboard_check(ord("A"))
global.input_right = keyboard_check(ord("D"))
global.input_down = keyboard_check(ord("S"))

global.input_shoot = keyboard_check(ord("J"))
global.input_shoot_pressed = keyboard_check_pressed(ord("J"))
global.input_shoot_released = keyboard_check_released(ord("J"))

global.input_jump_pressed = keyboard_check_pressed(ord("K"))
global.input_jump_released = keyboard_check_released(ord("K"))
global.input_dash = keyboard_check(ord("L"))
global.input_dash_pressed = keyboard_check_pressed(ord("L"))
global.input_dash_released = keyboard_check_released(ord("L"))

var dir = global.input_right - global.input_left;

hspd = dir * player_spd;
vspd += grv;

if(global.input_jump_pressed)vspd -= 6;


hspd = scr_move(hspd, AXIS_HORIZONTAL);
vspd = scr_move(vspd, AXIS_VERTICAL);