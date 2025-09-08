// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro AXIS_HORIZONTAL 0
#macro AXIS_VERTICAL 1

//You can edit these

#macro SLOPE_CHECK_REACH 16 //How far should the code check for a slope under the player
#macro SLOPE_SPEED_FACTOR 1 //The factor the player speed should be multiplied by when going up a slope
//Sqrt(2) works for 45º angles, as it reduces the diagonal speed to be the same as the hspd/vspd.

enum dynamic_type {
	base,
	player,
	grasshopper_alt
}