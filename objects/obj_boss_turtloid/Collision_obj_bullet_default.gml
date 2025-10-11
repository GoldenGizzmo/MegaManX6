/// @description Insert description here
// You can write your code in this editor

//If blocking and the projectile hits in front of them
if sprite_index = spr_boss_turtloid_idle or sprite_index = spr_boss_turtloid_stomp
{
	if (other.x < x and image_xscale = -1) or (other.x > x and image_xscale = 1)
	{
		armour = false;
		
		//Stop the charged shot from piercing through
		if other.object_index = obj_bullet_charged
			other.piercing = false;
	}
}

// Inherit the parent event
event_inherited();