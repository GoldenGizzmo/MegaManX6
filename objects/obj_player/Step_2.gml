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
		
		if bike = true //Collide with special walls on the side of the screen which only block the player
		{
			xspeed = scr_move(xspeed, AXIS_HORIZONTAL,true,obj_solid_player);
			yspeed = scr_move(yspeed, AXIS_VERTICAL);
		}
		else
		{
			xspeed = scr_move(xspeed, AXIS_HORIZONTAL);
			yspeed = scr_move(yspeed, AXIS_VERTICAL);
		}
	}
	else
	{
		x += xspeed;
		y += yspeed;
	}
}
else
	speed = 0;