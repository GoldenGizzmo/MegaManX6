/// @description Insert description here
// You can write your code in this editor

if active = true
{
	if state > 0
	{
		if global.animate%2 = 0
		{
			if flicker = false
				flicker = true;
			else
				flicker = false;
		}
	}

	//Midst upgrading
	if state >= 6 and state <= 7
	{
		image_blend = c_white;
		if flicker = true
			image_blend = make_color_rgb(255,204,204);

		image_speed = 0;
		image_index = 4;
	}
}
else
{
	image_speed = 0;
	image_index = 0;
	sprite_index = spr_capsule;
}