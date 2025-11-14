/// @description Taking Damage

knockback = set_knockback;

if global.life > 0 and invul = false and movement = true
{
	if recovery = 0 and other.damage > 0
	{
		//scr_defense_calculation();
		
		global.life = global.life-other.damage;
			
		if global.life > 0
		{
			alarm[3] = 30; //Recovery time
			recovery_time = base_recovery_time;
			
			scr_make_sound(snd_explosion_bullet,1,1,false);
			scr_player_voicelines("Hurt");
		}
		else
			global.life = 0;
			
		//Turn off
		if knockback > 0
		{
			yspeed = 0;
			alarm[4] = 1;
		}
		
		//Part: Death Blocker
		if ds_list_find_index(global.parts_equipped,8) != -1 {scr_get_part_effect(8,false);}	
			
		//Settings
		recovery = 1;
		dash = false;
		hurt = true;
		climbing = false;
		attack_action = attack_actions.none;
		
		if bike = true
		{
			if global.life > 0
				alarm[3] = 5;
		}
		else
		{
			//Knockback
			yspeed = -3;
			if other.x > x
				xspeed = -knockback;
			else
				xspeed = knockback;
		}
	}
} 







