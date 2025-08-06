/// @description Taking Damage

knockback = set_knockback;

if global.life > 0 and invul = false
{
	if recovery = 0 and other.damage > 0
	{
		//scr_defense_calculation();
		
		
		//Knockback
		if other.x > x
			xspeed = -knockback;
		else
			xspeed = knockback;
		
		global.life = global.life-other.damage;
			
		if global.life > 0
		{
			alarm[3] = 15; //Recovery time
			recovery_time = base_recovery_time;
		}
			
		//Turn off
		if knockback > 0
		{
			yspeed = 0;
			alarm[4] = 1;
		}
			
		//Settings
		recovery = 1;
		dash = false;
		hurt = true;
	}
} 









