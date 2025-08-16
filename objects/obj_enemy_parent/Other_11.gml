/// @description Turn at Walls

//Collision
if place_meeting(x+xspeed,y,obj_solid)
{
	//Turn around
	image_xscale = -image_xscale;
	xspeed = -xspeed;
}