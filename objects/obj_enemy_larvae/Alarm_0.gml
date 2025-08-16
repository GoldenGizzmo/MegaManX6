/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (action)
	{
		case 0: //If on the ground
			if airborne = false
			{
				action++;
				alarm[0] = 240+random_range(-60,60);
			
				xspeed = 1*image_xscale;
			}
			else
				alarm[0] = 1;
			break;
		
		case 1: //Start flashing
			action++;
			alarm[0] = 60;
			
			flickering = 1;
			xspeed = 0;
			break;
		
		case 2: //Die :(
			life = 0;
			break;
	}
}
