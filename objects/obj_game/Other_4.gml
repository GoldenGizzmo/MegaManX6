/// @description Insert description here
// You can write your code in this editor

//Check if the first time entering the level (should also check if the level isn't completed)
if global.current_level != room
{
	global.current_level = room;
	
	//Play cutscene
	switch (room)
	{
		case rm_yammark: instance_create_depth(0,0,0,obj_cutscene_amazon_intro);	break;
		default: instance_create_depth(0,0,0,obj_cutscene_level_start);	break
	}
}
else
{
	//Respawning cutscene
	instance_create_depth(0,0,0,obj_cutscene_level_start);	
}


global.life = global.lifemax;

if global.powertank > 0
	for (i = 0; i < 9; i++)
		global.weapon[i].ammo_max = ceil(global.weapon[i].ammo_max*1.25); 










