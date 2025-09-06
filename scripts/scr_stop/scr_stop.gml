// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_not_stop_horizontal(){
	
	walled = false;
	wall_slide = false;

}

function scr_not_stop_vertical(){
	airborne = true;
}

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

function scr_stop_wall(spd, slope = false){
	
	switch(object_index){
		
		
		case obj_enemy_caterpillar:
			if(state != "Turn"){
				state = "Turn"
				alarm[0] = 1;
			}
		break;
		
		case obj_player:
		
			walled = true;
		
			//Holding the button into the wall while falling
			if (airborne and yspeed > 0)
			{
				yspeed = 1; //Wall slide	
				if wall_slide = false
				{
					wall_slide = true;
					dash = false;
					
					scr_make_sound(snd_player_x_wallslide,1,1,false);
				}
				airdash_lock = false;
			
				//Wall Jump
				if global.input_jump_pressed
				{
					yspeed = -jump_height;
					wall_jump = true;
					
					scr_make_sound(snd_player_x_walljump,1,1,false);
					scr_player_voicelines("Wall Jump");
					
					if global.input_dash
					{
						dash = true;
						alarm[4] = 1;
					}

					//Time until wall slide again
					alarm[5] = 10;
				}
			}
			else
				wall_slide = false;
		
		break;
		
	}
	
}