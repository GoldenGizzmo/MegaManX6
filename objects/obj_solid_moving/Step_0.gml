/// @description Insert description here
// You can write your code in this editor

if global.pause = true
	return
	
scr_check_directions()
	
	
var spd = move_speed * dir * !stop;
var internal_spd = ceil(abs(spd)) * sign(spd);
	
scr_move_along_with_platform(internal_spd)

var _x = x;
var _y = y;


exhaust = spr_platform_exhaust;
if(axis == AXIS_HORIZONTAL){
	x += spd;
}
else
{
	y += spd;
	
	if spd < 0
		exhaust = spr_platform_exhaust_big;
}


scr_platform_move_objects(internal_spd);


