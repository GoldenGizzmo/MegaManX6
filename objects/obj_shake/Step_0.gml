/// @description Insert description here
// You can write your code in this editor

if smooth = false
{
	if alarm[0] > length
		alarm[0] = length;
}

if frame < 1
	frame++
else
{
	if shake = 1
		shake = -1;
	else
		shake = 1;
	
	if style = 0
		obj_spawnzone.shake_x = (intensity/2)*shake;
	else
		obj_spawnzone.shake_y = (intensity/2)*shake;
		
	if smooth = true and shake = 1
	{
		if intensity > 0
			intensity -= 0.2;
		else
			alarm[0] = 1;
	}
		
	frame = 0;
}

