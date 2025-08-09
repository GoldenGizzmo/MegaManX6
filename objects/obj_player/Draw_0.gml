/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_game)
draw_text(x,y-50,obj_bossmanager.bossfight_state)
//draw_text(x,y-70,sprite_index)

if flicker = true or flicker_weapon_swap = true
{
	gpu_set_fog(true,make_color_rgb(211,232,248),0,0);
	draw_self();
	gpu_set_fog(false,make_color_rgb(211,232,248),0,0);
	
	flicker_weapon_swap = false;
}
else
{
	palette = 1;
	if global.weapon_choice > 0 //Select right palette when using special weapons
		palette = (4+global.weapon_choice)
	
	pal_swap_set(spr_player_x_palette,palette,false);
	if shooting_charge_flicker = true
	{
		if shooting_charge >= shooting_charge_lvl_2	
			pal_swap_set(spr_player_x_palette,3,false);
		else if shooting_charge >= shooting_charge_lvl_1
			pal_swap_set(spr_player_x_palette,2,false);
	}	
	draw_self();
	pal_swap_reset();
}

pal_swap_set(spr_effect_charging_palette,1,false);
if shooting_charge >= shooting_charge_lvl_2	
	draw_sprite(spr_effect_charging_2,global.animate/2,x,y);
if shooting_charge >= shooting_charge_lvl_1
	draw_sprite(spr_effect_charging,global.animate/2,x,y);
pal_swap_reset();








