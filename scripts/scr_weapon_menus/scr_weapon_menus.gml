// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_weapon_menus(weapon_name)
{
	weapon_description = "Nothing"
	
	weapon_bar_colour_1 = c_yellow;
	weapon_bar_colour_2 = c_orange;
	
	weapon_ammo_colour = c_white; 
	switch (weapon_name)
	{
		case "X-Saber":
			weapon_description = "Can be charged to fire powerful projectiles. X-Saber can also be used to slash through multiple enemies.";
			break;
			
		case "Yanma Option":
			weapon_description = "Summons orbiting yanma mechaniloids which fire forward in tandem with the X-Buster.";
		
			weapon_bar_colour_1 = c_orange;
			weapon_bar_colour_2 = c_lime;
			weapon_ammo_colour = c_lime;
			break;
		
		case "Meteor Rain":
			weapon_description = "Fires a projectile which rises up before bursting. Showering down multiple, harmful rain drops.";
			
			weapon_bar_colour_1 = c_red;
			weapon_bar_colour_2 = c_dkgray;
			weapon_ammo_colour = c_red;
			break;		
				
				
		case "Ray Arrow":
			weapon_description = "Fires a quick laser which penetrates through enemies and can even damage those protected by armour.";
			 
			weapon_bar_colour_1 = c_white;
			weapon_bar_colour_2 = c_purple;
			weapon_ammo_colour = c_purple;
			break;
	
	
	}
}