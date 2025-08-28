// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//Code that should run when the player hits the floor
function scr_stop_floor(){
	airborne = false;
	
	
}

//Code that should run when the player hits the ceiling
function scr_stop_ceiling(){

}

function scr_stop_wall(spd = 0){
	
	
	switch(object_type){
		
		case dynamic_type.player:
		
		break;
		
		case dynamic_type.grasshopper_alt:
		
			show_debug_message($"yeah")
		
			if(state != "Turn")alarm[0] = 1;
		    state = "Turn"
		
		break;
	}
	
}