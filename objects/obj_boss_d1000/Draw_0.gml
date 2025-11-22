/// @description Insert description here
// You can write your code in this editor

if boss_flicker = true
{
	//gpu_set_fog(true,c_ltgrey,0,0);
	draw_self()
	gpu_set_blendmode(bm_add)
	draw_self()
	gpu_set_blendmode(bm_normal)
	//gpu_set_fog(false,c_ltgrey,0,0);
}
else
	draw_self()