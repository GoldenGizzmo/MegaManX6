/// @description Insert description here
// You can write your code in this editor

if afterimage_toggle = true
{
	afterimage = instance_create_depth(x,y,depth+1,obj_afterimage)
	afterimage.sprite_index = sprite_index;
	afterimage.image_index = image_index;
	afterimage.image_blend = afterimage_blend;
	afterimage.blank = afterimage_blank;
}