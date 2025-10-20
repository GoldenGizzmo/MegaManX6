/// @description Insert description here
// You can write your code in this editor

//Stop boss from attacking
with obj_boss_highmax
{
	if obj_cutscene_intro_ending.hold_pose = true
		alarm[0] = 10;
	
	//Stop music for dramatic effect after the punch
	if action = 6 
	{
		audio_stop_sound(global.music);
		global.music = noone;
		
		obj_cutscene_intro_ending.finish_pose = true
	}
	
	if action = 7 and obj_cutscene_intro_ending.finish_pose = true
	{
		alarm[0] = 60;
		obj_cutscene_intro_ending.finish_pose = false;
	}
}
		
//Leaving	
if warp_out = true
	warp_y += warp_speed;