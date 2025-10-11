/// @description Insert description here
// You can write your code in this editor

//If blocking and the projectile hits in front of them
if state = "Blocking" and image_speed = 0
{
	if (other.x < x and image_xscale = -1) or (other.x > x and image_xscale = 1)
	{
		armour = true;
		
		//Get stunned if hit with a powerful attack
		if other.damage > 10
		{
			state = "Stunned"
			alarm[0] = 1;
			action = 0;
		}
		
		//Stop the charged shot from piercing through
		if other.object_index = obj_bullet_charged
			other.piercing = false;
	}
}

// Inherit the parent event
event_inherited();

armour = false;