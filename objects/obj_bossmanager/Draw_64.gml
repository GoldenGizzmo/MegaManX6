/// @description Insert description here
// You can write your code in this editor

if (bossfight_state = 7 or bossfight_state = 8) and global.hud_toggle = true
{
	var x_pos = display_get_gui_width()-30*global.ui_scale;
	var y_pos = (display_get_gui_height()/2)+10*global.ui_scale;

	//HUD
	var hud_type = boss.faction;
	draw_sprite_ext(spr_hud_boss,hud_type,x_pos,y_pos,global.ui_scale,global.ui_scale,0,c_white,1);

	//Health Bar
	var bar_height = -(96*global.ui_scale)-1;
	var bar_start_y = y_pos;

	//Normal life bar
	var bar_limit = ((boss.life-lifebar_intro)/boss.lifemax)
	if boss.life > boss.lifemax //If breaching the limit
		bar_limit = 1;
			
	//White bar that appears when player takes damage
	if life_tick != (boss.life-lifebar_intro)
		life_tick += ((boss.life-lifebar_intro)-life_tick)*0.025;
	
	if boss.life-lifebar_intro > 0
	{
		draw_rectangle_color(x_pos,bar_start_y,x_pos+(3*global.ui_scale)-1,bar_start_y+(bar_height+global.ui_scale)*(life_tick/boss.lifemax),c_red,c_red,c_red,c_red,0);
		draw_rectangle_color(x_pos,bar_start_y,x_pos+(3*global.ui_scale)-1,bar_start_y+bar_height*bar_limit,c_lime,c_lime,c_yellow,c_yellow,0);
	}

	//Percentage of health remaining
	ammo_font = font_add_sprite_ext(spr_hud_weapon_count,"0123456789%",true,0);
	draw_set_font(ammo_font);

	draw_set_halign(fa_center);
		var percentage = ((boss.life-lifebar_intro)/boss.lifemax)*100;
		if percentage < 0 //Underflow
			percentage = 0;
		draw_text_ext_transformed_color(x_pos+(6.5*global.ui_scale),y_pos+(17*global.ui_scale),string(ceil(percentage))+"%",10,11*global.ui_scale,global.ui_scale,global.ui_scale,0,make_color_rgb(112,240,240),make_color_rgb(112,240,240),make_color_rgb(112,240,240),make_color_rgb(112,240,240),1);
	draw_set_halign(fa_left);
}