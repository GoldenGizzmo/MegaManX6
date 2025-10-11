/// @description Insert description here
// You can write your code in this editor

bg = instance_create_depth(x,y,layer_get_depth(layer_get_id("Tileset_Main")),obj_water_background);
bg.owner = id;

toxic = false;
toxic_merge = 0.5;
toxic_flicker = false;
toxic_flickering = 0;
if room = rm_turtloid
{
	toxic = true;
	image_blend = c_lime;
}