/// @description Taking Damage

if global.damage_taken > 0
{
	global.damage_taken = other.damage
	
	global.damage_taken = ceil(global.damage_taken/resistance); //Resistance
	life -= global.damage_taken;
}












