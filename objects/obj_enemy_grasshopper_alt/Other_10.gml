/// @description Insert description here
// You can write your code in this editor

if state = "Attacking"
{
	if (xspeed < 0)
	{
		//Turn at ledges
		if !collision_rectangle(bbox_left-3+xspeed,bbox_bottom-1,bbox_left,bbox_bottom+15,obj_solid,1,0)
			xspeed = 0;
	}
	else
	{
		//Turn at ledges
		if !collision_rectangle(bbox_right,bbox_bottom-1,bbox_right+3+xspeed,bbox_bottom+15,obj_solid,1,0)
			xspeed = 0;
	}
}
else
	event_inherited();
