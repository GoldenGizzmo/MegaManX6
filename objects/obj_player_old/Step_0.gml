/// @description Insert description here
// You can write your code in this editor

global.input_left = keyboard_check(ord("A"))
global.input_right = keyboard_check(ord("D"))
global.input_down = keyboard_check(ord("S"))

global.input_shoot = keyboard_check(ord("J"))
global.input_shoot_pressed = keyboard_check_pressed(ord("J"))
global.input_shoot_released = keyboard_check_released(ord("J"))

global.input_jump_pressed = keyboard_check_pressed(ord("K"))
global.input_jump_released = keyboard_check_released(ord("K"))
global.input_dash = keyboard_check(ord("L"))
global.input_dash_pressed = keyboard_check_pressed(ord("L"))
global.input_dash_released = keyboard_check_released(ord("L"))

//If alive
if global.death = false
{
	//Animations
	event_user(0);
	//Current collision scripts
	scr_collision(true,true);

	//If not hurt (when hurt you can't move and don't fall with gravity)
	if hurt = false
	{
		if weight > 0
		{
			//Don't fall faster than max fall speed
			if yspeed < fall_speed and airborne = true
				yspeed += weight
			else
				y = round(y); //Align to ground

			if place_meeting(x,y+1,obj_solid) or place_meeting(x,y+1,obj_solid_slope)
				y = round(y);
		}
		
		//If allowed to move
		if movement = true
		{
			if global.input_jump_pressed and airborne = false
			{
				yspeed -= jump_height;
				if global.input_dash
					dash = true;
			}
	
			//If not facing a wall and touching the ground
			if global.input_dash_pressed = true and airborne = false and dash = false and !place_meeting(x+image_xscale,y,obj_solid)
			{
				dash = true;
				dash_ground = true;
				alarm[4] = 30;
			}
			
			//Holding the button into the wall while falling
			if ((place_meeting(x+1,y,obj_solid) and global.input_right) or (place_meeting(x-1,y,obj_solid) and global.input_left)) and wall_jump = false and yspeed > 0
			{
				//Turn off dash
				if yspeed != 0
					dash = false;
				
				yspeed = 1; //Wall slide	
				wall_slide = true;
			
				//Wall Jump
				if global.input_jump_pressed
				{
					yspeed = -jump_height;
					wall_jump = true;
					
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
		
			if wall_jump = true //Wall jumping
			{
				if dash = true //Dash wall jump
					xspeed = dash_speed*-image_xscale;
				else //No dash wall jump
					xspeed = move_speed*-image_xscale;
			}
			else
			{
				if dash = true
				{
					//Dash and move freely while in the air
					if airborne = true
					{
						alarm[4] = 1;
						dash_ground = false;
			
						if global.input_left
						{
							xspeed = -dash_speed;
							image_xscale = -1;
						}
						else if global.input_right
						{
							xspeed = dash_speed;
							image_xscale = 1;
						}
						else
							xspeed = 0;
					}
					else
					{
						//Dash in a straight line with reverse movement stopping the motion
						if dash_ground = true
							xspeed = dash_speed*image_xscale;
			
						//Dash cancel when released
						if global.input_dash_released
							alarm[4] = 1;
						if global.input_left and image_xscale = 1
							alarm[4] = 1;	
						if global.input_right and image_xscale = -1
							alarm[4] = 1;
					}	
				}
				else
				{
					if global.input_left
					{
						xspeed = -move_speed;
						image_xscale = -1;
					}
					else if global.input_right
					{
						xspeed = move_speed;
						image_xscale = 1;
					}
					else
						xspeed = 0;
				}
			}
	
			
				
			if airborne = false
			{
				wall_slide = false;
				
				//Crouching
				if global.input_down and dash = false
				{
					xspeed = 0;
					crouch = true;
				}
				else
					crouch = false;
			}
			else
			{
				//Short hop for more controlled jump
				if global.input_jump_released
				{
					if yspeed < 0
						yspeed = 0;
				}
			}
		
			//Shooting
			if (global.input_shoot or global.input_shoot_released) and shooting_lock = false
			{
				event_user(1);
				shooting_charge++;
				
				//Flashing visual effect
				if shooting_charge%2 = 0
				{
					if shooting_charge_flicker = false
						shooting_charge_flicker = true;
					else
						shooting_charge_flicker = false;
				}
			}
			else
			{
				shooting_charge_flicker = false;
				shooting_charge = 0;
			}
		}
	}
	
	//Afterimages
	if dash = true and global.animate%3 = 0
	{
		afterimage = instance_create_depth(x,y,depth+10,obj_afterimage);
		afterimage.image_blend = make_color_rgb(0,89,255);
		afterimage.sprite_index = sprite_index;
		afterimage.image_index = image_index;
		afterimage.image_xscale = image_xscale;
	}
}






