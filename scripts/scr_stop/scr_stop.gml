// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//Code that should run when the player hits the floor
function scr_stop_floor(){
	
	if airborne = true and object_index = obj_player
		scr_make_sound(snd_player_x_landing,1,1,false);	
	
	airborne = false;
}

//Code that should run when the player hits the ceiling
function scr_stop_ceiling(){

}