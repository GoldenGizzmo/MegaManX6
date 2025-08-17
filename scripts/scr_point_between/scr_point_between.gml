// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_point_between(self_x,self_y,other_x,other_y,other_object)
{
	// Example: Finding the collision point between obj_player and obj_enemy
	if place_meeting(self_x,self_y,other_object)
	{
		// Calculate the direction vector from player to enemy
		var dir = point_direction(self_x,self_y,other_x,other_y);
    
		// Calculate the distance between the objects
		var dist = point_distance(self_x,self_y,other_x,other_y);
    
		// Iterate along the line, checking for collision at each point
		for (var i = 0; i <= dist; i += 1) {
		var check_x = self_x + lengthdir_x(i, dir);
		var check_y = self_y + lengthdir_y(i, dir);
        
		between_x = self_x;
		between_y = self_y;
		if (position_meeting(check_x, check_y,other_object))
		{
			// Collision point found
			between_x = check_x;
			between_y = check_y;
            
			// Perform actions at the collision point
			
			break; // Exit the loop after finding the first collision point
			}
		}
	}
}