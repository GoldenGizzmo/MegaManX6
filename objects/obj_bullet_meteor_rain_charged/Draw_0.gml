/// @description Insert description here
// You can write your code in this editor

//For Rainy Turtloid's attack which he creates a specific shelter underneath him
if turtloid = true
{
	cam_x = camera_get_view_x(view_camera[0]);	
	cam_y = camera_get_view_y(view_camera[0]);	

	if surface_exists(surface)
	{
		//Set
		surface_set_target(surface);
		gpu_set_blendmode_ext_sepalpha(bm_one, bm_zero, bm_one, bm_zero)
		draw_sprite_tiled_ext(sprite_index,global.animate,0,0,1,1,c_white,rain_alpha);
		
		//	for (var i = 0; i < obj_raindrops.image_xscale; i++)
		//		draw_sprite_ext(spr_raindrops_meteor_rain,global.animate/2,obj_raindrops.x+(160*i)-cam_x,obj_raindrops.y-cam_y,1,1,0,c_white,rain_alpha);

	
		gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(obj_boss_turtloid.sprite_index,obj_boss_turtloid.image_index,obj_boss_turtloid.x-cam_x,obj_boss_turtloid.y-cam_y,obj_boss_turtloid.image_xscale,obj_boss_turtloid.image_yscale,obj_boss_turtloid.rotate,c_white,1);
		draw_rectangle_color(obj_boss_turtloid.x-50-cam_x,obj_boss_turtloid.y-cam_y,obj_boss_turtloid.x+50-cam_x,obj_boss_turtloid.y+500-cam_y,c_white,c_white,c_white,c_white,false);
		
		//Reset
		surface_reset_target();	
	
		gpu_set_blendmode(bm_add);
		draw_surface(surface,cam_x,cam_y);
		gpu_set_blendmode(bm_normal);
	}
	else
	{
		cam_width = camera_get_view_width(view_camera[0])+10;	
		cam_height = camera_get_view_height(view_camera[0])+10;	
		surface = surface_create(cam_width,cam_height);
	}
	
	draw_sprite_ext(spr_white_space,0,x,y,room_width,room_height,0,image_blend,white_alpha)
	if white_alpha > 0
		white_alpha -= 0.05;
}
else
	draw_sprite_tiled_ext(sprite_index,global.animate,0,0,1,1,c_white,rain_alpha);