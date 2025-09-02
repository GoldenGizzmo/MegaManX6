/// @description Insert description here
// You can write your code in this editor

if villainy != other.villainy and breakable = true and piercing = false
{
	alarm[9] = 1;
	
	//Other projectile is destroyed
	with other
		if piercing = false
			alarm[9] = 1;
}