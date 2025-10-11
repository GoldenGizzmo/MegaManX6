/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.pause = true
	return;

if !instance_exists(owner)
{
	instance_create_layer(x,y,"Explosions",obj_explosion)
	instance_destroy();
	exit;
}

switch (state)
{
	case 0: //Moving towards the target
		if y > target.y+5
			y -= 0.5;
		else if y < target.y-5
			y += 0.5;
		break;

	case 1:
		speed = 0;
		break;
		
	case 2:
		direction = point_direction(x,y,owner.x+44*image_xscale,owner.y-10);
		speed = 5;
		//damage = 0;
		
		if distance_to_point(owner.x+44*image_xscale,owner.y-10) < 5
		{
			owner.image_index++;
			instance_destroy();
		}
		break;
}