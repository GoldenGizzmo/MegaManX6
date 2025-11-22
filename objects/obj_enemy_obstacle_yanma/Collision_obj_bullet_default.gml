/// @description Insert description here
// You can write your code in this editor

life = lifemax;

//Only yanma option can break it
other.piercing_armour = false;
if other.sprite_index = spr_bullet_yanma
	armour = false

// Inherit the parent event
event_inherited();

//Heat up
if isHit = true
{
	if heat = 0 //Heat start to indicate something is happening
		heat = 0.4;
	else
		heat += 0.05;
		
	if heat >= 1
		life = 0;
}
	
armour = true;