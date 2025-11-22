/// @description Insert description here
// You can write your code in this editor

if global.hud_toggle = true
{
	var x_pos = 20*global.ui_scale;
	var y_pos = (display_get_gui_height()/2)-10*global.ui_scale;
	var extend = global.lifemax-base_life; //Increase the healthbar by this amount

	ammo_font = font_add_sprite_ext(spr_hud_weapon_count,"0123456789",true,0);
	draw_set_font(ammo_font);

	//HUD
	var hud_type = 0;
	if global.weapon_choice > 0
		hud_type = 1;
	draw_sprite_ext(spr_hud_player,hud_type,x_pos,y_pos,global.ui_scale,global.ui_scale,0,c_white,1);
	draw_sprite_ext(spr_hud_player_extend,0,x_pos,y_pos-(extend)*global.ui_scale,global.ui_scale,global.ui_scale,0,c_white,1);
	if hud_type = 1
		draw_sprite_ext(spr_hud_player_extend,1,x_pos,y_pos-(global.powertank*12)*global.ui_scale,global.ui_scale,global.ui_scale,0,c_white,1);

	//Health Bar
	var bar_height = -(global.lifemax*global.ui_scale)-1;
	var bar_start_y = y_pos;

	//Normal life bar
	var bar_limit = (global.life/global.lifemax)
	if global.life > global.lifemax //If breaching the limit
		bar_limit = 1;
			
	//White bar that appears when player takes damage
	if life_tick != global.life and life_tick > 0
		life_tick += (global.life-life_tick)*0.025;
	
	if life_tick > 0
		draw_rectangle_color(x_pos,bar_start_y,x_pos+(3*global.ui_scale)-1,bar_start_y+(bar_height+global.ui_scale)*(life_tick/global.lifemax),c_red,c_red,c_red,c_red,0);
	if global.life > 0
		draw_rectangle_color(x_pos,bar_start_y,x_pos+(3*global.ui_scale)-1,bar_start_y+bar_height*bar_limit,c_lime,c_lime,c_yellow,c_yellow,0);
	
	//Special Weapon Bar
	if global.weapon_choice > 0
	{
		var bar_height = -((36+(global.powertank*12))*global.ui_scale)-1;
		var bar_start_y = y_pos;

		//Ammo bar
		var bar_limit = (global.weapon[global.weapon_choice].ammo/global.weapon_ammo_max)
		if global.weapon[global.weapon_choice].ammo > global.weapon_ammo_max //If breaching the limit
			bar_limit = 1;
	
		//Colours for the ammo bars
		scr_weapon_menus(global.weapon[global.weapon_choice].type);
	
		if global.weapon[global.weapon_choice].ammo > 0
			draw_rectangle_color(x_pos+(9*global.ui_scale),bar_start_y,x_pos+(12*global.ui_scale)-1,bar_start_y+bar_height*bar_limit,weapon_bar_colour_1,weapon_bar_colour_1,weapon_bar_colour_2,weapon_bar_colour_2,0);

		draw_sprite_ext(spr_hud_weapon,global.weapon_choice,x_pos+(5*global.ui_scale),y_pos+(7*global.ui_scale),global.ui_scale,global.ui_scale,0,c_white,1);

	
		draw_set_halign(fa_center);
			draw_text_ext_transformed_color(x_pos+(8*global.ui_scale),y_pos+(16*global.ui_scale),floor(global.weapon[global.weapon_choice].ammo/global.weapon[global.weapon_choice].ammo_usage),10,11*global.ui_scale,global.ui_scale,global.ui_scale,0,c_white,c_white,weapon_ammo_colour,weapon_ammo_colour,1);
		draw_set_halign(fa_left);
	}
	else
	{
		draw_set_halign(fa_center);
			draw_text_ext_transformed_color(x_pos+(8*global.ui_scale),y_pos+(16*global.ui_scale),ceil(global.life),10,11*global.ui_scale,global.ui_scale,global.ui_scale,0,make_color_rgb(112,240,240),make_color_rgb(112,240,240),make_color_rgb(112,240,240),make_color_rgb(112,240,240),1);
		draw_set_halign(fa_left);
	}
	draw_set_font(global.fnt_game);
	
	//Draw nightmare soul counter
	var soul_x_pos = 10*global.ui_scale;
	var soul_y_pos = (display_get_gui_height()-5*global.ui_scale)+souls_y;
	draw_sprite_ext(spr_hud_souls,global.animate/7,soul_x_pos,soul_y_pos,global.ui_scale,global.ui_scale,0,c_white,1);
	//Souls text
	var soul_text = string_repeat("0",max(0,5-string_length(string(global.nightmare_souls))))+string(global.nightmare_souls);
	var soul_text_colour = make_color_rgb(64,132,244);
	draw_text_transformed_color(soul_x_pos+28*global.ui_scale,soul_y_pos-16*global.ui_scale,soul_text,global.ui_scale,global.ui_scale,0,soul_text_colour,soul_text_colour,soul_text_colour,soul_text_colour,1);
	//Added souls from collecting
	if souls_timer > 0
	{
		var soul_text_colour = make_color_rgb(148,236,255);
		draw_set_halign(fa_right);
			draw_text_transformed_color(soul_x_pos+58*global.ui_scale,soul_y_pos-27*global.ui_scale,"+"+string(souls_collected),global.ui_scale,global.ui_scale,0,soul_text_colour,soul_text_colour,soul_text_colour,soul_text_colour,souls_alpha);
		draw_set_halign(fa_left);
	}
}


/*
var video_data = video_draw();
var video_status = video_data[0];
if video_status = 0
{
	draw_surface_ext(video_data[1],0,0,0.5,0.5,0,c_white,1);
}











