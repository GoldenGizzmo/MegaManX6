/// @description Insert description here
// You can write your code in this editor

if boss_flicker = true
{
	//gpu_set_fog(true,c_ltgrey,0,0);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,rotate,image_blend,image_alpha);
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,rotate,image_blend,image_alpha);
	gpu_set_blendmode(bm_normal)
	//gpu_set_fog(false,c_ltgrey,0,0);
}
else
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,rotate,image_blend,image_alpha);

if giga_warning > 0
{
	cam_x = camera_get_view_x(view_camera[0]);	
	cam_y = camera_get_view_y(view_camera[0]);	

	if surface_exists(surface)
	{
		//Set
		surface_set_target(surface);
		gpu_set_blendmode_ext_sepalpha(bm_one, bm_zero, bm_one, bm_zero)
		draw_sprite_ext(spr_white_space,0,0,0,room_width,room_height,0,c_black,giga_warning)
	
		gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(obj_boss_turtloid.sprite_index,obj_boss_turtloid.image_index,obj_boss_turtloid.x-cam_x,obj_boss_turtloid.y-cam_y,obj_boss_turtloid.image_xscale,obj_boss_turtloid.image_yscale,obj_boss_turtloid.rotate,c_white,1);
		draw_rectangle_color(obj_boss_turtloid.x-50-cam_x,obj_boss_turtloid.y-cam_y,obj_boss_turtloid.x+50-cam_x,obj_boss_turtloid.y+500-cam_y,c_white,c_white,c_white,c_white,false);
		
		//Reset
		surface_reset_target();	
	
		gpu_set_blendmode(bm_normal);
		draw_surface(surface,cam_x,cam_y);
		gpu_set_blendmode(bm_normal);
	}
	else
	{
		cam_width = camera_get_view_width(view_camera[0])+10;	
		cam_height = camera_get_view_height(view_camera[0])+10;	
		surface = surface_create(cam_width,cam_height);
	}

}