/// @description Insert description here
// You can write your code in this editor

var check = false
with obj_water
	if place_meeting(x,y,obj_player) and toxic = false
		check = true;

if obj_player.y > y+32 and obj_acid_rain.submerged < 1 and check = true
	obj_acid_rain.submerged += 0.02;
else if obj_player.y < y-32 and obj_acid_rain.submerged > 0
	obj_acid_rain.submerged -= 0.02;