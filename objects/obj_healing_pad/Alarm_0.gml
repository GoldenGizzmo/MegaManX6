/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case 1:
		image_speed = 1;
		
		if wall_animation < 9
		{
			alarm[0] = 2; //Animation speed
			wall_animation++;
			effect.image_index = wall_animation;
		}
		else
		{
			wall_animation = 0;
			
			global.pause_healing = global.lifemax;
			global.pause = true;
			
			state++;
		}
		break;
}