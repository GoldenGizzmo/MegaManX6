/// @description Insert description here
// You can write your code in this editor

gpu_set_blendenable(false)
if aspect_ratio = 1
{
	application_surface_draw_enable(false);
	app_surface_draw_filtered(,Upscale_Method.bilinear);
}
else
{
	application_surface_draw_enable(true);
}
gpu_set_blendenable(true)




















