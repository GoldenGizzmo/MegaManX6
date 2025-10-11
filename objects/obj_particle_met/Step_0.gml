/// @description Insert description here
// You can write your code in this editor

if global.pause = true
	return;

image_angle += 15*image_xscale;

if !place_meeting(x,y,obj_spawnzone)
	instance_destroy();