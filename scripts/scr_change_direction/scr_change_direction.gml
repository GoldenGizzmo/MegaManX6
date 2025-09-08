// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_change_direction(next_dir){

	if(next_dir == 0){
		dir *= -1;
		return;
	}
	
	var ang = (next_dir - 1) * (pi/2);
	
	var sn = sin(ang)
	var cs = cos(ang)
	
	axis = abs(sn);
	dir = cs != 0 ? cs : -sn

}