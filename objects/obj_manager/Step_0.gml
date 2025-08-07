/// @description Insert description here
// You can write your code in this editor

if !instance_exists(obj_menu_paused)
	instance_create_depth(x,y,0,obj_menu_paused);

if keyboard_check_pressed(ord("R"))
	room_restart();



