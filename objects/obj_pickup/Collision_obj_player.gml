/// @description Insert description here
// You can write your code in this editor

//Large souls are only collected while moving towards the player
if sprite_index = spr_pickup_soul_large and large_soul_state < 2
	exit;

switch pickup_type
{
	case 0:
		var subtank_fill = 0;	
		if global.life < global.lifemax
		{
			global.pause = true;
				
			if global.life+pickup_power < global.lifemax
				global.pause_healing = global.life+pickup_power;
			else 
				global.pause_healing = global.lifemax;
		}
		else //If at max, fill subtank instead
		{		
			//Subtank
			var subtank_cap = 28;	
				
			//Check sub tank #1 is aquired and not full
			if global.subtank_1 > -1 and global.subtank_1 < subtank_cap
			{
				if global.subtank_1+pickup_power < subtank_cap
					global.subtank_1 += pickup_power;
				else
					global.subtank_1 = subtank_cap;
			}
			//Check sub tank #2 is aquired and not full
			else if global.subtank_2 > -1 and global.subtank_2 < subtank_cap
			{
				if global.subtank_2+pickup_power < subtank_cap
					global.subtank_2 += pickup_power;
				else
					global.subtank_2 = subtank_cap;
			}
		}
		break;
		
	case 1:
		var refilled_weapon = 0;
	
		//If selected special weapon is not at max and not the X-Saber
		if global.weapon[global.weapon_choice].ammo < global.weapon[global.weapon_choice].ammo_max and global.weapon_choice != 0
			refilled_weapon = global.weapon[global.weapon_choice]; //Refill it
		else
		{
			//Check all the other special weapons and fill them instead
			for (i = 1; i < array_length(global.weapon); i++)
			{
				if global.weapon[i].ammo < global.weapon[i].ammo_max
					refilled_weapon = global.weapon[i];
			}
			
		}
		//If found a weapon to refill
		if refilled_weapon != 0
		{
			if refilled_weapon.ammo+pickup_power < refilled_weapon.ammo_max
				refilled_weapon.ammo += pickup_power;
			else 
				refilled_weapon.ammo = refilled_weapon.ammo_max;
		}
		else  //If all special weapons are at max, fill weapontank instead
		{
			//Weapontank
			var weapontank_cap = 28;
			
			//Check weapon tank is aquired and not full
			if global.weapontank > -1 and global.weapontank < weapontank_cap
			{
				if global.weapontank+pickup_power < weapontank_cap
					global.weapontank += pickup_power;
				else
					global.weapontank = weapontank_cap;
			}
		}
		break;
		
	case 2:
		//Pause the game for fanfair
		global.pause = true;
		global.pause_delay = 60;
		
		global.hearttank += pickup_power;
		break;
		
	case 3:
		//Pause the game for fanfair
		global.pause = true;
		global.pause_delay = 60;
		
		global.subtank_1 = 0;
		break;
	case 4:
		//Pause the game for fanfair
		global.pause = true;
		global.pause_delay = 60;
		
		global.subtank_2 = 0;
		break;
	case 5:
		//Pause the game for fanfair
		global.pause = true;
		global.pause_delay = 60;
		
		global.weapontank = 0;
		break;
	case 6:
		//Pause the game for fanfair
		global.pause = true;
		global.pause_delay = 60;
		
		global.powertank = 1;
		//Increase max ammo for all special weapons
		for (i = 0; i < 9; i++)
			global.weapon[i].ammo_max = ceil(global.weapon[i].ammo_max*1.25); 
		break;
		
	case 7: //Nightmare Souls
		global.nightmare_souls += pickup_power;
		break;
}

instance_destroy();














