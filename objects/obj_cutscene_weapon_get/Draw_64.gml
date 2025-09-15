/// @description Insert description here
// You can write your code in this editor

if action > 0
{
	scr_weapon_menus(weapon);
	var scale = global.ui_scale/1.2; //Menu size
	
	draw_sprite_tiled_ext(spr_weapon_lines,0,(global.animate*20)+(50*global.ui_scale),0,global.ui_scale,-global.ui_scale,particle_lines_colour,particle_lines_alpha);
	draw_sprite_tiled_ext(spr_weapon_lines,0,(global.animate*20)+(50*global.ui_scale),0,global.ui_scale,-global.ui_scale,c_black,particle_lines_alpha/2);
	gpu_set_blendmode(bm_add)
		draw_sprite_tiled_ext(spr_weapon_lines,0,global.animate*30,0,global.ui_scale,global.ui_scale,particle_lines_colour,particle_lines_alpha);
	gpu_set_blendmode(bm_normal)
	
	//Weapon get HUD
	draw_sprite_ext(spr_weapon_get,0,0,explaination_y,scale,scale,0,weapon_ammo_colour,1);
	draw_sprite_ext(spr_weapon_get,1,0,explaination_y,scale,scale,0,c_white,1);
	
	//Alia
	draw_sprite_ext(spr_mugshot_alia,blink,(97*scale),explaination_y+(9*scale),-scale,scale,0,c_white,1);
	if action >= 6 and text_scrolling < string_length(weapon_description_long)
		draw_sprite_ext(spr_mugshot_alia_talk,text_scrolling/3,(97*scale),explaination_y+(9*scale),-scale,scale,0,c_white,1);
	
	//Portrait
	for (var i = 0; i < 4; i++)
		draw_sprite_ext(spr_portrait_x,x_colour,portait_afterimage[i].x_pos,display_get_gui_height()/2+(20*global.ui_scale)+move_away,global.ui_scale/3.5,global.ui_scale/3.5,0,c_aqua,0.2);
	draw_sprite_ext(spr_portrait_x,x_colour,portrait_x,display_get_gui_height()/2+(20*global.ui_scale)+move_away,global.ui_scale/3.5,global.ui_scale/3.5,0,c_white,1);



	//Text
	fnt_weapon_get = font_add_sprite_ext(spr_font_weapon_get,"ABCDEFGHIJKLMNOPQRSTUVWXYZ ",true,0);
	draw_set_font(fnt_weapon_get);
	draw_set_halign(fa_center);
		draw_text_transformed_color(portrait_x-(106*global.ui_scale),display_get_gui_height()/2-(44*global.ui_scale)+move_away,"YOU GOT",global.ui_scale,global.ui_scale,0,c_dkgrey,c_dkgrey,c_dkgrey,c_dkgrey,1);
		draw_text_transformed_color(portrait_x-(108*global.ui_scale),display_get_gui_height()/2-(46*global.ui_scale)+move_away,"YOU GOT",global.ui_scale,global.ui_scale,0,c_white,c_white,c_white,c_white,1);
		if action > 2
		{
			draw_text_transformed_color(portrait_x-(112*global.ui_scale),display_get_gui_height()/2-(8*global.ui_scale)+move_away,string_upper(weapon),global.ui_scale,global.ui_scale,0,weapon_ammo_colour,weapon_ammo_colour,weapon_ammo_colour,weapon_ammo_colour,1);
			draw_text_transformed_color(portrait_x-(112*global.ui_scale),display_get_gui_height()/2-(8*global.ui_scale)+move_away,string_upper(weapon),global.ui_scale,global.ui_scale,0,c_black,c_black,c_black,c_black,0.7);
			draw_text_transformed_color(portrait_x-(114*global.ui_scale),display_get_gui_height()/2-(10*global.ui_scale)+move_away,string_upper(weapon),global.ui_scale,global.ui_scale,0,weapon_ammo_colour,weapon_ammo_colour,weapon_ammo_colour,weapon_ammo_colour,1);
		}
	draw_set_font(global.fnt_game);
	draw_set_halign(fa_left);
	
	//Typewriter effect
	var text = string_copy(weapon_description_long,0,text_scrolling)
	//Sound for text scrolling
	if action >= 6 and text_counting%4 = 0
		if text_scrolling < string_length(weapon_description_long)
			scr_make_sound(snd_text_scroll,0.5,1,false);
	//Draw long description
	draw_text_ext_transformed_color(display_get_gui_width()/2-(120*scale),explaination_y+(9*scale),text,14,160*scale,scale/1.5,scale/1.5,0,c_white,c_white,c_white,c_white,1);
	
	
	/*
	for (var i = 0; i < 4; i++)
	{
		if weapon_note[i] != "Nothing"
		{
			//draw_sprite_ext(spr_weapon_point,0,display_get_gui_width()/2-(122*scale),explaination_y+(34*scale)+(10*scale*i),scale,scale,0,c_white,1);
			draw_text_ext_transformed_color(display_get_gui_width()/2-(120*scale),explaination_y+(29*scale)+(10*scale*i),"^ "+string(weapon_note[i]),string_height(weapon_note[i]),160*scale,scale/1.5,scale/1.5,0,c_white,c_white,c_white,c_white,1);
		}
	}*/
	
	if action >= 9
		draw_text_transformed_color((25*scale),explaination_y+(80*scale),"Press [Start] to continue...",scale,scale,0,weapon_ammo_colour,weapon_ammo_colour,weapon_ammo_colour,weapon_ammo_colour,continue_fade);
}