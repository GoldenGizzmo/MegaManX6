/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var owner = instance_nearest(x,y,obj_boss_donut);
	
if owner.life > 0
{
	//Positioning
	x = owner.x;
	y = owner.y;
	image_angle = owner.rotate;
}
else
	instance_destroy();