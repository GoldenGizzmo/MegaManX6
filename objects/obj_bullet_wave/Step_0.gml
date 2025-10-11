/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if spread = false
{
	spread = true;
	alarm[0] = spread_speed;
}

switch (side)
{
	case 0: //Floor
		while !place_meeting(x,y+1,obj_solid)
		{
			if check < 16*3
			{
				y += 1;
				check++;
			}
			else
				break;
		}
		break;
		
	case 1: //Right
		while !place_meeting(x+1,y,obj_solid)
		{
			if check < 16*3
			{
				x += 1;
				check++;
			}
			else
				break;
		}
		break;
		
	case 2: //Ceiling
		while !place_meeting(x,y-1,obj_solid)
		{
			if check < 16*3
			{
				y -= 1;
				check++;
			}
			else
				break;
		}
		break;
		
	case 3: //Left
		while !place_meeting(x-1,y,obj_solid)
		{
			if check < 16*3
			{
				x -= 1;
				check++;
			}
			else
				break;
		}
		break;
}
check = 0;
image_angle = 90*side;

if image_index >= 5
	damage = 0;
	