/// @description Insert description here
// You can write your code in this editor

//Check if the first time entering the level (should also check if the level isn't completed)
if global.current_level != room
{
	global.current_level = room;

	//Play cutscene
	switch (room)
	{
		case rm_intro: instance_create_depth(0,0,0,obj_cutscene_intro_intro); break;
		case rm_yammark: instance_create_depth(0,0,0,obj_cutscene_amazon_intro); break;
		case rm_turtloid: instance_create_depth(0,0,0,obj_cutscene_temple_intro); break;
		case rm_weapon_get: instance_create_depth(0,0,0,obj_cutscene_weapon_get); break;
		default: instance_create_depth(0,0,0,obj_cutscene_level_start);	break
	}
}
else
{
	//Respawning cutscene
	instance_create_depth(0,0,0,obj_cutscene_level_start);	
}


global.life = global.lifemax;
global.weapon_choice = 0;
for (var i = 0; i < 9; i++)
{
	if global.powertank > 0
		global.weapon[i].ammo_max = ceil(global.weapon[i].ammo_max*1.25); 
		
	global.weapon[i].ammo = global.weapon[i].ammo_max;
}










