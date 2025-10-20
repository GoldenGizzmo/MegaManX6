/// @description Insert description here
// You can write your code in this editor

if shield_life > 0 and global.damage_taken > 0
{
	global.damage_taken = other.damage
	
	global.damage_taken = ceil(global.damage_taken/resistance); //Resistance
	shield_life -= global.damage_taken;
	
	//Stop the charged shot from piercing through
	if other.object_index = obj_bullet_charged
		other.piercing = false;
}
else
	event_inherited();