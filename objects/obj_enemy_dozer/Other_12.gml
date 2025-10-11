/// @description Insert description here
// You can write your code in this editor

if shield_life > 0 and global.damage_taken > 0
{
	global.damage_taken = other.damage
	
	global.damage_taken = ceil(global.damage_taken/resistance); //Resistance
	shield_life -= global.damage_taken;
}
else
	event_inherited();