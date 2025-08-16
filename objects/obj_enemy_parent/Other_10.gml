/// @description Turn at Ledges

var o_solid = obj_solid

//If moving left
if (xspeed < 0)
{
	//Turn at ledges
	if !collision_rectangle(bbox_left-3+xspeed,bbox_bottom-1,bbox_left,bbox_bottom+15,o_solid,1,0)
	{
		//Turn around
		image_xscale = -image_xscale;
		xspeed = -xspeed;
	}
}
else
{
	//Turn at ledges
	if !collision_rectangle(bbox_right,bbox_bottom-1,bbox_right+3+xspeed,bbox_bottom+15,o_solid,1,0)
	{
		//Turn around
		image_xscale = -image_xscale;
		xspeed = -xspeed;
	}
}