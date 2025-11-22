/// @description Insert description here
// You can write your code in this editor

//Can be paused
if global.pause = true
	return;

//Current collision scripts
if movement_freeze = false
{
	if colliding = true
	{
		
		scr_update_ignore_coll()
		
		xspeed = scr_move(xspeed, AXIS_HORIZONTAL);
		yspeed = scr_move(yspeed, AXIS_VERTICAL);
		
		if bike = true
			x = clamp(x,obj_camera.x-200,obj_camera.x+200);
	}
	else
	{
		x += xspeed;
		y += yspeed;
	}
}
else
	speed = 0;
	