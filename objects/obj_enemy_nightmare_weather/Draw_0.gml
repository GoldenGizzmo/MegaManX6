/// @description Insert description here
// You can write your code in this editor

if instance_exists(shielding) and shielding_flicker > 0
{
	if shielding_flicker = 1
	{
		scr_draw_sprite_line_ext(x,y,shielding.x,shielding.y,spr_enemy_nightmare_weather_line,1,distance_to_object(shielding)/5,0,1,0,c_white,shielding_flicker);
		scr_draw_sprite_line_ext(x,y,shielding.x,shielding.y,spr_enemy_nightmare_weather_chain,2,distance_to_object(shielding)/10,0,1,0,c_white,shielding_flicker);
		scr_draw_sprite_line_ext(x,y,shielding.x,shielding.y,spr_enemy_nightmare_weather_chain,2,distance_to_object(shielding)/20,0,1,0,c_white,shielding_flicker);
	}
	else
	{
		scr_draw_sprite_line_ext(x,y,shielding.x,shielding.y,spr_enemy_nightmare_weather_line,0,distance_to_object(shielding)/5,0,1,0,c_white,shielding_flicker);
		scr_draw_sprite_line_ext(x,y,shielding.x,shielding.y,spr_enemy_nightmare_weather_chain,0,distance_to_object(shielding)/10,0,1,0,c_white,shielding_flicker);
		scr_draw_sprite_line_ext(x,y,shielding.x,shielding.y,spr_enemy_nightmare_weather_chain,1,distance_to_object(shielding)/20,0,1,0,c_white,shielding_flicker);
	}
}

// Inherit the parent event
event_inherited();

if life > 0 or death < 1
{
	var propeller_x = -1;
	var propeller_y = -38;
	var spin_speed = propeller_spin/2;
	switch (sprite_index)
	{
		case spr_enemy_nightmare_weather:
			if image_index > 1 and image_index < 2
			{
				propeller_x += 1;
				propeller_y += 2;
			}
			else if image_index > 3
			{
				propeller_x -= 1;
				propeller_y -= 1;
			}
			break;
		case spr_enemy_nightmare_weather_shoot:
			propeller_x -= 2;
			propeller_y -= 1;
			
			spin_speed = propeller_spin;
			break;
	}
	
	
	if !(isHit)
		draw_sprite_ext(spr_enemy_nightmare_weather_top,spin_speed,x+(propeller_x*image_xscale),y+propeller_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

	if (isHit) 
	{
		gpu_set_fog(true,make_color_rgb(211,232,248),0,0);
		draw_sprite_ext(spr_enemy_nightmare_weather_top,spin_speed,x+(propeller_x*image_xscale),y+propeller_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
		gpu_set_fog(false,make_color_rgb(211,232,248),0,0);
	}
}

//draw_text(x,y-30,spawn)