/// @description Insert description here
// You can write your code in this editor

if blendmode = true
{
	gpu_set_blendmode(bm_add);
	draw_self()
	gpu_set_blendmode(bm_normal);
}