/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < image_xscale; i++)
{
	for (var a = 0; a < image_yscale; a++)
	{
		gpu_set_blendmode(bm_add);
		if side = false
		{
			if a = 0
				draw_sprite_ext(spr_fire_top,image_index,x+(32*i),y,1,1,0,c_white,1);
			draw_sprite_ext(spr_fire,image_index,x+(32*i),y+16+(128*a),1,1,0,c_white,1);
		}
		else
		{
			if a = 0
				draw_sprite_ext(spr_fire_top,image_index,x,y+(32*i),1,1,270,c_white,1);
			draw_sprite_ext(spr_fire,image_index,x-16-(128*a),y+(32*i),1,1,270,c_white,1);
		}
		gpu_set_blendmode(bm_normal);
	}
}