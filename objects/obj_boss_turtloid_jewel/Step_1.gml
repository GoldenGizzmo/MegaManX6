/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var owner = obj_boss_turtloid;
	
if owner.life > 0
{
	//Positioning
	x = owner.x;
	y = owner.y;
	if owner.airborne = true
		y += owner.weight;
	image_xscale = owner.image_xscale;
	image_angle = owner.rotate;
		
	
	
}
else
	instance_destroy();