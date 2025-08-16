// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_water_start()
{
	if event_type == ev_draw
	{
		if event_number == 0
		{
			gpu_set_blendmode(bm_add);
		}
	}
}

function scr_water_end()
{
	if event_type == ev_draw
	{
		if event_number == 0
		{
			gpu_set_blendmode(bm_normal);
		}
	}
}