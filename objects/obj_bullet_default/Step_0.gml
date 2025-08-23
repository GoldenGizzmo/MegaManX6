/// @description Insert description here
// You can write your code in this editor

//Can be paused
if global.pause = true
	return;

if expiry != -1	
{
	if expiry > 0
		expiry--;
	else
		alarm[9] = 1;
}

if !place_meeting(x,y,obj_spawnzone)
	alarm[9] = 1;












