// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//Code that should run when the player hits the floor
function scr_stop_floor(){
	
	
	switch(object_index){
		
		
		case obj_player:
			
			if airborne = true scr_make_sound(snd_player_x_landing,1,1,false);	
			airborne = false;
			
		break;
		
	}
	
	airborne = false;
	
}

//Code that should run when the player hits the ceiling
function scr_stop_ceiling(){

}

function scr_stop_wall(){
	
	switch(object_index){
		
		
		case obj_enemy_caterpillar:
			if(state != "Turn"){
				state = "Turn"
				alarm[0] = 1;
			}
		break;
		
	}
	
}