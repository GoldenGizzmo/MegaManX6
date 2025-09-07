/// @description Insert description here
// You can write your code in this editor

if global.pause_screen = true
{
	global.hud_toggle = false;
	pause_animate++;
	tank_animate++;
	
	scr_get_character("X");
	var menu_colour = character_colour;
	
	draw_sprite_ext(spr_white_space,0,x,y,room_width,room_height,0,menu_colour,1)
	draw_sprite_ext(spr_white_space,0,x,y,room_width,room_height,0,c_black,0.5)
	
	draw_sprite_ext(spr_pause_gradient,0,display_get_gui_width()/2,display_get_gui_height()/2,global.ui_scale*2,global.ui_scale,0,c_white,1);
	draw_sprite_ext(spr_pause_gradient,0,display_get_gui_width()/2,display_get_gui_height()/2,global.ui_scale*2,-global.ui_scale,0,c_white,1);
	
	gpu_set_blendmode(bm_add)
	draw_sprite_tiled_ext(spr_pause_grid,0,pause_animate,pause_animate,global.ui_scale/2,global.ui_scale/2,menu_colour,0.3);
	gpu_set_blendmode(bm_normal)
	
	var scale = global.ui_scale/1.2; //Menu size
	
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
	for (i = 0; i < 9; i++)
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
			var weapon_bar_colour_1 = c_yellow;
			var weapon_bar_colour_2 = c_orange;
			switch (global.weapon[i].type)
			{
				case "Meteor Rain":
					weapon_bar_colour_1 = c_red;
					weapon_bar_colour_2 = c_dkgray;
					break;		
				case "Ray Arrow":
					weapon_bar_colour_1 = c_white;
					weapon_bar_colour_2 = c_purple;
					break;
			}
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
		case "Weapons": menu_description = global.weapon[menu_position].description; break;
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
	
	if menu_description != "Nothing"
		draw_text_ext_transformed_colour((98*scale),display_get_gui_height()-(36*scale),menu_description,string_height(menu_description),80*scale,scale/2,scale/2,0,c_white,c_white,c_white,c_white,1);
}