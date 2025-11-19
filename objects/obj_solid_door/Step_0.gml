/// @description Insert description here
// You can write your code in this editor

if open_state = 2
{
	if obj_player.x > (x+16)-40 and obj_player.x < (x+16)+40
		obj_player.x += 1*image_xscale;
	else
	{
		open_state++;
		
		
		with obj_player	
		{
			movement = true;
			animation_lock = false;
			movement_freeze = false;
			colliding = true;
			
			//Weird bug
			if place_meeting(x,y+1,obj_solid)
			{
				airborne = false;
				y += 1
				sprite_index = spr_port_x_move_loop;
			}
			
			
			image_speed = 1;
			
			xspeed = 0;
			yspeed = 0;
			dash = false;
		}
		
		image_speed = -1;
		scr_make_sound(snd_door,1,1,false);
		
		with boundary
		{
			image_xscale = 2; 
			image_yscale = 4;
		}
	}
}











