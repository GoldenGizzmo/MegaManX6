function scr_collision(_solid,_slope) 
{
	airborne = true;
	
	if _solid
	{
		if (place_meeting(x+xspeed,y,obj_solid))
		{
			while (!place_meeting(x+sign(xspeed),y,obj_solid)) 
				x += sign(xspeed);
			xspeed = 0;
		}
    
        
		if (place_meeting(x,y+yspeed,obj_solid))
		{
			while (!place_meeting(x,y+sign(yspeed),obj_solid)) 
				y += sign(yspeed);
			yspeed = 0;
		}
		
		if place_meeting(x,y+1,obj_solid)
			airborne = false;
	}
	
	x += xspeed;
	y += yspeed;
	
	if _slope
	{	
		if place_meeting(x,y,obj_solid_slope)
		{
			//If the object vertical speed is equal/greater than 0.
			if yspeed >= 0
			{ 
				//Stop vertical speed.
				yspeed = 0;
			}

			//Stay embed on the slope.
			while (collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom-1,obj_solid_slope,1,1))
			    y--;
		}
		
		var touching_slope = instance_place(x,y+2,obj_solid_slope)
		if touching_slope
		{
			//If the object horizontal speed is lower than 0.
			if xspeed < 0 and yspeed >= 0
			{ 
    
			    //Move x pixels downwards as many horizontal speed the object has to ensure correct slope collision.
				y += 4
			}
		}
		
		if place_meeting(x,y+2,obj_solid_slope)
			airborne = false;
	}

	
}