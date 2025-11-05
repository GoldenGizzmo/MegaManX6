/// @description Insert description here
// You can write your code in this editor

//Check if the first time entering the level (also check if the level isn't completed)
if global.current_level != room and global.level_completed = false
{
	global.current_level = room;

	//Play cutscene
	switch (room)
	{
		case rm_intro: instance_create_depth(0,0,0,obj_cutscene_intro_intro); break;
		case rm_yammark: instance_create_depth(0,0,0,obj_cutscene_amazon_intro); break;
		case rm_turtloid: instance_create_depth(0,0,0,obj_cutscene_temple_intro); break;
		//case rm_heatnix: 
		//	instance_create_depth(0,0,0,obj_cutscene_level_start_bike); 
		//	break;
		case rm_weapon_get: instance_create_depth(0,0,0,obj_cutscene_weapon_get); break;
		default: instance_create_depth(0,0,0,obj_cutscene_level_start);	break
	}
}
else
{
	//Respawning cutscene
	if obj_player.x = 1120
		instance_create_depth(0,0,0,obj_cutscene_level_start_bike); 
	else
		instance_create_depth(0,0,0,obj_cutscene_level_start);	
}

//Part: Life Up
if ds_list_find_index(global.parts_equipped,6) != -1 {scr_get_part_effect(6,false);}

event_user(0);
global.life = global.lifemax;
global.weapon_choice = 0;
for (var i = 0; i < 9; i++)
{
	if global.powertank > 0
		global.weapon[i].ammo_max = ceil(global.weapon[i].ammo_max*1.25); 
		
	global.weapon[i].ammo = global.weapon[i].ammo_max;
}










