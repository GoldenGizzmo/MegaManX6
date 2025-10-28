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
			
			if airborne = true{
				scr_make_sound(snd_player_x_landing,1,1,false);	
				attack_action = attack_actions.none;
			}
			airborne = false;
			
		break;
		
	}
	
	airborne = false;
	return 0;
	
}

//Code that should run when the player hits the ceiling
function scr_stop_ceiling(){
	return 0;
}

function scr_stop_wall(spd, col = obj_solid){
	
	switch(object_index){
		
		case obj_enemy_grasshopper_alt:
			if state = "Roaming"
			{
				image_xscale *= -1;
				return xspeed * -1;
			}
			break;
			
		case obj_enemy_larvae:
			image_xscale *= -1;
			return xspeed * -1;
			
		case obj_enemy_dozer:
			image_xscale *= -1;
			return xspeed * -1;
			
		case obj_enemy_met:
			image_xscale *= -1;
			return xspeed * -1;
		
		case obj_enemy_caterpillar:
			if state = "Moving"
			{	
				state = "Turn"
				alarm[0] = 1;
			}
		break;
		
		case obj_player:
		
			if(!walled){
				attack_action = attack_actions.none;
			}
		
			walled = true;
			
			//Checking if touching a wall that can't be climbed
			var climbable = true
			if place_meeting(x+image_xscale,y,obj_solid_noclimb)
				climbable = false;
		
			//Holding the button into the wall while falling
			if (airborne and yspeed > 0 and climbable = true)
			{
				yspeed = 1; //Wall slide	
				if wall_slide = false
				{
					wall_slide = true;
					dash = false;
					
					scr_make_sound(snd_player_x_wallslide,1,1,false);
				}
				airdash_lock = false;
				
				//Check if the animation is finished, create the smoke from sliding
				if image_speed = 0
				{
					var check = false
					with obj_particle_wallslide
						if sprite_index != spr_effect_wallslide_end
							check = true;
					
					if check = false
					{
						effect = instance_create_layer(x,y,"Projectiles",obj_particle_wallslide);
						effect.image_xscale = image_xscale;
					}
				}
			
				//Wall Jump
				if global.input_jump_pressed
				{
					yspeed = -jump_height;
					wall_jump = true;
					
					attack_action = attack_actions.none;
					
					//Wall kick effect
					effect = instance_create_layer(x+14*image_xscale,y+18,"Explosions",obj_explosion); //y+23
					effect.sprite_index = spr_explosion_projectile;
					
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
	
	return 0;
	
}