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
											if menu_position+i < 9
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
											else
												menu_position = 0;
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
											case 3: 
												global.pause_screen_state = 99;
												fade = instance_create_depth(0,0,0,obj_fade_out);
												fade.fade_speed = 0.02;
												
												scr_make_sound(snd_menu_select,1,1,false); 
												break;
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
								//Leave the level
								if global.pause_screen_state = 99
								{
									if obj_fade_out.alpha >= 2
										room_goto(rm_stage_select);
								}
								else
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
						
							if global.input_start_pressed and room != rm_stage_select
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
					
					if room = rm_stage_select
					{
						if global.input_swap_right_pressed
						{
							menu_position = 0;
							scr_make_sound(snd_menu_move,1,1,false);
							global.pause_menu = "Part Selection";
							global.pause_menu_sub = "Options";
						}
						else if global.input_swap_left_pressed
						{
							menu_position = 0;
							scr_make_sound(snd_menu_move,1,1,false);
							global.pause_menu = "Stage Select";
							global.pause_menu_sub = "Options";
						}
					}
					#endregion
					break;
					
				case "Stage Select":
					#region
					if stageselect_state > 0
					{
						//After openning animation
						if stageselect_state = 2
						{
							if global.music != snd_music_stage_select
							{
								if global.music != "Off"
									audio_stop_sound(global.music);
								global.music = snd_music_stage_select;
							}
							
							
							if global.input_right_pressed and menu_position != 3 and menu_position != 7 //Top right and bottom right
							{
								menu_position++;
								scr_make_sound(snd_menu_move_2,1,1,false);
								stageselect_bg_static = 0.5;
							}
							else if global.input_left_pressed and menu_position != 0 and menu_position != 4 //Top left and bottom left
							{
								menu_position--;
								scr_make_sound(snd_menu_move_2,1,1,false);
								stageselect_bg_static = 0.5;
							}
							else if global.input_down_pressed and menu_position < 4 //Move to bottom row
							{
								menu_position += 4;
								scr_make_sound(snd_menu_move_2,1,1,false);
								stageselect_bg_static = 0.5;
							}
							else if global.input_up_pressed and menu_position > 3 //Move to top row
							{
								menu_position -= 4;
								scr_make_sound(snd_menu_move_2,1,1,false);
								stageselect_bg_static = 0.5;
							}
							
							//Select level
							else if global.input_jump_pressed
							{
								scr_get_level(menu_position)
								if level_destination != "Nothing" //Check there's a level
								{
									stageselect_state = 3;
									scr_make_sound(snd_menu_equip,1,1,false);
									stageselect[menu_position].alpha = 1;
								
									fade = instance_create_depth(0,0,0,obj_fade_out);
									fade.fade_speed = 0.02;
								}
								else
									scr_make_sound(snd_menu_denied,1,1,false);
							}
							
							else if global.input_swap_right_pressed
							{
								menu_position = 0;
								scr_make_sound(snd_menu_move,1,1,false);
								global.pause_menu = "Options";
							}
							else if global.input_swap_left_pressed
							{
								menu_position = 0;
								scr_make_sound(snd_menu_move,1,1,false);
								global.pause_menu = "Part Selection";
							}
						}
						else if stageselect_state = 3 //Travel to level
						{
							if obj_fade_out.alpha >= 2
							{
								
								stageselect_state = 4;
								
								//Check if level is already completed or not
								if ds_list_find_index(global.level_list,level_destination) = -1
									global.level_completed = false;
								else
									global.level_completed = true;
									
								instance_create_depth(0,0,0,obj_cutscene_investigator);
							}
						}
						
						//Background fade out effects
						if stageselect_bg_swap > 0
							stageselect_bg_swap -= 0.02;
						if stageselect_bg_static > 0.05
							stageselect_bg_static -= 0.02;
						
						//Openning animation
						if pause_animate%5 = 0 //Go to next portrait
						{
							//If all portraits are done
							if stageselect_entrance > 0
							{
								stageselect_entrance--;
								scr_make_sound(snd_menu_move,1,1.5,false);
								
							}
							else if stageselect_state = 1
							{
								stageselect_state = 2;
								stageselect_bg_swap = 1;
								
								scr_make_sound(snd_menu_boom,1,0.5,false);
							}
						}
						for (var i = 0; i < 8; i++)
						{
							if stageselect_entrance <=  stageselect[i].position and stageselect[i].alpha > 0
							{
								if stageselect[i].alpha > 1
									stageselect[i].alpha = 1;
								else
									stageselect[i].alpha -= 0.1;	
							}
						}
					}
					#endregion
					break;
					
				case "Part Selection":
					#region
					
					//Change music
					if global.music != snd_music_shop
					{
						if global.music != "Off"
							audio_stop_sound(global.music);
						global.music = snd_music_shop;
					}
					
					function scr_menu_move(position_variable)
					{
						if global.input_up_pressed and position_variable > 0
						{
							scr_make_sound(snd_menu_move,1,1,false);
							if global.pause_menu_sub = "Options"
								menu_position--;
							else
								menu_position_sub--;
						}
						else if global.input_down_pressed and position_variable < length-1
						{
							scr_make_sound(snd_menu_move,1,1,false);
							if global.pause_menu_sub = "Options"
								menu_position++;
							else
								menu_position_sub++;
						}
					}
					
					function scr_menu_scroll(_list,position_variable)
					{
						if global.input_up_pressed and position_variable = 0 and scroll > 0
						{
							scr_make_sound(snd_menu_move,1,1,false);
							scroll--;
						}
						else if global.input_down_pressed and position_variable = length-1 and ds_list_size(_list) > length+scroll
						{
							scr_make_sound(snd_menu_move,1,1,false);
							scroll++;
						}
					}
					
					switch (global.pause_menu_sub)
					{
						case "Options": //Top menu
							length = 3;
							scr_menu_move(menu_position);
							
							if global.input_jump_pressed
							{	
								switch (menu_position)
								{
									case 0: 
										if ds_list_size(global.parts_owned) > 0 //Check if list is empty
										{
											global.pause_menu_sub = "Equip"; 
											scr_make_sound(snd_menu_select,1,1,false);
											ds_list_sort(global.parts_owned,true);
										}
										else
											scr_make_sound(snd_menu_denied,1,1,false);
										break;
										
									case 1: 
										if ds_list_size(global.parts_store) > 0 //Check if list is empty
										{
											global.pause_menu_sub = "Develop"; 
											scr_make_sound(snd_menu_select,1,1,false);
										}
										else
											scr_make_sound(snd_menu_denied,1,1,false);
										break;
										
									case 2: 
										//global.pause_menu_sub = "Armour"; 
										scr_make_sound(snd_menu_denied,1,1,false);
										break;
								}
								menu_position_sub = 0;
								scroll = 0;
							}
							break;
					
						case "Equip":
							length = ds_list_size(global.parts_owned);
							if length > length_limit //Limit
								length = length_limit;
							scr_menu_scroll(global.parts_owned,menu_position_sub); //Enable scrolling
							scr_menu_move(menu_position_sub);
							
							if global.input_jump_pressed
							{
								//Finds the ID at this position in the menus
								var find = ds_list_find_value(global.parts_owned,menu_position_sub+scroll);
								
								//Check if part is not equipped
								if ds_list_find_index(global.parts_equipped,find) = -1
								{
									//Check if not at max capacity
									if ds_list_size(global.parts_equipped) < global.parts_amount
									{	
										//Add as equipped
										ds_list_add(global.parts_equipped,find);
										scr_make_sound(snd_menu_equip,1,1,false);
									}
									else
										scr_make_sound(snd_menu_denied,1,1,false);
								}
								else //Unequip part
								{
									//Find the position of the matching ID in the equipped list
									var remove = ds_list_find_index(global.parts_equipped,find);
									ds_list_delete(global.parts_equipped,remove);
									scr_make_sound(snd_menu_move,1,1,false);
								}
							}
							
							
							//Return
							else if global.input_start_pressed
							{
								scr_make_sound(snd_menu_move,1,1,false);
								menu_position_sub = 0;
								scroll = 0;
								global.pause_menu_sub = "Options";
							}
							break;
							
						case "Develop":
							length = ds_list_size(global.parts_store);
							if length > length_limit //Limit
								length = length_limit;
							scr_menu_scroll(global.parts_store,menu_position_sub); //Enable scrolling
							scr_menu_move(menu_position_sub);

							if global.input_jump_pressed
							{
								//Get value of highlighted item
								var find = ds_list_find_value(global.parts_store,menu_position_sub+scroll);
								scr_get_part(find);
								
								//Check if can be afforded
								if global.nightmare_souls >= part_cost
								{	
									//Add to player list of parts
									ds_list_add(global.parts_owned,find);
									
									global.nightmare_souls -= part_cost;
									scr_make_sound(snd_menu_equip,1,1,false); //get a special sound
									
									//Remove bought part
									remove = ds_list_find_index(global.parts_store,find);
									ds_list_delete(global.parts_store,remove);
									
									//Adjust the list to prevent highlighting out of bounds
									if scroll > 0
										scroll--;
									else
									{
										//If at the bottom of the list
										if menu_position_sub = length-1 and length > 1
											menu_position_sub--;
									}
								}
								else
									scr_make_sound(snd_menu_denied,1,1,false);
							}
							
							//Return
							else if global.input_start_pressed
							{
								scr_make_sound(snd_menu_move,1,1,false);
								menu_position_sub = 0;
								scroll = 0;
								global.pause_menu_sub = "Options";
							}
							break;
					}
					
					
					
					
					
					//Swap to the other screens
					if global.input_swap_right_pressed
					{
						menu_position = 0;
						scroll = 0;
						scr_make_sound(snd_menu_move,1,1,false);
						global.pause_menu = "Stage Select";
						global.pause_menu_sub = "Options";
					}
					else if global.input_swap_left_pressed
					{
						menu_position = 0;
						scroll = 0;
						scr_make_sound(snd_menu_move,1,1,false);
						global.pause_menu = "Options";
						global.pause_menu_sub = "Options";
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









