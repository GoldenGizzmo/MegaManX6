// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_weapon_get(position,name)
{
	switch (name)
	{
		case "X-Saber":
			global.weapon[position] = 
			{
				type : "X-Saber", 
				ammo_usage : -1, 
				ammo : -1, 
				charge_cost : -1,
			}
			break;
		
		case "Yanma Option":
			global.weapon[position] = 
			{
				type : name, 
				ammo_usage : 6, 
				ammo : 0, 
				charge_cost : 12,
			}
			break;	
			
		case "Meteor Rain":
			global.weapon[position] = 
			{
				type : "Meteor Rain", 
				ammo_usage : 2, 
				ammo : 0, 
				charge_cost : 12,
			}
			break;
			
		case "Magma Blade":
			global.weapon[position] = 
			{
				type : "Magma Blade", 
				ammo_usage : 2, 
				ammo : 0, 
				charge_cost : 6,
			}
			break;
	}
	
	global.give_weapon = name;
}

function scr_weapon_menus(weapon_name)
{
	weapon_bar_colour_1 = c_orange;
	weapon_bar_colour_2 = c_yellow;
	weapon_ammo_colour = c_white;
	
	weapon_description = "Nothing";
	weapon_description_long = weapon_description;
	switch (weapon_name)
	{
		case "X-Saber":
			weapon_description = "Can be charged to fire powerful projectiles. \nX-Saber can also be used to slash through \nmultiple enemies.";
			break;
			
		case "Yanma Option":
			weapon_description = "Summons orbiting dragonflies which fire forward in \ntandem with the X-Buster.";
			weapon_description_long = "Summons orbiting dragonflies which fire forward in tandem with the X-Buster.\n\n^ Can block multiple projectiles before being destroyed\n^ Will decay over time\n^ Can be stacked numerous times which also resets decay";
		
			weapon_bar_colour_1 = c_lime
			weapon_bar_colour_2 = make_colour_rgb(255,97,0);;
			weapon_ammo_colour = c_lime;
			break;
		
		case "Meteor Rain":
			weapon_description = "Fires a projectile which rises up before bursting. \nShowering down multiple, harmful rain drops.";
			weapon_description_long = "Fires a projectile which rises up before bursting. Showering down multiple, \nharmful rain drops.\n\n^ Can be angled with the 'Up' and 'Down' directional inputs\n^ Passes through walls\n^ Great for vertical threats";
			
			weapon_bar_colour_1 = c_red;
			weapon_bar_colour_2 = c_dkgray;
			weapon_ammo_colour = c_red;
			break;	
			
		case "Magma Blade":
			weapon_description = "Slash with a blade of flame which create additional waves of fire.";
			 
			weapon_bar_colour_1 = make_colour_rgb(248,232,144);
			weapon_bar_colour_2 = make_colour_rgb(255,97,0);
			weapon_ammo_colour = make_colour_rgb(255,97,0);
			break;		
				
		case "Ray Arrow":
			weapon_description = "Fires a quick laser which penetrates through enemies and can even damage those protected by armour.";
			 
			weapon_bar_colour_1 = c_white;
			weapon_bar_colour_2 = c_purple;
			weapon_ammo_colour = c_purple;
			break;
	
	
	}
	
	return weapon_name;
}