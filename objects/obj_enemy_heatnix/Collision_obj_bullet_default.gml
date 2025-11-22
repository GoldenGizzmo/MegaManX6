/// @description Insert description here
// You can write your code in this editor

//Stop the charged shot from piercing through
if other.object_index = obj_bullet_charged
	other.piercing = false;

// Inherit the parent event
event_inherited();