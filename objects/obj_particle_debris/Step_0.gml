/// @description Insert description here
// You can write your code in this editor

if global.pause = true
	return;

if image_alpha = 1
	image_alpha = 0
else
	image_alpha = 1;
	
if !place_meeting(x,y,obj_spawnzone)
	instance_destroy();