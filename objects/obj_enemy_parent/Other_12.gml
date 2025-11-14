/// @description Taking Damage

if global.damage_taken > 0
{
	global.damage_taken = other.damage
	
	global.damage_taken = ceil(global.damage_taken/resistance); //Resistance
	life -= global.damage_taken;
	if life < 0
		life = 0;
	
	//Add a cooldown before it can take damage again
	if boss_iframes = 0
		boss_iframes = 60;
}

if life <= 0
	event_user(4);












