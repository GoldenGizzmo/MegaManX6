/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	if shaking > 0
	{
		shaking--;
		alarm[2] = 2;
						
		//Up and down
		if shaking_offset = false
		{
			y += 2;
			shaking_offset = true;
		}
		else
		{
			y -= 2;
			shaking_offset = false
		}
	}
	else
		shaking = 0;
}