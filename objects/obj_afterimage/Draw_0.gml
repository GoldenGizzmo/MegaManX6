/// @description Insert description here
// You can write your code in this editor

gpu_set_blendmode(blendmode);
if blank = true
{
	gpu_set_fog(true,image_blend,0,0);
	draw_self();
	gpu_set_fog(false,image_blend,0,0);
}
else
	draw_self();
gpu_set_blendmode(bm_normal);










