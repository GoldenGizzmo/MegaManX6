/// @description Insert description here
// You can write your code in this editor

if global.pause_screen = true
{
	
	global.hud_toggle = false;
	pause_animate++;
	tank_animate++;
	
	switch (global.pause_menu)
	{
		case "Paused":
			#region
			scr_get_character("X");
			var menu_colour = character_colour;
	
			draw_sprite_ext(spr_white_space,0,x,y,room_width,room_height,0,menu_colour,1)
			draw_sprite_ext(spr_white_space,0,x,y,room_width,room_height,0,c_black,0.5)
	
			draw_sprite_ext(spr_pause_gradient,0,display_get_gui_width()/2,display_get_gui_height()/2,global.ui_scale*2,global.ui_scale,0,c_white,1);
			draw_sprite_ext(spr_pause_gradient,0,display_get_gui_width()/2,display_get_gui_height()/2,global.ui_scale*2,-global.ui_scale,0,c_white,1);
	
			gpu_set_blendmode(bm_add)
			draw_sprite_tiled_ext(spr_pause_grid,0,pause_animate,pause_animate,global.ui_scale/2,global.ui_scale/2,menu_colour,0.3);
			gpu_set_blendmode(bm_normal)
	
			var scale = global.ui_scale/1.25; //Menu size
	
			//Menu Pieces
			draw_sprite_ext(spr_pause_right,0,display_get_gui_width(),0,scale,scale,0,menu_colour,1);
			draw_sprite_ext(spr_pause_bottom,0,0,display_get_gui_height(),scale,scale,0,menu_colour,1);
			draw_sprite_ext(spr_pause_top,0,0,0,scale,scale,0,menu_colour,1);
	
			draw_sprite_ext(spr_pause_right,1,display_get_gui_width(),0,scale,scale,0,c_white,1);
			shader_set(shd_hue);
			shader_set_uniform_f(shader_get_uniform(shd_hue,"u_Position"),pause_hue);
			draw_sprite_ext(spr_pause_right,2,display_get_gui_width(),0,scale,scale,0,c_white,1);
			shader_reset();
			draw_sprite_ext(spr_pause_bottom,1,0,display_get_gui_height(),scale,scale,0,c_white,1);
			draw_sprite_ext(spr_pause_top,1,0,0,scale,scale,0,c_white,1);
			
			//Player mugshot
			draw_sprite_ext(mugshot,blink,display_get_gui_width()-(96*scale),(8*scale),scale,scale,0,c_white,1);
			var amount = (global.life/global.lifemax);
			if global.life > 0
				draw_rectangle_color(display_get_gui_width()-(171*scale),(82*scale),display_get_gui_width()-(171*scale)+(155*scale)*amount,(82*scale)+(6*scale),c_yellow,c_lime,c_lime,c_yellow,0);
			draw_text_transformed_color(display_get_gui_width()-(163*scale),(69*scale),string_repeat("0",max(0,2-string_length(string(global.life))))+string(global.life)+"/"+string_repeat("0",max(0,2-string_length(string(global.lifemax))))+string(global.lifemax),scale,scale,0,c_white,c_white,c_white,c_white,1);
	
			//Rank
			scr_get_rank();
			draw_sprite_ext(spr_pause_rank,rank_letter,display_get_gui_width()-(113*scale),(60*scale),scale,scale,0,c_white,1);
			//Heart Tanks collected
			draw_text_transformed_color(display_get_gui_width()-(159*scale),(96*scale),global.hearttank,scale,scale,0,c_white,c_white,c_white,c_white,1);
			//Nightmare Souls collected
			draw_text_transformed_color(display_get_gui_width()-(159*scale),(113*scale),global.nightmare_souls,scale,scale,0,c_white,c_white,c_white,c_white,1);
			//Reploids rescued
			draw_text_transformed_color(display_get_gui_width()-(69*scale),(96*scale),string(global.rescue_count)+"/"+string(global.rescue_max),scale,scale,0,c_white,c_white,c_white,c_white,1);
			//Playtime
			draw_seconds = (global.playtime div 60)%60;
			draw_minutes = (global.playtime div 3600)%60;
			draw_hours = (global.playtime div 12960000)%60;
			var playtime = string_repeat("0",max(0,2-string_length(string(draw_hours))))+string(draw_hours)+":"+string_repeat("0",max(0,2-string_length(string(draw_minutes))))+string(draw_minutes)+":"+string_repeat("0",max(0,2-string_length(string(draw_seconds))))+string(draw_seconds);
			draw_text_transformed_color(display_get_gui_width()-(69*scale),(113*scale),playtime,scale,scale,0,c_white,c_white,c_white,c_white,1);
	
			//Weapons
			for (var i = 0; i < 9; i++)
			{
				if global.weapon[i].type != 0
				{
					//Icon
					draw_sprite_ext(spr_hud_weapon,i,(42*scale),(31*scale)+(17*scale*i),scale,scale,0,c_white,1);	
			
					//Ammo bar
					var amount = (global.weapon[i].ammo/global.weapon[i].ammo_max);
					draw_rectangle_color((57*scale),(35*scale)+(17*scale*i),(62*scale)+(120*scale),(35*scale)+(17*scale*i)+(3*scale),menu_colour,menu_colour,menu_colour,menu_colour,0);
					draw_set_alpha(0.7);
					draw_rectangle_color((57*scale),(35*scale)+(17*scale*i),(62*scale)+(120*scale),(35*scale)+(17*scale*i)+(3*scale),c_black,c_black,c_black,c_black,0);
					draw_set_alpha(1);
			
					//Colours for the ammo bars
					scr_weapon_menus(global.weapon[i].type);
					if global.weapon[i].ammo > 0
						draw_rectangle_color((57*scale),(35*scale)+(17*scale*i),(62*scale)+(120*scale)*amount,(35*scale)+(17*scale*i)+(3*scale),weapon_bar_colour_2,weapon_bar_colour_1,weapon_bar_colour_1,weapon_bar_colour_2,0);
		
					//Text
					var text_colour = menu_colour;
					if i = menu_position and menu_state = "Weapons" //If selected
						text_colour = c_white;
					var text_name = global.weapon[i].type;
					if global.weapon[i].type = "X-Saber"
						text_name = "X-Buster";	
					draw_text_transformed_color((65*scale),(21*scale)+(17*scale*i),string_upper(text_name),scale,scale,0,text_colour,text_colour,text_colour,text_colour,1);
				}
			}
	
			//Cursor
			if menu_state = "Weapons"
			{
				draw_sprite_ext(spr_pause_cursor,0,(25*scale),(31*scale)+(17*scale*menu_position),scale,scale,0,character_colour,1);
				shader_set(shd_hue);
				shader_set_uniform_f(shader_get_uniform(shd_hue,"u_Position"),pause_hue);
				draw_sprite_ext(spr_pause_cursor,1,(25*scale),(31*scale)+(17*scale*menu_position),scale,scale,0,c_white,1);
				shader_reset();
			}
			
			//Equipped Parts
			for (var i = 0; i < global.parts_amount-1; i++) //Background
				draw_sprite_ext(spr_pause_parts,0,display_get_gui_width()-(171*scale)+(19*i*scale),(148*scale),scale,scale,0,menu_colour,1);
			for (var i = 0; i < global.parts_amount; i++) //Equipped Parts
				if !is_undefined(ds_list_find_value(global.parts_equipped,i))
					draw_sprite_ext(spr_partselect_icon,ds_list_find_value(global.parts_equipped,i),display_get_gui_width()-(186*scale)+(19*i*scale),(149*scale),scale,scale,0,c_white,1);
	
			//Sub Tank 1
			if global.subtank_1 >= 0
			{
				//Sprite
				var animate = 0
				if menu_state = "Tanks" and menu_position = 0
					animate = tank_animate/3;
				if global.subtank_1 = global.tank_cap
					draw_sprite_ext(spr_pickup_subtank_full,0,display_get_gui_width()-(174*scale),(197*scale),scale,scale,0,c_white,1);	

				draw_sprite_ext(spr_pickup_subtank_1,animate,display_get_gui_width()-(174*scale),(197*scale),scale,scale,0,c_white,1);	
				//Bar
				if global.subtank_1 > 0
					draw_rectangle_color(display_get_gui_width()-(187*scale),(212*scale),display_get_gui_width()-(187*scale)+(26*scale)*(global.subtank_1/global.tank_cap),(212*scale)+(3*scale),c_yellow,c_lime,c_lime,c_yellow,0);
			}
	
			//Sub Tank 2
			if global.subtank_2 >= 0
			{
				var animate = 0
				if menu_state = "Tanks" and menu_position = 1
					animate = tank_animate/3;
				if global.subtank_2 = global.tank_cap
					draw_sprite_ext(spr_pickup_subtank_full,0,display_get_gui_width()-(174*scale)+(37*scale),(197*scale),scale,scale,0,c_white,1);	

				draw_sprite_ext(spr_pickup_subtank_2,animate,display_get_gui_width()-(174*scale)+(37*scale),(197*scale),scale,scale,0,c_white,1);	
				//Bar
				if global.subtank_2 > 0
					draw_rectangle_color(display_get_gui_width()-(187*scale)+(37*scale),(212*scale),display_get_gui_width()-(187*scale)+(37*scale)+(26*scale)*(global.subtank_2/global.tank_cap),(212*scale)+(3*scale),c_yellow,c_lime,c_lime,c_yellow,0);
			}
	
			//Weapon Tank
			if global.weapontank >= 0
			{
				var animate = 0
				if menu_state = "Tanks" and menu_position = 2 
					animate = tank_animate/3;
				if global.weapontank = global.tank_cap
					draw_sprite_ext(spr_pickup_weapontank_full,0,display_get_gui_width()-(174*scale)+(74*scale),(197*scale),scale,scale,0,c_white,1);	
		
				draw_sprite_ext(spr_pickup_weapontank,animate,display_get_gui_width()-(174*scale)+(74*scale),(197*scale),scale,scale,0,c_white,1);	
				//Bar
				if global.weapontank > 0
					draw_rectangle_color(display_get_gui_width()-(187*scale)+(74*scale),(212*scale),display_get_gui_width()-(187*scale)+(74*scale)+(26*scale)*(global.weapontank/global.tank_cap),(212*scale)+(3*scale),c_yellow,c_orange,c_orange,c_yellow,0);
			}
	
			//Selection box for options section
			if menu_state = "Options"
			{
				draw_sprite_ext(spr_pause_options,pause_animate/3,(290*scale)+(16*scale*menu_position),display_get_gui_height()-(30*scale),scale,scale,0,character_colour,1);
				shader_set(shd_hue);
				shader_set_uniform_f(shader_get_uniform(shd_hue,"u_Position"),pause_hue);
				draw_sprite_ext(spr_pause_options,pause_animate/3,(290*scale)+(16*scale*menu_position),display_get_gui_height()-(30*scale),scale,scale,0,c_white,1);
				shader_reset();
			}
	
			//Get description for things
			menu_description = "Nothing";
			switch (menu_state)
			{
				case "Weapons":
					scr_weapon_menus(global.weapon[menu_position].type);
					menu_description = weapon_description; 
					break;
				case "Tanks":
					switch (menu_position)
					{
						case 0: 
						case 1:
							menu_description = "Sub Tank: Select to refill Life Energy stored. Stores Life Energy collected while at full health."; break;
						case 2: menu_description = "Weapon Tank: Select to refill all Weapon Energy stored. Stores Weapon Energy collected while all weapons are at maximum ammo."; break;
					}
					break;
				case "Options":
					switch (menu_position)
					{
						case 0: menu_description = "Return to game."; break;
						case 1: menu_description = "Controller and keyboard bindings."; break;
						case 2: menu_description = "Option menu."; break;
						case 3: menu_description = "Exit and return to stage selection."; break;
					}
					break;
			}
			
			//Check if highlighting something different
			if text_change != menu_description
			{
				text_change = menu_description
				text_scrolling = 0; //Refresh the scrolling
			}
			
			if menu_description != "Nothing"
			{
				var text = string_copy(menu_description,0,text_scrolling)
				draw_text_ext_transformed_colour((98*scale),display_get_gui_height()-(36*scale),text,14,80*scale,scale/2,scale/2,0,c_white,c_white,c_white,c_white,1);
			}
			#endregion
			break;
			
		case "Options":
			#region 
			var scale = global.ui_scale/1.25; //Menu size
			draw_sprite_tiled_ext(spr_options_background,0,pause_animate,pause_animate,global.ui_scale,global.ui_scale,c_white,1);
			
			//Heading
			draw_set_font(global.fnt_larger);
				draw_set_halign(fa_center);
					draw_text_transformed_color(display_get_gui_width()/2,0+(20*global.ui_scale),string_upper(global.pause_menu_sub),global.ui_scale,global.ui_scale,0,c_white,c_white,c_white,c_white,1);
				draw_set_halign(fa_left);
			draw_set_font(global.fnt_game);
			
			if global.pause_menu_sub = "Options"
			{
				//Draw options
				for (var i = 0; i < 8; i++)
				{
					option_name = "Nothing";
					option_choice = "Nothing";
					option_select = c_grey;
					switch (i)
					{
						case 0:
							option_name = "Master Volume";
							option_choice = string(round(global.volume_master*100))+"%";
							break;			
						case 1:
							option_name = "Music Volume";
							option_choice = string(round(global.volume_music*100))+"%";
							break;
						case 2:
							option_name = "SFX Volume";
							option_choice = string(round(global.volume_effect*100))+"%";
							break;							
						
						case 3:
							option_name = "Button Bindings";
							break;
						case 4:
							option_name = "Toggle FPS Display";
							option_choice = "Off";
							if global.fps_display = true
								option_choice = "On";
							break;
						case 5:
							option_name = "Toggle Fullscreen";
							option_choice = "Off";
							if window_get_fullscreen() = true
								option_choice = "On";
							break;
						
						case 6:
							option_name = "Restart Game";
							break;
						case 7:
							option_name = "Quit Game";
							break;
					}
					//If selected
					if menu_position = i
						option_select = c_white;
				
					//Draw option name
					if option_name != "Nothing"
						draw_text_transformed_color(display_get_gui_width()/2-(90*global.ui_scale),0+(50*global.ui_scale)+(18*global.ui_scale*i),option_name,global.ui_scale,global.ui_scale,0,option_select,option_select,option_select,option_select,1);
					draw_set_halign(fa_right);
						if option_choice != "Nothing" //Draw option setting
							draw_text_transformed_color(display_get_gui_width()/2+(90*global.ui_scale),0+(50*global.ui_scale)+(18*global.ui_scale*i),option_choice,global.ui_scale,global.ui_scale,0,option_select,option_select,option_select,option_select,1);
					draw_set_halign(fa_left);
				}
			}
			else if global.pause_menu_sub = "Bindings"
			{
				if global.controller = true
				{
					for (var i = 0; i < 7; i++)
					{
						var scale = global.ui_scale;
						var x_pos = display_get_gui_width()/2-(10*scale);
						var y_pos = 70*scale;
					
						//Colours
						var colour = c_grey;
						if menu_position = i //If highlighted
							colour = c_white;
						
						//Offset
						var offset_x = -40;
						var offset_y = 0;
	
						key_list[0] = "Attack"; 
						key_list[1] = "Jump"; 
						key_list[2] = "Special Atack"; 
						key_list[3] = "Dash"; 
						key_list[4] = "Giga Attack";	
						key_list[5] = "Swap Left"; 
						key_list[6] = "Swap Right";
						draw_text_transformed_color(x_pos+(offset_x*scale),y_pos+(10*scale*(i+offset_y)),key_list[i],scale,scale,0,colour,colour,colour,colour,1)

						//Draw actual keys
						scr_controllerbinds(controller[i+4]);
						var key_display = button;
						if key_select = true and menu_position = i
							key_display = "...";
						draw_text_transformed_color(x_pos+((offset_x+100)*scale),y_pos+(10*scale*(i+offset_y)),key_display,scale,scale,0,colour,colour,colour,colour,1)	
					}
				}
				else
				{
					for (var i = 0; i < array_length(keyboard)-1; i++)
					{
						var scale = global.ui_scale;
						var x_pos = display_get_gui_width()/2-(50*scale);
						var y_pos = 70*scale;
				
						//Colours
						var colour = c_grey;
						if menu_position = i //If highlighted
							colour = c_white;
						
						//Offset
						var offset_x = -80;
						var offset_y = 0;
						if i > 8
							offset_y -= 1;
						if i > 11
						{
							offset_x = 50;
							offset_y = -12;
						}
					
						key_list[0] = "Up";
						key_list[1] = "Left";
						key_list[2] = "Down"; 
						key_list[3] = "Right"; 
	
						key_list[4] = "Attack"; 
						key_list[5] = "Jump"; 
						key_list[6] = "Special Attack"; 
						key_list[7] = "Dash"; 
						key_list[8] = "Giga Attack"; //Ignore
	
						key_list[9] = "Swap Left"; 
						key_list[10] = "Swap Right"; 
			
						key_list[11] = "Start [Fixed]"; //Ignore
						key_list[12] = "Menu Up";
						key_list[13] = "Menu Left";
						key_list[14] = "Menu Down"; 
						key_list[15] = "Menu Right"; 
						key_list[16] = "Menu Unequip";
						key_list[17] = "Menu Select";
						key_list[18] = "Menu Return"; 
					
						if !(i = 8 or i = 11) 
						{
							draw_text_transformed_color(x_pos+(offset_x*scale),y_pos+(10*scale*(i+offset_y)),key_list[i],scale,scale,0,colour,colour,colour,colour,1)
			
							//Draw actual keys
							scr_keybinds();
							var key_display = key[keyboard[i]];
							if key_select = true and menu_position = i
								key_display = "...";
							draw_text_transformed_color(x_pos+((offset_x+100)*scale),y_pos+(10*scale*(i+offset_y)),key_display,scale,scale,0,colour,colour,colour,colour,1)	
						}
					}
				}
			
			}
			
			if room != rm_stage_select
			{
				//Guide to exit menu
				draw_set_halign(fa_center);
					draw_text_transformed_color(display_get_gui_width()/2+(10*scale),display_get_gui_height()-(20*global.ui_scale),"Press [Start] to Exit",global.ui_scale,global.ui_scale,0,c_white,c_white,c_white,c_white,1);
				draw_set_halign(fa_left);
				
			}
			else
			{		
				if global.pause_menu_sub != "Options"
				{
					draw_set_halign(fa_center);
						draw_text_transformed_color(display_get_gui_width()/2+(10*scale),display_get_gui_height()-(30*global.ui_scale),"Press [Start] to Exit",global.ui_scale,global.ui_scale,0,c_white,c_white,c_white,c_white,1);
					draw_set_halign(fa_left);
				}

				//Selection at the bottom for next menus
				draw_sprite_ext(spr_stageselect_words_frame,pause_animate/5,-(11*scale),display_get_gui_height(),scale,scale,0,c_white,1)
				draw_sprite_ext(spr_stageselect_words_frame,pause_animate/5,display_get_gui_width()+(11*scale),display_get_gui_height(),-scale,scale,0,c_white,1)
				//Bottom text
				draw_sprite_ext(spr_stageselect_words_stages,pause_animate/5,(57*scale),display_get_gui_height()-(13*scale),scale,scale,0,c_white,1)
				draw_sprite_ext(spr_stageselect_words_parts,pause_animate/5,display_get_gui_width()-(57*scale),display_get_gui_height()-(13*scale),scale,scale,0,c_white,1)
			
			}
			#endregion
			break;
		
		case "Stage Select":
			#region 
			var scale = global.ui_scale/1.25; //Menu size
	
			draw_sprite_ext(spr_white_space,0,x,y,room_width,room_height,0,c_black,1)
			scr_get_level(menu_position);
			if level_background != "Nothing" and stageselect_state > 1
			{
				draw_sprite_tiled_ext(level_background,0,(pause_animate*2),0,global.ui_scale,global.ui_scale,c_white,1);
				gpu_set_blendmode(bm_add)
				draw_sprite_tiled_ext(level_background,0,(pause_animate*2),0,global.ui_scale,global.ui_scale,level_colour,1);
				gpu_set_blendmode(bm_normal)
			}
			//Coloured borders
			draw_sprite_ext(spr_stageselect_gradient,0,display_get_gui_width()/2,-35*global.ui_scale,global.ui_scale*2,global.ui_scale,0,level_colour,1);
			draw_sprite_ext(spr_stageselect_gradient,0,display_get_gui_width()/2,display_get_gui_height()+35*global.ui_scale,global.ui_scale*2,-global.ui_scale,0,level_colour,1);
	
			gpu_set_blendmode(bm_add)
			draw_sprite_tiled_ext(spr_pause_grid,0,pause_animate,pause_animate,global.ui_scale/2,global.ui_scale/2,level_colour,0.3);
			gpu_set_blendmode(bm_normal)
			
			draw_sprite_tiled_ext(spr_stageselect_static,pause_animate,0,0,scale,scale,c_white,stageselect_bg_static);
			draw_sprite_ext(spr_white_space,0,x,y,room_width,room_height,0,c_white,stageselect_bg_swap);
			
			//Investigator boxes
			var pos_x = display_get_gui_width()/2;
			var pos_y = display_get_gui_height()/2+(8*scale)
			draw_sprite_ext(spr_stageselect,0,pos_x,pos_y,scale,scale,0,c_white,1)

			function scr_get_position(position)
			{
				select_x = 0;
				select_y = 0;
				switch (position)
				{
					//Top
					case 0:
						select_x = -137;
						select_y = -58;
						break;
					case 1:
						select_x = -76;
						select_y = -92;
						break;
					case 2:
						select_x = 76;
						select_y = -92;
						break;
					case 3:
						select_x = 137;
						select_y = -58;
						break;
						
					//Secret
					case 2.5:
						select_x = 0;
						select_y = -107;
						break;
					
					//Bottom
					case 4:
						select_x = -137;
						select_y = 58;
						break;
					case 5:
						select_x = -76;
						select_y = 92;
						break;
					case 6:
						select_x = 76;
						select_y = 92;
						break;
					case 7:
						select_x = 137;
						select_y = 58;
						break;
				}
			}
			
			//Draw portraits
			for (var i = 0; i < 8; i++)
			{
				scr_get_position(i);
				scr_get_level(i);
				//If level is not already completed
				if ds_list_find_index(global.level_list,level_destination) = -1
					draw_sprite_ext(spr_stageselect_portrait,i,pos_x+(select_x*scale),pos_y+(select_y*scale),scale,scale,0,c_white,1)	
				else
					draw_sprite_ext(spr_stageselect_portrait_completed,i,pos_x+(select_x*scale),pos_y+(select_y*scale),scale,scale,0,c_white,1)	
				
				//If not selected, be slightly dim
				scr_get_level(menu_position);
				if menu_position != i
				{
					draw_sprite_ext(spr_stageselect_overlay,0,pos_x+(select_x*scale),pos_y+(select_y*scale),scale,scale,0,c_black,0.5)
					//Static effect
					draw_sprite_ext(spr_stageselect_portrait_static,pause_animate,pos_x+(select_x*scale),pos_y+(select_y*scale),scale,scale,0,c_white,0.075);
				}
			
				if stageselect[i].alpha > 1
					draw_sprite_ext(spr_stageselect_overlay,0,pos_x+(select_x*scale),pos_y+(select_y*scale),scale,scale,0,make_color_rgb(16,16,8),1)
				else
					draw_sprite_ext(spr_stageselect_overlay,0,pos_x+(select_x*scale),pos_y+(select_y*scale),scale,scale,0,c_white,stageselect[i].alpha)
			}
			
		
			
			//Draw selection box afer opening animation
			if stageselect_state > 1
			{
				scr_get_position(menu_position)
				draw_sprite_ext(spr_stageselect_select,pause_animate/5,pos_x+(select_x*scale),pos_y+(select_y*scale),scale,scale,0,c_white,1);
			
				//Level text
				draw_set_halign(fa_center);
					draw_set_font(global.fnt_larger)
					draw_text_ext_transformed_color(display_get_gui_width()/2+(116*scale),display_get_gui_height()/2-(2*scale),level_name,15,10*scale,scale/1.25,scale/1.25,0,c_white,c_white,c_white,c_white,1);
			
					draw_set_font(global.fnt_game)
					//draw_text_ext_transformed_color(display_get_gui_width()/2-(113*scale),display_get_gui_height()/2-(10*scale),level_description,12,30*scale,scale/2,scale/2,0,c_white,c_white,c_white,c_white,1);
				draw_set_halign(fa_left);
				
				//World map icon
				if level_name != "Unknown"
					draw_sprite_ext(spr_stageselect_map,pause_animate/5,display_get_gui_width()/2+(level_map_x*scale),display_get_gui_height()/2+(level_map_y*scale),scale,scale,0,c_white,1)
			}
			
			//Selection at the bottom for next menus
			draw_sprite_ext(spr_stageselect_words_frame,pause_animate/5,-(11*scale),display_get_gui_height(),scale,scale,0,c_white,1)
			draw_sprite_ext(spr_stageselect_words_frame,pause_animate/5,display_get_gui_width()+(11*scale),display_get_gui_height(),-scale,scale,0,c_white,1)
			//Bottom text
			if stageselect_state > 1
			{
				draw_sprite_ext(spr_stageselect_words_parts,pause_animate/5,(57*scale),display_get_gui_height()-(13*scale),scale,scale,0,c_white,1)
				draw_sprite_ext(spr_stageselect_words_options,pause_animate/5,display_get_gui_width()-(57*scale),display_get_gui_height()-(13*scale),scale,scale,0,c_white,1)
			}
			#endregion
			break;
			
		case "Part Selection":
			#region 
			scr_get_character("X");
			var menu_colour = character_colour;
	
			draw_sprite_ext(spr_white_space,0,x,y,room_width,room_height,0,menu_colour,1)
			draw_sprite_ext(spr_white_space,0,x,y,room_width,room_height,0,c_black,0.5)
	
			draw_sprite_ext(spr_pause_gradient,1,display_get_gui_width()/2,display_get_gui_height()/2,global.ui_scale*2,global.ui_scale,0,c_white,1);
			draw_sprite_ext(spr_pause_gradient,1,display_get_gui_width()/2,display_get_gui_height()/2,global.ui_scale*2,-global.ui_scale,0,c_white,1);
	
			gpu_set_blendmode(bm_add)
			draw_sprite_tiled_ext(spr_pause_grid,0,pause_animate,pause_animate,global.ui_scale/2,global.ui_scale/2,menu_colour,0.3);
			gpu_set_blendmode(bm_normal)
	
			var scale = global.ui_scale/1.25; //Menu size
			
			#region Top Menu (Options)
			var menu_pos_x = 25;
			var menu_pos_y = 100;
			
			function scr_part_catagory(position,_x,_y,_string,_scale,_colour)
			{
				draw_sprite_ext(spr_partselect_catagory,0,_x*_scale,_y*_scale,_scale,_scale,0,_colour,1)
				
				var select_colour = _colour;
				if menu_position = position
					select_colour = c_white;
				
				draw_text_transformed_color((_x*_scale)+(10*_scale),(_y*_scale)-(2*_scale),_string,_scale,_scale,0,select_colour,select_colour,select_colour,select_colour,1)
			}
			
			//Cursor
			draw_sprite_ext(spr_pause_cursor,0,(menu_pos_x*scale)-(9*scale),(menu_pos_y*scale)+(17*scale*menu_position)+(6*scale),scale,scale,0,menu_colour,1);
			shader_set(shd_hue);
			shader_set_uniform_f(shader_get_uniform(shd_hue,"u_Position"),pause_hue);
			draw_sprite_ext(spr_pause_cursor,1,(menu_pos_x*scale)-(9*scale),(menu_pos_y*scale)+(17*scale*menu_position)+(6*scale),scale,scale,0,c_white,1);
			shader_reset();
			
			scr_part_catagory(0,menu_pos_x,menu_pos_y+(17*0),"Equip Parts",scale,menu_colour);
			scr_part_catagory(1,menu_pos_x,menu_pos_y+(17*1),"Develop Parts",scale,menu_colour);
			scr_part_catagory(2,menu_pos_x,menu_pos_y+(17*2),"Change Armor",scale,menu_colour);
			
			//Draw nightmare soul counter
			var soul_x_pos = menu_pos_x*scale;
			var soul_y_pos = (menu_pos_y*scale)+(17*scale*4)+(10*scale);
			draw_sprite_ext(spr_hud_souls,pause_animate/7,soul_x_pos,soul_y_pos,global.ui_scale,global.ui_scale,0,c_white,1);
			//Souls text
			var soul_text = string_repeat("0",max(0,5-string_length(string(global.nightmare_souls))))+string(global.nightmare_souls);
			var soul_text_colour = make_color_rgb(64,132,244);
			draw_text_transformed_color(soul_x_pos+28*global.ui_scale,soul_y_pos-16*global.ui_scale,soul_text,global.ui_scale,global.ui_scale,0,soul_text_colour,soul_text_colour,soul_text_colour,soul_text_colour,1);
			
			#endregion
			#region Sub Menu
			if global.pause_menu_sub != "Options"
			{
				var menu_pos_x = 170;
				var menu_pos_y = 60;
				
				function scr_part_item(position,_x,_y,_part,_scale,_colour)
				{
					scr_get_part(_part);
					
					var select_colour = _colour;
					if menu_position_sub = position
						select_colour = c_white;
					
					draw_sprite_ext(spr_partselect_icon,_part,(_x*_scale)+(1*_scale),(_y*_scale)+(2*_scale),_scale,_scale,0,c_white,1)
					draw_sprite_ext(spr_partselect_item,0,_x*_scale,_y*_scale,_scale,_scale,0,_colour,1);
					draw_sprite_ext(spr_partselect_item,1,_x*_scale,_y*_scale,_scale,_scale,0,c_white,1);
				
					draw_text_transformed_color((_x*_scale)+(28*_scale),(_y*_scale)+(0*_scale),part_name,_scale,_scale,0,select_colour,select_colour,select_colour,select_colour,1)
				}
			
				switch (global.pause_menu_sub)
				{
					case "Equip":
						//Draw owned parts to equip
						for (var i = 0; i < length; i++)
						{
							if ds_list_size(global.parts_owned) > i //Check if there's a value
							{	
								scr_part_item(i,menu_pos_x,menu_pos_y+(19*i),ds_list_find_value(global.parts_owned,i+scroll),scale,menu_colour)
							
								//Check if equipped
								var find = ds_list_find_value(global.parts_owned,i+scroll); //Find ID
								if ds_list_find_index(global.parts_equipped,find) != -1
									draw_sprite_ext(spr_partselect_item,2,menu_pos_x*scale,(menu_pos_y*scale)+(19*i*scale),scale,scale,0,c_white,1);
							}
						}

						//Cursor
						draw_sprite_ext(spr_pause_cursor,0,(menu_pos_x*scale)-(9*scale),(menu_pos_y*scale)+(19*scale*menu_position_sub)+(9*scale),scale,scale,0,menu_colour,1);
						shader_set(shd_hue);
						shader_set_uniform_f(shader_get_uniform(shd_hue,"u_Position"),pause_hue);
						draw_sprite_ext(spr_pause_cursor,1,(menu_pos_x*scale)-(9*scale),(menu_pos_y*scale)+(19*scale*menu_position_sub)+(9*scale),scale,scale,0,c_white,1);

						//Up and down scrolling arrow
						y = ystart+dsin((current_time)*0.4)*4;
						if scroll > 0
							draw_sprite_ext(spr_partselect_scroll,1,(menu_pos_x*scale)+(60*scale),(menu_pos_y*scale)-(40*scale)+y,scale,scale,0,c_white,1);
						if length_limit+scroll < ds_list_size(global.parts_owned)
							draw_sprite_ext(spr_partselect_scroll,0,(menu_pos_x*scale)+(60*scale),(menu_pos_y*scale)+(19*scale*length_limit)+(40*scale)-y,scale,scale,0,c_white,1);
						shader_reset();
						
						//Draw equipped part background
						draw_sprite_ext(spr_partselect_equipped,0,(menu_pos_x*scale)+(140*scale),(menu_pos_y*scale)+(1*scale),scale,scale,0,menu_colour,1);
						for (var i = 1; i < global.parts_amount; i++)
						{
							draw_sprite_ext(spr_partselect_equipped,1,(menu_pos_x*scale)+(140*scale),(menu_pos_y*scale)-(2*scale)+(24*scale*i),scale,scale,0,menu_colour,1);
							shader_set(shd_hue);
							shader_set_uniform_f(shader_get_uniform(shd_hue,"u_Position"),pause_hue);	
							draw_sprite_ext(spr_partselect_equipped,2,(menu_pos_x*scale)+(140*scale),(menu_pos_y*scale)-(2*scale)+(24*scale*i),scale,scale,0,c_white,1);
							shader_reset();
						}
						//Parts
						for (var i = 0; i < global.parts_amount; i++)
							if !is_undefined(ds_list_find_value(global.parts_equipped,i))
								draw_sprite_ext(spr_partselect_icon,ds_list_find_value(global.parts_equipped,i),(menu_pos_x*scale)+(141*scale),(menu_pos_y*scale)+(2*scale)+(24*scale*i),scale,scale,0,c_white,1);
						break;
						
					case "Develop":
						//Draw owned parts to equip
						for (var i = 0; i < length; i++)
						{
							if ds_list_size(global.parts_store) > i //Check if there's a value
							{
								scr_part_item(i,menu_pos_x,menu_pos_y+(19*i),ds_list_find_value(global.parts_store,i+scroll),scale,menu_colour)
							
								var select_colour = menu_colour;
								if part_cost > global.nightmare_souls	
									select_colour = c_maroon;
							
								if menu_position_sub = i
								{
									select_colour = c_white;
									if part_cost > global.nightmare_souls	
										select_colour = c_red;
								}
							
								//Draw price for part
								draw_sprite_ext(spr_partselect_cost,0,(menu_pos_x*scale)+(115*scale),(menu_pos_y*scale)+(19*i*scale),scale,scale,0,menu_colour,1);
								draw_sprite_ext(spr_partselect_cost,1,(menu_pos_x*scale)+(115*scale),(menu_pos_y*scale)+(19*i*scale),scale,scale,0,select_colour,1);
								draw_text_transformed_color((menu_pos_x*scale)+(115*scale)+(12*scale),(menu_pos_y*scale)+(19*i*scale),part_cost,scale,scale,0,select_colour,select_colour,select_colour,select_colour,1)
							}
						}

						//Cursor
						draw_sprite_ext(spr_pause_cursor,0,(menu_pos_x*scale)-(9*scale),(menu_pos_y*scale)+(19*scale*menu_position_sub)+(9*scale),scale,scale,0,menu_colour,1);
						shader_set(shd_hue);
						shader_set_uniform_f(shader_get_uniform(shd_hue,"u_Position"),pause_hue);
						draw_sprite_ext(spr_pause_cursor,1,(menu_pos_x*scale)-(9*scale),(menu_pos_y*scale)+(19*scale*menu_position_sub)+(9*scale),scale,scale,0,c_white,1);
						
						//Up and down scrolling arrow
						y = ystart+dsin((current_time)*0.4)*4;
						if scroll > 0
							draw_sprite_ext(spr_partselect_scroll,1,(menu_pos_x*scale)+(60*scale),(menu_pos_y*scale)-(40*scale)+y,scale,scale,0,c_white,1);
						if length_limit+scroll < ds_list_size(global.parts_store)
							draw_sprite_ext(spr_partselect_scroll,0,(menu_pos_x*scale)+(60*scale),(menu_pos_y*scale)+(19*scale*length_limit)+(40*scale)-y,scale,scale,0,c_white,1);
						shader_reset();
						break;
						
					case "Armour":
					
						break;
				}
			}
			#endregion
			
			//Top hud
			draw_sprite_ext(spr_partselect_top,0,0,0,scale,scale,0,menu_colour,1);
			draw_sprite_ext(spr_partselect_top,1,0,0,scale,scale,0,c_white,1);
	
			//Draw text
			if global.pause_menu_sub = "Options"
			{
				var text = "Hey X, it's your pal Douglas! Looking have to some Parts developed?";
			}
			else
			{
				//Get value of highlighted item
				var find = ds_list_find_value(global.parts_owned,menu_position_sub+scroll);
				if global.pause_menu_sub = "Develop"
					find = ds_list_find_value(global.parts_store,menu_position_sub+scroll);
				scr_get_part(find);
				var text = part_description;
			}
			
			//Alia
			draw_sprite_ext(spr_mugshot_alia,blink,(96*scale),(8*scale),-scale,scale,0,c_white,1)
			if text_scrolling < string_length(text)
				draw_sprite_ext(spr_mugshot_alia_talk,text_scrolling/6,(96*scale),(8*scale),-scale,scale,0,c_white,1);
			
			
			//Check if text has changed to reset typewriter effect
			if text_change != text
			{
				text_change = text;
				text_scrolling = 0;
			}
			else
				text_scrolling++;
			
			//Typewriter effect
			var typewriter = string_copy(text,0,text_scrolling)
			draw_text_ext_transformed_color((112*scale),(9*scale),typewriter,14,60*scale,scale/1.5,scale/1.5,0,c_white,c_white,c_white,c_white,1);
			
			
			//Display rank
			draw_sprite_ext(spr_partselect_rank,0,display_get_gui_width(),0,scale,scale,0,menu_colour,1);
			draw_sprite_ext(spr_partselect_rank,1,display_get_gui_width(),0,scale,scale,0,c_white,1);
			shader_set(shd_hue);
			shader_set_uniform_f(shader_get_uniform(shd_hue,"u_Position"),pause_hue);
			draw_sprite_ext(spr_partselect_rank,2,display_get_gui_width(),0,scale,scale,0,c_white,1);
			shader_reset();
			//Draw rank and rescue count
			scr_get_rank();
			draw_sprite_ext(spr_pause_rank,rank_letter,display_get_gui_width()-(25*scale),(12*scale),scale,scale,0,c_white,1);
			draw_text_ext_transformed_color(display_get_gui_width()-(74*scale),(25*scale),"Rescues: "+string(rank_size),14,60*scale,scale,scale,0,c_white,c_white,c_white,c_white,1);
			
			
			//Selection at the bottom for next menus
			draw_sprite_ext(spr_stageselect_words_frame,pause_animate/5,-(11*scale),display_get_gui_height(),scale,scale,0,c_white,1)
			draw_sprite_ext(spr_stageselect_words_frame,pause_animate/5,display_get_gui_width()+(11*scale),display_get_gui_height(),-scale,scale,0,c_white,1)
			//Bottom text
			if stageselect_state > 1
			{
				draw_sprite_ext(spr_stageselect_words_options,pause_animate/5,(57*scale),display_get_gui_height()-(13*scale),scale,scale,0,c_white,1)
				draw_sprite_ext(spr_stageselect_words_stages,pause_animate/5,display_get_gui_width()-(57*scale),display_get_gui_height()-(13*scale),scale,scale,0,c_white,1)
			}
			#endregion
			break;
	}
}