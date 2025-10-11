/// @description Block projectiles

if shielding = true
	armour = true;

// Inherit the parent event
event_inherited();

if shielding = true
{
	//Reset blocking amount when hit
	if other.villainy != 2 and life > 0 and other.damage > 0 and alarm[0] < 30 and action = 2
		alarm[0] = 30;
	
	//Unique death with a powerful attack
	if other.damage > 10 
	{
		guard_break = true;
		life = 0;
	}
}

armour = false;