/// @description Insert description here
// You can write your code in this editor

/*
//gpu_set_blendmode(bm_add)
draw_sprite_ext(sprite_index,image_index,display_get_width()/2+global.ui_scale,0,global.ui_scale,global.ui_scale,0,c_red,0.2)
draw_sprite_ext(sprite_index,image_index,display_get_width()/2+global.ui_scale,global.ui_scale,global.ui_scale,global.ui_scale,0,c_red,0.2)
draw_sprite_ext(sprite_index,image_index,display_get_width()/2,global.ui_scale,global.ui_scale,global.ui_scale,0,c_red,0.2)
draw_sprite_ext(sprite_index,image_index,display_get_width()/2-global.ui_scale,global.ui_scale,global.ui_scale,global.ui_scale,0,c_red,0.2)
draw_sprite_ext(sprite_index,image_index,display_get_width()/2-global.ui_scale,0,global.ui_scale,global.ui_scale,0,c_red,0.2)
draw_sprite_ext(sprite_index,image_index,display_get_width()/2-global.ui_scale,-global.ui_scale,global.ui_scale,global.ui_scale,0,c_red,0.2)
draw_sprite_ext(sprite_index,image_index,display_get_width()/2,-global.ui_scale,global.ui_scale,global.ui_scale,0,c_red,0.2)
draw_sprite_ext(sprite_index,image_index,display_get_width()/2+global.ui_scale,-global.ui_scale,global.ui_scale,global.ui_scale,0,c_red,0.2)
//gpu_set_blendmode(bm_normal)
*/

var offset_x = 0;
var offset_y = 0;
if global.animate%3 = 0
{
	var offset_range = 6
	var offset_chance = irandom(5);
	if offset_chance = 0
		offset_range = 30;
	offset_x = random_range(-offset_range,offset_range);
	offset_y = random_range(-offset_range,offset_range);
		
	image = instance_create_depth(display_get_width()/2+offset_x,offset_y,depth+1,obj_warning_afterimage)
	image.sprite_index = sprite_index;
	image.image_index = image_index;
	image.fade_speed = 0.15
}

draw_sprite_ext(sprite_index,image_index,display_get_width()/2,0,global.ui_scale,global.ui_scale,0,c_white,1)











