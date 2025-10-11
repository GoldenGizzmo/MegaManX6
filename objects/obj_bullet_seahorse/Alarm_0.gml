/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case 0: //If meetting player Y
		if y > target.y-5 and y < target.y+5
		{
			state++;
			alarm[0] = 60;
			
			store_speed = speed;
			speed = 0;
		}
		else
			alarm[0] = 1;
		break;
		
	case 1:
		if target.x > x
			direction = 0
		else
			direction = 180;
			
		speed = store_speed;
		break;
	
}