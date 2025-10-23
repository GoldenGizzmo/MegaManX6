/// @description Insert description here
// You can write your code in this editor

//Large souls are only collected while moving towards the player
if (sprite_index = spr_pickup_soul_large and large_soul_state < 2)
	exit;
if auto_pickup = "Appear"
	exit;
if soul_steal != 0
	exit;
	
//Heart Tanks, Sub Tanks, Weapon Tank, Power Tank
if pickup_type >= 2 and pickup_type <= 6
	ds_list_add(global.pickup_list,key); //Store

switch pickup_type
{
	case 0:
		if global.life < global.lifemax
		{
			if siphon = false
			{
				global.pause = true;
				
				if global.life+pickup_power < global.lifemax
					global.pause_healing = global.life+pickup_power;
				else 
					global.pause_healing = global.lifemax;
			}
			else
			{
				//Siphon part doesn't pause the game (would get annoying)
				if global.life+pickup_power < global.lifemax
					global.life = global.life+pickup_power;
				else 
					global.life = global.lifemax;		
					
				scr_make_sound(snd_energy_tank,0.5,1.5,false);
			}
		}
		else //If at max, fill subtank instead
		{		
			//Subtank		
			//Check sub tank #1 is aquired and not full
			if global.subtank_1 > -1 and global.subtank_1 < global.tank_cap
			{
				scr_make_sound(snd_energy_tank,1,1,false);
				if global.subtank_1+pickup_power < global.tank_cap
					global.subtank_1 += pickup_power;
				else
					global.subtank_1 = global.tank_cap;
			}
			//Check sub tank #2 is aquired and not full
			else if global.subtank_2 > -1 and global.subtank_2 < global.tank_cap
			{
				scr_make_sound(snd_energy_tank,1,1,false);
				if global.subtank_2+pickup_power < global.tank_cap
					global.subtank_2 += pickup_power;
				else
					global.subtank_2 = global.tank_cap;
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
			for (var i = 1; i < array_length(global.weapon); i++)
			{
				if global.weapon[i].ammo < global.weapon[i].ammo_max
					refilled_weapon = global.weapon[i];
			}
			
		}
		//If found a weapon to refill
		if refilled_weapon != 0
		{
			scr_make_sound(snd_weapon_tank,1,1,false);
			
			//Fill a percentage amount of ammo
			if sprite_index = spr_pickup_energy_small
				pickup_power = ceil(refilled_weapon.ammo_max/5); //Refill 20%
			else if sprite_index = spr_pickup_energy_mid
				pickup_power = ceil(refilled_weapon.ammo_max/2); //Refill 50% 
			else if sprite_index = spr_pickup_energy_siphon
				pickup_power = ceil(refilled_weapon.ammo_max/5); //Refill 5% 
				
			//Refill
			if refilled_weapon.ammo+pickup_power < refilled_weapon.ammo_max
				refilled_weapon.ammo += pickup_power;
			else 
				refilled_weapon.ammo = refilled_weapon.ammo_max;
		}
		else  //If all special weapons are at max, fill weapontank instead
		{
			//Weapontank
			//Check weapon tank is aquired and not full
			if global.weapontank > -1 and global.weapontank < global.tank_cap
			{
				scr_make_sound(snd_weapon_tank,1,1,false);
				
				if global.weapontank+pickup_power < global.tank_cap
					global.weapontank += pickup_power;
				else
					global.weapontank = global.tank_cap;
			}
		}
		break;
		
	case 2:
		//Pause the game for fanfair
		global.pause = true;
		global.pause_delay = 60;
		
		global.hearttank += pickup_power;
		scr_make_sound(snd_pickup,1,1,false);
		break;
		
	case 3:
		//Pause the game for fanfair
		global.pause = true;
		global.pause_delay = 60;
		
		global.subtank_1 = 0;
		scr_make_sound(snd_pickup,1,1,false);
		break;
	case 4:
		//Pause the game for fanfair
		global.pause = true;
		global.pause_delay = 60;
		
		global.subtank_2 = 0;
		scr_make_sound(snd_pickup,1,1,false);
		break;
	case 5:
		//Pause the game for fanfair
		global.pause = true;
		global.pause_delay = 60;
		
		global.weapontank = 0;
		scr_make_sound(snd_pickup,1,1,false);
		break;
	case 6:
		//Pause the game for fanfair
		global.pause = true;
		global.pause_delay = 60;
		
		global.powertank = 1;
		scr_make_sound(snd_pickup,1,1,false);
		
		//Increase max ammo for all special weapons
		for (var i = 0; i < 9; i++)
			global.weapon[i].ammo_max = ceil(global.weapon[i].ammo_max*1.25); 
		break;
		
	case 7: //Nightmare Souls
		global.nightmare_souls += pickup_power;
		switch (sprite_index)
		{
			case spr_pickup_soul_small: scr_make_sound(snd_soul_collect,1,1.5,false); break;
			case spr_pickup_soul_mid: scr_make_sound(snd_soul_collect,1,1,false); break;
			case spr_pickup_soul_large: scr_make_sound(snd_soul_collect,1,0.5,false); break;
		}
		
		//Display counter
		obj_game.souls_collected += pickup_power;
		obj_game.souls_timer = 180;
		break;
}

instance_destroy();














