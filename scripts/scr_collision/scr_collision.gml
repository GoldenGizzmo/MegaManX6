function scr_collision() 
{
	airborne = true;
	
	if (place_meeting(x+xspeed,y,obj_solid))
	{
		while (!place_meeting(x+sign(xspeed),y,obj_solid)) 
			x += sign(xspeed);
		xspeed = 0;
	}
    x += xspeed;
        
	if (place_meeting(x,y+yspeed,obj_solid))
	{
		while (!place_meeting(x,y+sign(yspeed),obj_solid)) 
			y += sign(yspeed);
		yspeed = 0;
	}
	y += yspeed;
		
	if place_meeting(x,y+1,obj_solid)
		airborne = false;
	
	
	
	
}