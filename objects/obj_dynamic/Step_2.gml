/// @description Insert description here
// You can write your code in this editor

//Can be paused
if global.pause = true
	return;

//Current collision scripts
if colliding = true
{
	if movement_freeze = false
	{
		xspeed = scr_move(xspeed, AXIS_HORIZONTAL);
		yspeed = scr_move(yspeed, AXIS_VERTICAL);
	}
	else
		speed = 0;
}