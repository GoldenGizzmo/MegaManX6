/// @description Insert description here
// You can write your code in this editor

if room = rm_weapon_get or room = rm_highmax
{
	var menu_colour = bg_colour;
	if room = rm_highmax
	{
		scr_get_character("High Max")
		bg_colour = character_colour;
	}
	
	draw_sprite_ext(spr_white_space,0,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),room_width,room_height,0,menu_colour,bg_alpha)
	draw_sprite_ext(spr_white_space,0,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),room_width,room_height,0,c_black,bg_alpha/2)
	
	draw_sprite_ext(spr_pause_gradient,0,camera_get_view_x(view_camera[0])+global.view_width/2,camera_get_view_y(view_camera[0])+global.view_height/2,2,1,0,c_white,bg_alpha);
	draw_sprite_ext(spr_pause_gradient,0,camera_get_view_x(view_camera[0])+global.view_width/2,camera_get_view_y(view_camera[0])+global.view_height/2,2,-1,0,c_white,bg_alpha);
	
	gpu_set_blendmode(bm_add)
	draw_sprite_tiled_ext(spr_pause_grid,0,global.animate/4,global.animate/4,0.5,0.5,menu_colour,bg_alpha/3);
	gpu_set_blendmode(bm_normal)
}
else
{
	if background = spr_bg_mijinion
		draw_sprite_ext(background,global.animate/10,camera_get_view_x(view_camera[0])+(global.view_width/2),camera_get_view_y(view_camera[0]),0.75,0.75,0,c_white,1);
	else
		draw_sprite_tiled_ext(background,0,lerp(0,camera_get_view_x(view_camera[0])-(global.view_width/2),0.8)+bg_scrolling,camera_get_view_y(view_camera[0]),1,1,c_white,1);
	
	if instance_exists(obj_acid_rain)
		draw_sprite_ext(spr_white_space,0,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),room_width,room_height,0,c_black,obj_acid_rain.rain_alpha)
	if instance_exists(obj_bullet_meteor_rain_charged)
		draw_sprite_ext(spr_white_space,0,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),room_width,room_height,0,c_black,obj_bullet_meteor_rain_charged.rain_alpha)
}