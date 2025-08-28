/// @description Insert description here
// You can write your code in this editor

//Can be paused
if global.pause = true
	return;

if movement_freeze = false
	yspeed = min(yspeed+weight,fall_speed);
