/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Part: Energy Siphon
if ds_list_find_index(global.parts_equipped,5) != -1 {scr_get_part_effect(5,0);}	
