/// @description Insert description here
// You can write your code in this editor

//Take more damage if marked and hit by a melee attack
if blade_marked > 0 and other.melee = true
	other.damage = ceil(other.damage*1.5);

// Inherit the parent event
event_inherited();

