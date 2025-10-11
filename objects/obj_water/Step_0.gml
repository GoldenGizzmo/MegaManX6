/// @description Insert description here
// You can write your code in this editor

if global.pause = true
	exit;

y = ystart+dsin(current_time*0.075)*4;

if toxic = true
{
	toxic_flickering++;
	if toxic_flickering%10 = 0
	{
		if toxic_flicker = false
		{
			toxic_flicker = true;
			image_blend = c_green;
		}
		else
		{
			toxic_flicker = false;
			image_blend = c_lime;
		}
	}
}