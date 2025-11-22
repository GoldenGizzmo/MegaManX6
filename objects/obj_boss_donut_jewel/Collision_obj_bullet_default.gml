/// @description Insert description here
// You can write your code in this editor

if invul = false
{
	// Inherit the parent event
	event_inherited();

	if life < 0
	{
		scr_point_between(x,y,other.x,other.y,other);
		instance_create_layer(between_x,between_y,"Explosions",obj_explosion);
	}
}