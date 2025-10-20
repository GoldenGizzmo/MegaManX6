/// @description Insert description here
// You can write your code in this editor

if !instance_exists(obj_menu_paused)
	instance_create_depth(x,y,0,obj_menu_paused);

if keyboard_check(vk_control)
{
	if keyboard_check_pressed(ord("R"))
		room_restart();
		
	if keyboard_check_pressed(ord("H"))
	{
		room_goto(rm_highmax);
		scr_weapon_get(1,"Yanma Option");
		scr_weapon_get(6,"Meteor Rain");
	}
		
	if keyboard_check_pressed(ord("P"))
	{
		if global.pause = false
			global.pause = true;
		else
			global.pause = false;
	}
}

//Music volume
audio_group_set_gain(audiogroup_sfx,global.volume_effect*global.volume_master,0);
audio_group_set_gain(audiogroup_music,global.volume_music*global.volume_master,0);

global.rescue_count = ds_list_size(global.rescue_list);

global.playtime++;

//Get out of title screen to set up manager object
if room = rm_title
	room_goto_next();