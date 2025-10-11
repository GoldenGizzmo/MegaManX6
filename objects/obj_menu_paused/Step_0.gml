/// @description Insert description here
// You can write your code in this editor

if gamepad_is_connected(0)
	global.controller = true;
else
	global.controller = false;
event_user(2);
scr_get_input();


//If paused
if global.pause = true
{	
	if unpause = false
	{
		unpause = true;
		
		//Find all objects, save their stats and pause their alarms
		for (var index = 0; index < instance_count; index++)
		{
			var instance = instance_id_get(index);
			if instance_exists(instance) and instance.object_index != obj_menu_paused
			{	
				//Pause alarms
				for (var alarm_index = 0; alarm_index < 10; alarm_index++)
				{
					var value = instance.alarm[alarm_index];
			
					if value >= 0
						add_alarm(instance,alarm_index,value)
				}
				
				//Pause speed
				if instance.speed != 0
					add_speed(instance,instance.speed)
				//Pause gravity
				if instance.gravity != 0
					add_gravity(instance,instance.gravity)
				//Pause animation
				if instance.image_speed != 0
					add_animate(instance,instance.image_speed)
			}
		}
	}
	
	
	if key_select = false //Can't do anything unti keybinding is done
	{
		//Pausing into the pause menu
		if global.pause_screen_state > 0
		{
			switch (global.pause_menu)
			{
				case "Paused":
					#region
					//Not currently filling up a tank
					if tank_filling < 0
					{
						//Menu naviation
						if global.pause_screen_state < 3 //Cant move through the menus while fading out
						{
							switch (menu_state)
						{
							case "Weapons":
								if global.input_down_pressed //Swapping next
								{
									for (var i = 1; i < 10; i++)
									{
										if menu_position+i < 10
										{
											if global.weapon[menu_position+i].type != 0 //If next spot is not vacant
											{
												menu_position += i; //Swap to that weapon
												scr_make_sound(snd_menu_move,1,1,false);
												break;
											}
										}
										else
										{
											//Move down to options
											scr_make_sound(snd_menu_move,1,1,false);
											menu_state = "Options";
											menu_position = 0;
											break;
										}
									}
								}
								else if global.input_up_pressed and menu_position > 0 //Swapping previous
								{
									for (var i = 1; i < 10; i++)
									{
										if global.weapon[menu_position-i].type != 0 //If previous spot is not vacant
										{
											menu_position -= i; //Swap to that weapon
											scr_make_sound(snd_menu_move,1,1,false);
											break;
										}
									}
								}
				
								//Selecting
								if global.input_jump_pressed
								{
									global.weapon_choice = menu_position;
									event_user(0);
									scr_make_sound(snd_menu_select,1,1,false);
								}
				
								//Moving to sub tanks
								if global.input_right_pressed
								{
									for (var i = 0; i < 3; i++)
									{
										if menu_tank[i] >= 0 //If next spot is not vacant
										{
											menu_position = i; //Swap to that weapon
											scr_make_sound(snd_menu_move,1,1,false);
											menu_state = "Tanks";
											tank_animate = 0;
											break;
										}
									}
								}
								break;
			
							case "Tanks":
								if global.input_right_pressed
								{
									//Check that there's another tank on the right
									for (var i = 1; i < 3; i++)
									{
										//Does not exceed the max of 3 spaces
										if menu_position+i < 3
										{
											if menu_tank[menu_position+i] >= 0 //If next spot is not vacant
											{
												menu_position += i; //Select next
												tank_animate = 0;
												scr_make_sound(snd_menu_move,1,1,false);
												break;
											}
										}
									}
								}
								else if global.input_left_pressed
								{
									//Check that there's another tank on the left
									for (var i = 1; i < 4; i++)
									{
										//If the position is no higher than the 1st position
										if menu_position-i > -1
										{
											if menu_tank[menu_position-i] >= 0 //If next spot is not vacant
											{
												menu_position -= i; //Swap previous
												tank_animate = 0;
												scr_make_sound(snd_menu_move,1,1,false);
												break;
											}
										}
										else
										{	//If there's nothing to the left space, move back to weapons
											scr_make_sound(snd_menu_move,1,1,false);
											menu_state = "Weapons";
											menu_position = 0;
											break;
										}
									}
								}
								else if global.input_down_pressed
								{
									scr_make_sound(snd_menu_move,1,1,false);
									menu_state = "Options";
									menu_position = 0;
								}
								else if global.input_jump_pressed
								{
									//Check if tank has some storage
									if menu_tank[menu_position] > 0
									{
										tank_filling = 0;
										//If full, fully heal
										if menu_tank[menu_position] = global.tank_cap
											tank_filling_full = true;
									}
								}
								break;
				
							case "Options":
								if global.input_right_pressed and menu_position < 3
								{
									scr_make_sound(snd_menu_move,1,1,false);
									menu_position++;
								}
								else if global.input_left_pressed and menu_position > 0
								{
									scr_make_sound(snd_menu_move,1,1,false);
									menu_position--;
								}
								else if global.input_up_pressed
								{
									scr_make_sound(snd_menu_move,1,1,false);
									menu_state = "Weapons";

									for (var i = 9; i > 0; i--)
									{
										if global.weapon[i].type != 0 //If next spot is not vacant
										{
											menu_position = i; //Swap to that weapon
											scr_make_sound(snd_menu_move,1,1,false);
											break;
										}
									}
								}
								else if global.input_jump_pressed
								{
									switch (menu_position)
									{
										case 0: event_user(0); break;
										case 1: 
											global.pause_menu = "Options";
											global.pause_menu_sub = "Bindings";
											menu_position = 0;
											scr_make_sound(snd_menu_select,1,1,false); 
											break;
										case 2: 
											global.pause_menu = "Options";
											menu_position = 0;
											scr_make_sound(snd_menu_select,1,1,false); 
											break;
										case 3: scr_make_sound(snd_menu_denied,1,1,false); break;
									}
								}
								break;
						}
						}
		
		
						//Fading into the screen
						with obj_fade_out
						{
							if alpha >= 1
							{
								if global.pause_screen = false //If pausing in
								{
									global.pause_screen = true;
									global.pause_screen_state = 2;
					
									with obj_menu_paused
										event_user(1);
								}
								else
								{
									global.pause_screen = false;
									global.pause_screen_state = 4;
									global.hud_toggle = true;
								}
				
								fade = instance_create_depth(obj_camera.x,obj_camera.y,0,obj_fade_in)
								fade.fade_speed = global.pause_screen_speed;
			
								instance_destroy();
							}
						}
	
						//Start unpausing
						if global.input_start_pressed
							event_user(0);
			
						//Fully unpause
						if global.pause_screen_state = 4 and !instance_exists(obj_fade_in)
						{
							global.pause_screen_state = 0;
							global.pause = false;
						}
					}
					else
					{
						switch (menu_position)
						{
							case 0: //Sub tank 1
								//If empty or full health, stop
								if (global.subtank_1 = 0 and tank_filling_full = false) or global.life = global.lifemax
								{
									tank_filling = -1;
									tank_filling_full = false;
								}
								else
								{
									tank_filling++;
									if tank_filling%3 = 0
									{
										if global.subtank_1 > 0
											global.subtank_1--;
										global.life += 1;
										scr_make_sound(snd_energy_tank,1,1,false);
									}
								}
								break;
							case 1: //Sub tank 2
								//If empty or full health, stop
								if (global.subtank_2 = 0 and tank_filling_full = false) or global.life = global.lifemax
								{	
									tank_filling = -1;
									tank_filling_full = false;
								}
								else
								{
									tank_filling++;
									if tank_filling%3 = 0
									{
										if global.subtank_2 > 0
											global.subtank_2--;
										global.life += 1;
										scr_make_sound(snd_energy_tank,1,1,false);
									}
								}
								break;
					
							case 2: //Weapon tank
								var check_full = true;	
								tank_filling++;
								if tank_filling%3 = 0
								{
									//Checks every weapon and fills them
									for (var i = 0; i < 9; i++)
									{
										if global.weapon[i] != 0
										{
											if global.weapon[i].ammo < global.weapon[i].ammo_max
											{
												global.weapon[i].ammo++;
												check_full = false;
											}
										}		
									}
									if global.weapontank > 0
										global.weapontank--;
									scr_make_sound(snd_weapon_tank,1,1,false);
								}
								else
									check_full = false;
					
								//If everything is full or the tank is empty
								if check_full = true or (global.weapontank = 0 and tank_filling_full = false)
								{
									tank_filling = -1;
									tank_filling_full = false;
								}
								break;
						}
					}
					
					text_scrolling++;
					#endregion
					break;
				
				case "Options":
					#region
					menu_length = 7;
					if global.pause_menu_sub = "Bindings"
					{
						if global.controller = true
						{
							menu_length = 6;
							if menu_position > menu_length
								menu_position = 0;
						}
						else
							menu_length = 18;
						
						//Avoid these two buttons
						if (menu_position = 8-1 or menu_position = 11-1) and global.input_down_pressed
							menu_position++;
						else if (menu_position = 8+1 or menu_position = 11+1) and global.input_up_pressed
							menu_position--;
					}
				
					if global.input_up_pressed and menu_position > 0
					{
						menu_position--;
						scr_make_sound(snd_menu_move,1,1,false);
					}
					else if global.input_down_pressed and menu_position < menu_length
					{
						menu_position++;
						scr_make_sound(snd_menu_move,1,1,false);
					}			
				
					switch (global.pause_menu_sub)
					{
						case "Options":
							switch (menu_position)
							{
								case 0: //Master volume
									if global.input_left_pressed and global.volume_master > 0
									{
										global.volume_master -= 0.1;
										scr_make_sound(snd_menu_move,1,1,false);
									}
									else if global.input_right_pressed and global.volume_master < 1
									{
										global.volume_master += 0.1;
										scr_make_sound(snd_menu_move,1,1,false);
									}
									break;		
								case 1: //Music volume
									if global.input_left_pressed and global.volume_music > 0
									{
										global.volume_music -= 0.1;
										scr_make_sound(snd_menu_move,1,1,false);
									}
									else if global.input_right_pressed and global.volume_music < 1
									{
										global.volume_music += 0.1;
										scr_make_sound(snd_menu_move,1,1,false);
									}
									break;
								case 2: //SFX volume
									if global.input_left_pressed and global.volume_effect > 0
									{
										global.volume_effect -= 0.1;
										scr_make_sound(snd_menu_move,1,1,false);
									}
									else if global.input_right_pressed and global.volume_effect < 1
									{
										global.volume_effect += 0.1;
										scr_make_sound(snd_menu_move,1,1,false);
									}
									break;
						
								case 3:	//Bindings tab
									if global.input_jump_pressed
									{
										global.pause_menu_sub = "Bindings";
										menu_position = 0;
										scr_make_sound(snd_menu_select,1,1,false);
									}
									break;
								case 4:
									if global.input_jump_pressed
									{
										if global.fps_display = false
											global.fps_display = true;
										else
											global.fps_display = false;
											
										scr_make_sound(snd_menu_select,1,1,false);
									}
									break;
								case 5:
									if global.input_jump_pressed
									{
										if window_get_fullscreen() = false
											window_set_fullscreen(true);
										else
											window_set_fullscreen(false);		
											
										scr_make_sound(snd_menu_select,1,1,false);
									}
									break;
						
								case 6: //Restart game
									if global.input_jump_pressed
										game_restart();
									break;
								case 7: //Exit game
									if global.input_jump_pressed
										game_end();
									break;
							}
						
							if global.input_start_pressed
							{
								global.pause_menu = "Paused";
								menu_position = 0;
								scr_make_sound(snd_menu_move,1,1,false);
							}
							break;
					
						case "Bindings":
							if global.input_jump_pressed
							{
								if menu_position != 11
								{
									scr_make_sound(snd_menu_select,1,1,false);
									key_select = true;
								}
								else
									scr_make_sound(snd_menu_denied,1,1,false);
							}
							else if global.input_start_pressed
							{
								global.pause_menu_sub = "Options";
								menu_position = 0;
								scr_make_sound(snd_menu_move,1,1,false);
							}
							break;
					}
					#endregion
					break;
			}
		}
		else
		{
			//Pause for getting an item or somethin
			if global.pause_delay > 0
			{
				global.pause_delay--
				if global.pause_delay = 0
					global.pause = false
			}
	
			//Healing
			if global.pause_healing > 0
			{
				if global.life < global.pause_healing
				{
					global.life += 0.5; //Healing speed
					scr_make_sound(snd_healing,0.5,1,false);
				}
				else
				{
					global.pause = false;
					global.pause_healing = 0;
				}
			}
		}
	}
	else
	{
		if global.controller = true
		{
			if global.input_start_pressed //Cancel
			{
				scr_make_sound(snd_menu_move,1,1,false);
				key_select = false;
			}
			if gamepad_button_check_pressed(0,gp_face1)
			{
				scr_gamepad_check(gp_face1);
				scr_make_sound(snd_menu_equip,1,1,false);
			}
			else if gamepad_button_check_pressed(0,gp_face2)
			{
				scr_gamepad_check(gp_face2);
				scr_make_sound(snd_menu_equip,1,1,false);
			}
			else if gamepad_button_check_pressed(0,gp_face3)
			{
				scr_gamepad_check(gp_face3);
				scr_make_sound(snd_menu_equip,1,1,false);
			}
			else if gamepad_button_check_pressed(0,gp_face4)
			{
				scr_gamepad_check(gp_face4);
				scr_make_sound(snd_menu_equip,1,1,false);
			}
			else if gamepad_button_check_pressed(0,gp_shoulderl)
			{
				scr_gamepad_check(gp_shoulderl);
				scr_make_sound(snd_menu_equip,1,1,false);
			}
			else if gamepad_button_check_pressed(0,gp_shoulderlb)
			{
				scr_gamepad_check(gp_shoulderlb);
				scr_make_sound(snd_menu_equip,1,1,false);
			}
			else if gamepad_button_check_pressed(0,gp_shoulderr)
			{
				scr_gamepad_check(gp_shoulderr);
				scr_make_sound(snd_menu_equip,1,1,false);
			}
			else if gamepad_button_check_pressed(0,gp_shoulderrb)
			{
				scr_gamepad_check(gp_shoulderrb);
				scr_make_sound(snd_menu_equip,1,1,false);
			}
			else if gamepad_button_check_pressed(0,gp_stickl)
			{
				scr_gamepad_check(gp_stickl);
				scr_make_sound(snd_menu_equip,1,1,false);
			}
			else if gamepad_button_check_pressed(0,gp_stickr)
			{
				scr_gamepad_check(gp_stickr);
				scr_make_sound(snd_menu_equip,1,1,false);
			}
			else if gamepad_button_check_pressed(0,gp_select)
			{
				scr_gamepad_check(gp_select);
				scr_make_sound(snd_menu_equip,1,1,false);
			}
		}
		else
		{
			if keyboard_check_pressed(vk_anykey) 
			{
				//Cancel if using the menu button, can't rebind it
				if global.input_start_pressed
					scr_make_sound(snd_menu_move,1,1,false);
				else
				{
					keyboard[menu_position] = keyboard_key;
					keyboard[8] = keyboard[0]; 
					scr_make_sound(snd_menu_equip,1,1,false);
				}
				key_select = false;
			}
		}
	}
}
else
{
	//Happen once when unpauses, revert everything to how it was
	if unpause = true
	{
		unpause = false;

		for (var index = 0; index < array_length(arr_alarms); index++)
		{
			try
			{
				var instance = arr_alarms[index].instance;
				var alarm_index = arr_alarms[index].index;
				var value = arr_alarms[index].value;
			
				instance.alarm[alarm_index] = value;
			}
			catch(_exception)
			{
				//Do nothing	
			}
		}
	
		for (var index = 0; index < array_length(arr_speed); index++)
		{
			try
			{
				var instance = arr_speed[index].instance;
				var value = arr_speed[index].value;
			
				instance.speed = value;
			}
			catch(_exception) 
			{
				//Do nothing	
			}
		}
		
		for (var index = 0; index < array_length(arr_animate); index++)
		{
			try
			{
				var instance = arr_animate[index].instance;
				var value = arr_animate[index].value;
			
				instance.image_speed = value;
			}
			catch(_exception) 
			{
				//Do nothing	
			}
		}
		
		for (var index = 0; index < array_length(arr_gravity); index++)
		{
			try
			{
				var instance = arr_gravity[index].instance;
				var value = arr_gravity[index].value;
			
				instance.gravity = value;
			}
			catch(_exception) 
			{
				//Do nothing	
			}
		}
		
		//Reset all arrays to prevent insane overlap issues
		arr_alarms = [];
		arr_speed = [];
		arr_animate = [];
		arr_gravity = [];
	}
}









