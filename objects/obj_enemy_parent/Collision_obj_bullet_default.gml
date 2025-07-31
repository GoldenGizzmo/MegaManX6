/// @description Insert description here
// You can write your code in this editor

if other.villainy != 2 and life > 0 and other.damage > 0 and invul = false
{
	if other.tick = false
	{
		event_user(2);
		isHit = true;
		alarm[9] = 5;
	} 
	else if other.tick = true and isHit = false
	{
		event_user(2);
		isHit = true;
		alarm[9] = 9;
	}

	//Remove other projectile
	if other.piercing = false
		other.alarm[9] = 1;
}












