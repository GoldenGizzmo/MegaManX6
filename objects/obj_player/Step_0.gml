/// @description Player Movement

//Can be paused
if global.pause = true
	return;
	
event_inherited();

if shooting > 0
	shooting--;

//If alive
if global.death = false and animation_lock = false
{
	//Animations
	//if attack_priority = 0
	if(attack_action = attack_actions.x_saber and scr_sprite_finished(spr_manager, X_SABER_SPRITES))
		attack_action = attack_actions.none;


	if attack_action = attack_actions.none
		attack_priority = 0;
	
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
				
				scr_make_sound(snd_splash,1,1,false);
			}
		}
		else if underwater = true and water_check = false
		{
			underwater = false;
			with instance_place(x,y+10,obj_water)
			{
				effect = instance_create_depth(other.x,y,depth+1,obj_explosion);
				effect.sprite_index = spr_water_splash;
				
				scr_make_sound(snd_splash,1,1,false);
			}
		}
	}	
	
	
	weight = 0.3;
	fall_speed = 6;
	if underwater = true
	{
		weight = 0.15;
		fall_speed = 3;
	}
	//Turn off gravity 		
	if climbing = true or airdash_state > 0
		weight = 0;

	//If not hurt (when hurt you can't move and don't fall with gravity)
	if hurt = false and attack_priority < 2
	{	
		//If allowed to move
		if movement = true
		{
			//Set movement variables
			move_speed = 2;
			jump_height = 6.5;
			
			dash_speed = 4.5;
			dash_length = 30; 
			
			//Part: Hyper Dash
			if ds_list_find_index(global.parts_equipped,2) != -1 {scr_get_part_effect(2,false);}	
			
			
			if global.input_jump_pressed and airborne = false and attack_priority = 0
			{
				yspeed -= jump_height;
				if global.input_dash
					dash = true;
				
				audio_stop_sound(snd_player_x_dash);
				scr_make_sound(snd_player_x_jump,1,1,false);
				scr_player_voicelines("Jump");
			}
	
			//If not facing a wall and touching the ground
			if global.input_dash_pressed = true and airborne = false and dash = false and !walled
			{
				dash = true;
				dash_ground = true;
				alarm[4] = dash_length;
				
				//Dash effect
				effect = instance_create_layer(x-5*image_xscale,y+23,"Explosions",obj_explosion);
				effect.sprite_index = spr_effect_dash_trail;
				effect.image_xscale = image_xscale;
				
				scr_make_sound(snd_player_x_dash,1,1,false);
			}
			
		
			if attack_priority = 0 and airdash_state = 0
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
							
						scr_make_sound(snd_player_x_jump,1,1,false);
						scr_player_voicelines("Jump");
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
								if !global.input_dash
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
			
			//Mach dash (in air, not doing any special attack, not sliding on a wall)
			if global.x_armour_leg = "Blade Leg" and airborne = true and attack_priority = 0 and wall_slide = false
			{
				switch (airdash_state)
				{
					case 0: //Activated mach dash 
						//(airdash lock limits to only one air dash per jump)
						if global.input_dash_pressed and airdash_lock = false
						{
							airdash_lock = true;
							shooting_lock = true;
							airdash_state = 1;
						}
						break;
					
					case 1: //While holding the mach dash
						if global.input_dash
						{
							machdash_hold++;
					
							//Freeze movement
							yspeed = 0;
							xspeed = 0;
							dash = false;
						
							//Facing left and right
							if global.input_left
								image_xscale = -1;
							else if global.input_right 
								image_xscale = 1;
						}
						
						//Releasing the mach dash
						if global.input_dash_released
						{
							airdash_state = 2;
						
							alarm[4] = dash_length/2;
						
							//Get mach dash direction
							machdash_direction = -1;
							if global.input_left
							{
								image_xscale = -1;
								machdash_direction = 180;
							}
							else if global.input_right 
							{
								image_xscale = 1;
								machdash_direction = 0;
							}
							else if global.input_up
								machdash_direction = 90;
							else if global.input_down
								machdash_direction = 270;
							else
								alarm[4] = 1;
						}
						break;
						
					case 2: //While mach dashing
						if dash = false
						{
							dash = true;
							invul = true;
							event_user(4); //Dash hitbox, happen once
							machdash_hold = 0;
							
							scr_make_sound(snd_player_x_dash,1,1,false);
						}
					
						//Dash in direction
						var mach_dash_speed = dash_speed*2;
						switch (machdash_direction)
						{
							case 0: xspeed = mach_dash_speed break;
							case 180: xspeed = -mach_dash_speed break;
							case 90: yspeed = -mach_dash_speed break;
							case 270: yspeed = mach_dash_speed break;
						}
						
						//Prematurely end dash
						switch (machdash_direction)
						{
							case 0: if !global.input_right {alarm[4] =  1;} break;
							case 180: if !global.input_left {alarm[4] =  1;} break;
							case 90: if !global.input_up {alarm[4] =  1;} break;
							case 270: if !global.input_down {alarm[4] =  1;} break;
						}	
					
						//Stopping at walls
						if place_meeting(x+xspeed,y+yspeed,obj_solid)
							alarm[4] = 1;
						break;
				}
			}
			
		
			//Shooting
			if shooting_lock = false and attack_priority = 0
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
				
				if shooting_charge = shooting_charge_lvl_1
					scr_make_sound(snd_player_x_charge_fadeout,1,1,false);
				
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
			
			//If not in the weapon get room (forces the player to use the assigned weapon and prevents switching)
			if room != rm_weapon_get
			{
				//Changing weapons
				if (global.input_swap_left_pressed or global.input_swap_right_pressed) and attack_action = 0
				{
					if global.input_swap_right_pressed //Swapping next
					{
						for (var i = 1; i < 10; i++)
						{
							if global.weapon_choice+i > array_length(global.weapon)-1 //If reaching the end of the list
							{
								global.weapon_choice = 0; //Go back to the start (X-Buster)
								flicker_weapon_swap = true;
								scr_make_sound(snd_menu_move,1,1,false);
								break;
							}
							else if global.weapon[global.weapon_choice+i].type != 0 //If next spot is not vacant
							{
								global.weapon_choice = global.weapon_choice+i; //Swap to that weapon
								flicker_weapon_swap = true;
								scr_make_sound(snd_menu_move,1,1,false);
								break;
							}
						}
					}
					else if global.input_swap_left_pressed //Swapping previous
					{
						for (var i = 1; i < 10; i++)
						{
							if global.weapon_choice = 0 //If using the X-Buster
							{
								//Go to the end of the list
								for (var a = 1; a < 9; a++) //a = 1 to skip Giga Attack
								{
									//Check backwards for a weapon to be equipped
									if global.weapon[9-a].type != 0
									{
										global.weapon_choice = 9-a;
										flicker_weapon_swap = true;
										scr_make_sound(snd_menu_move,1,1,false);
										break;
									}
								}
								break;
							}
							else if global.weapon[global.weapon_choice-i].type != 0 //If previous spot is not vacant
							{
								global.weapon_choice = global.weapon_choice-i; //Swap to that weapon
								flicker_weapon_swap = true;
								scr_make_sound(snd_menu_move,1,1,false);
								break;
							}
						}
					}
				}
			
				//Pausing the game
				if global.input_start_pressed and global.life > 0
				{
					global.pause_screen_state = 1; //Fade out in to the pause menu				
					global.pause = true;
				
					fade = instance_create_depth(obj_camera.x,obj_camera.y,0,obj_fade_out)
					fade.fade_speed = global.pause_screen_speed;
				}
			}
		}
	}
	else
	{
		shooting_charge_flicker = false;
		shooting_charge = 0;

		event_user(5); //Air dash end
	}
	
	//Slow status effect
	if slowed > 0
	{
		slowed--;
		xspeed /= 2;
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
	
	event_user(5); //Air dash end
}

//Stop charging sounds
if shooting_charge = 0
	audio_stop_sound(snd_player_x_charge_fadeout);
if machdash_hold = 0
	audio_stop_sound(snd_player_x_machcharge_fadeout);

if place_meeting(x,y+1,obj_solid_slope)
	on_slope = true;
else
	on_slope = false;
	
//Sound for doing a victory pose	
if sprite_index = spr_player_x_victory and image_index >= 4 and image_index < 5
	scr_make_sound(snd_pose,1,1,false);
	
//Check if armour parts are equipped
if global.x_armour_head != 0 or global.x_armour_chest != 0 or global.x_armour_arm != 0 or global.x_armour_leg != 0
{
	//Sound for doing a armour pose
	if sprite_index = spr_player_x_armour_up and image_index >= 4 and image_index < 5
		scr_make_sound(snd_pose,1,1,false);
	if sprite_index = spr_player_x_warp_in and image_index >= 14 and image_index < 15
		scr_make_sound(snd_pose,1,1,false);
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


