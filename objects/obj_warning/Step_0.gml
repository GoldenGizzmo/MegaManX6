/// @description Insert description here
// You can write your code in this editor

if flash_phase = 0
{
	if alpha < 1
	{
		alpha += 0.05;

		if darkness < 250
			darkness += 10;
	}
	else
	{
		flash_phase++;
		alarm[0] = 30;
	}
}

if flash_phase = 2
{
	if alpha > 0
	{
		alpha -= 0.05;

		if darkness > 50
			darkness -= 10;
	}
	else
	{
		flash_phase++;
		alarm[0] = 15;
		
		flash_count++;
	}
}

if flash_count >= flash_max
	instance_destroy();













