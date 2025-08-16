/// @description Player Movement

//Can be paused
if global.pause = true
	return;

//If alive
if global.death = false and animation_lock = false
{
	//Animations
	//if attack_priority = 0
	if attack_action = "X-Saber Jump" and sprite_index != spr_player_x_jump_saber
		attack_action = 0;
	if attack_action = "X-Saber Wall" and sprite_index != spr_player_x_walljump_saber
		attack_action = 0;
	if attack_action = "X-Saber Standing" and sprite_index != spr_player_x_idle_saber
		attack_action = 0;
	if attack_action = 0
		attack_priority = 0;
	event_user(0);
	
	//If underwater
	var water_check = false;
	with instance_place(x,y,obj_water) //Check if fully submerged
			water_check = true;
	
	if yspeed != 0
	{
		//Splash when entering and exiting water
		if underwater = false and water_check = true
		{		
			underwater = true;
			with instance_place(x,y,obj_water)
			{
				effect = instance_create_depth(other.x,y,depth+1,obj_explosion);
				effect.sprite_index = spr_water_splash;
			}
		}
		else if underwater = true and water_check = false
		{
			underwater = false;
			with instance_place(x,y+10,obj_water)
			{
				effect = instance_create_depth(other.x,y,depth+1,obj_explosion);
				effect.sprite_index = spr_water_splash;
			}
		}
	}	
	
	
	weight = 0.3;
	fall_speed = 6;
	if underwater = true
	{
		weight = 0.15;
		fall_speed = 3;
		if yspeed > fall_speed
			yspeed = fall_speed
	}
			
	if weight > 0 and climbing = false
	{
		//Don't fall faster than max fall speed
		if yspeed < fall_speed and airborne = true
			yspeed += weight
		else
			y = round(y); //Align to ground

		if place_meeting(x,y+1,obj_solid) or place_meeting(x,y+1,obj_solid_slope)
			y = round(y);
	}

	//If not hurt (when hurt you can't move and don't fall with gravity)
	if hurt = false and attack_priority < 2
	{	
		//If allowed to move
		if movement = true
		{
			if global.input_jump_pressed and airborne = false and attack_priority = 0
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
		
			if attack_priority = 0
			{
				if wall_jump = true //Wall jumping
				{
					if dash = true //Dash wall jump
						xspeed = dash_speed*-image_xscale;
					else //No dash wall jump
						xspeed = move_speed*-image_xscale;
				}
				else if climbing = true
				{
					//Moving up and down
					if global.input_up
						yspeed = -move_speed;
					else if global.input_down and place_meeting(x,y+move_speed,obj_ladder)
						yspeed = move_speed;
					else
						yspeed = 0;

					//Facing left and right
					if global.input_left
						image_xscale = -1;
					else if global.input_right 
						image_xscale = 1;
					
					//Falling off the bottom
					if !global.input_up and y > instance_place(x,y+16*other.image_yscale,obj_ladder)
						climbing = false;
					if !place_meeting(x,y,obj_ladder)
						climbing = false;
				
					//Jumping off
					if global.input_jump_pressed
					{
						climbing = false;
						climbing_dismount = true;
					
						yspeed = -jump_height;
						if global.input_dash
							dash = true;
					}
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
							{
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
			if shooting_lock = false
			{
				//X-Buster
				if global.input_shoot or global.input_shoot_released
				{
					event_user(1);
					shooting_charge++;
					
				}
				//Special Weapons
				if global.input_special or global.input_special_released
				{
					event_user(3);
					
					//Only charge if you have the ammo for it and not the x-saber
					if global.weapon[global.weapon_choice].charge_cost <= global.weapon[global.weapon_choice].ammo and global.weapon_choice != 0
						shooting_charge++;
				}
				
				//If not holding down any buttons
				if !(global.input_shoot or global.input_special)
				{
					shooting_charge_flicker = false;
					shooting_charge = 0;
				}
				
				//Curent Bug: holding down both shoot buttons will cause the player to flicker way faster	
				//Flashing visual effect
				if shooting_charge%2 = 0
				{
					if shooting_charge_flicker = false
						shooting_charge_flicker = true;
					else
						shooting_charge_flicker = false;
				}
			}
		}
	}
	
	//Slow status effect
	if slowed > 0
	{
		slowed--;
		xspeed /= 2;
	}
	
	//Current collision scripts
	//scr_collision();
	airborne = true;
	xspeed = scr_move(xspeed, AXIS_HORIZONTAL);
	yspeed = scr_move(yspeed, AXIS_VERTICAL);
	if place_meeting(x,y+1,obj_solid)
		airborne = false;
	
	
	//Changing weapons
	if (global.input_swap_left_pressed or global.input_swap_right_pressed) and attack_action = 0
	{
		if global.input_swap_right_pressed //Swapping next
		{
			for (i = 1; i < 10; i++)
			{
				if global.weapon_choice+i > array_length(global.weapon)-1 //If reaching the end of the list
				{
					global.weapon_choice = 0; //Go back to the start (X-Buster)
					flicker_weapon_swap = true;
					break;
				}
				else if global.weapon[global.weapon_choice+i].type != 0 //If next spot is not vacant
				{
					global.weapon_choice = global.weapon_choice+i; //Swap to that weapon
					flicker_weapon_swap = true;
					break;
				}
			}
		}
		else if global.input_swap_left_pressed //Swapping previous
		{
			for (i = 1; i < 10; i++)
			{
				if global.weapon_choice = 0 //If using the X-Buster
				{
					//Go to the end of the list
					for (a = 1; a < 10; a++)
					{
						//Check backwards for a weapon to be equipped
						if global.weapon[array_length(global.weapon)-a] != 0
						{
							global.weapon_choice = array_length(global.weapon)-a;
							flicker_weapon_swap = true;
							break;
						}
					}
					break;
				}
				else if global.weapon[global.weapon_choice-i].type != 0 //If previous spot is not vacant
				{
					global.weapon_choice = global.weapon_choice-i; //Swap to that weapon
					flicker_weapon_swap = true;
					break;
				}
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
else
{
	shooting_charge_flicker = false;
	shooting_charge = 0;
}

/*
else if zipline = true
{
	//Moving up and down
	if global.input_up
	{
		yspeed = -move_speed;
		if dash = true
			yspeed = -dash_speed;
	}
	else if global.input_down
	{
		yspeed = move_speed;
		if dash = true
			yspeed = dash_speed;
	}
	else
		yspeed = 0;
	//BUG: Dash jumping onto a zipline from a wall causes displacement
	if !place_meeting(x,y+yspeed,obj_zipline)
		yspeed = 0;
				
	//Zipline dash
	if global.input_dash_pressed and dash = false
	{
		dash = true;
		alarm[4] = 30;
	}
				
	//Stopping dash
	if dash = true
	{
		if yspeed > 0 and global.input_up
			dash = false;
		else if yspeed < 0 and global.input_down
			dash = false;
		else if yspeed = 0
			dash = false;
	}
				
	//Facing left and right
	if global.input_left
		image_xscale = -1;
	else if global.input_right 
		image_xscale = 1;
				
	//Jumping off
	if global.input_jump_pressed
	{
		zipline = false;
		zipline_dismount = true;
					
		yspeed = -jump_height;
		if global.input_dash
			dash = true;
	}
}

//Grabbing onto a zipline
if (global.input_up or global.input_down) and place_meeting(x,y,obj_zipline) and zipline = false and zipline_dismount = false
{
	zipline = true;
					
	//Snap to zipline
	x = instance_place(x,y,obj_zipline).x+8;
					
	//Stop all speed
	yspeed = 0;
	xspeed = 0;
	dash = false;
	alarm[4] = 1;
}
if !global.input_up and !global.input_down //Repress to grab
	zipline_dismount = false;


