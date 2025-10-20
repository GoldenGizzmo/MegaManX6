/// @description Insert description here
// You can write your code in this editor

if instance_exists(target)
{
	
	//Go for the forehead of this boss
	if target.object_index = obj_boss_d1000
	{
		direction = point_direction(x,y,target.x+(65*target.image_xscale),target.y-39);
		
		if distance_to_point(target.x+(65*target.image_xscale),target.y-39) < 1
		{
			instance_destroy();
		}
	}
	else
	{
		direction = point_direction(x,y,target.x,target.y);
	
		if distance_to_point(target.x,target.y) < 10
			instance_destroy();
	}
	
	
}
else
	instance_destroy();