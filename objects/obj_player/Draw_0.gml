/// @description Insert description here
// You can write your code in this editor

event_user(0);

draw_set_font(global.fnt_game);

//draw_text(x,y-80,"xspeed:   "+string(xspeed))

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
	
	image_blend = c_white;
	if slowed > 0
	{
		image_blend = make_color_rgb(200,88,192);
		
		draw_sprite(spr_bullet_powder,global.animate/5,x-3,y-15);
		draw_sprite(spr_bullet_powder,global.animate/5,x+8,y-2);
		draw_sprite(spr_bullet_powder,global.animate/5,x-5,y+10);
	}
}

//Offset for the charge to better align with the air dash pose
var charge_offset_y = 0
if airdash_state > 0
	charge_offset_y = -6;

//Weapon charge
pal_swap_set(spr_effect_charging_palette,1,false);
if shooting_charge >= shooting_charge_lvl_2	
	draw_sprite(spr_effect_charging_2,global.animate/2,x,y+charge_offset_y);
if shooting_charge >= shooting_charge_lvl_1
	draw_sprite(spr_effect_charging,global.animate/2,x,y+charge_offset_y);
//Mach Dash charge
pal_swap_set(spr_effect_charging_palette,2,false);
if machdash_hold > 5
{
	//SFX
	if machdash_hold = 6
		scr_make_sound(snd_player_x_machcharge_fadeout,1,1.25,false);
	
	if machdash_hold >= machdash_holdmax 
		draw_sprite(spr_effect_charging_2,(global.animate/1.5),x,y+charge_offset_y);
	draw_sprite(spr_effect_charging,global.animate/1.5,x,y+charge_offset_y);
}
pal_swap_reset();








