/// @description Insert description here
// You can write your code in this editor

if instance_exists(owner)
{
	/*
	if owner.toxic = true
	{
		//Visual effect
		gpu_set_blendenable(false)
		gpu_set_colorwriteenable(false,false,false,true);
		draw_set_alpha(0);
		draw_rectangle(0,0,room_width,room_height,false);

		draw_set_alpha(1);
		draw_sprite_ext(spr_water_top_background,0,owner.x,owner.y-8,owner.image_xscale,1,0,owner.image_blend,1);
		gpu_set_blendenable(true);
		gpu_set_colorwriteenable(true,true,true,true);

		gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
		gpu_set_alphatestenable(true);
		draw_sprite_ext(spr_water_top_background,0,owner.x,owner.y-8,owner.image_xscale,1,0,owner.image_blend,1);
		draw_sprite_tiled_ext(spr_water_acid,global.animate/4,x,y,1,1,c_white,1);
		gpu_set_alphatestenable(false);
		gpu_set_blendmode(bm_normal);
	}
	else*/
		draw_sprite_ext(spr_water_top_background,0,owner.x,owner.y-8,owner.image_xscale,1,0,owner.image_blend,1);
}