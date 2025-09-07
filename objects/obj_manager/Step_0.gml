/// @description Insert description here
// You can write your code in this editor

if !instance_exists(obj_menu_paused)
	instance_create_depth(x,y,0,obj_menu_paused);

if keyboard_check_pressed(ord("R"))
	room_restart();

//Music volume
audio_group_set_gain(audiogroup_sfx,global.volume_effect*global.volume_master,0);
audio_group_set_gain(audiogroup_music,global.volume_music*global.volume_master,0);

global.rescue_count = ds_list_size(global.rescue_list);

global.playtime++;