/// @description Insert description here
// You can write your code in this editor

palette_main = irandom(7);
palette_skin = irandom(5);
palette_secondary = irandom(7);

sprite_index = choose
(
	spr_reploid_heatnix,
	spr_reploid_mijinion,
	spr_reploid_scaravich,
	spr_reploid_sharkplayer,
	spr_reploid_sheldon,
	spr_reploid_turtloid,
	spr_reploid_yammark
);

rescued = false;

//Unique string that makes each reploid unique
key = room_get_name(room)+object_get_name(object_index)+string(x)+string(y);

//Destroy if already rescued
if ds_list_find_index(global.rescue_list,key) != -1
	instance_destroy();
