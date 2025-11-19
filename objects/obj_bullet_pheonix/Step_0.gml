/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Begin tracking
if tracking = 0
{
	tracking = 1;
	alarm[0] = tracking_start; //Delay until start
}
else
{
	if tracking < tracking_end
		tracking++;
	else
	{
		despawn = true;
		alarm[0] = -1; //Stop tracking
	}
}

image_angle = direction;

if global.animate%3 = 0 and explosive = false
{
	afterimage = instance_create_depth(x,y,depth+10,obj_afterimage);
	afterimage.sprite_index = sprite_index;
	afterimage.image_index = image_index;
	afterimage.image_angle = image_angle;
	afterimage.image_blend = make_colour_rgb(152,48,8);
	afterimage.image_xscale = image_xscale;
}