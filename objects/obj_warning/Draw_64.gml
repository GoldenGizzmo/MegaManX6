/// @description Insert description here
// You can write your code in this editor

//draw_text(100,100,flash_phase)
var colour = make_color_rgb(darkness,darkness,darkness);

var offset_x = 0;
var offset_y = 0;
if global.animate%3 = 0	and alpha > 0
{
	var offset_range = 1+(flash_count*3);
	offset_x = random_range(-offset_range,offset_range);
	offset_y = random_range(-offset_range,offset_range);
		
	image = instance_create_depth(offset_x,offset_y,depth+1,obj_warning_afterimage)
	image.sprite_index = sprite_index;
	image.image_index = image_index;
	image.image_alpha = image_alpha;
	image.image_angle = image_angle
	image.image_blend = colour;
	image.fade_speed = 0.15
}

draw_sprite_ext(sprite_index,0,display_get_width()/2,0,1,1,0,colour,alpha)














