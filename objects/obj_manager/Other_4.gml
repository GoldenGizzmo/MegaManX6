/// @description Insert description here
// You can write your code in this editor

//Clear array for storing enemies
for (i = 0; i < 500; i++) //Track dead enemies for respawns 
	store_respawn[i] = {store_x : 0, store_y : 0, store_depth : 0, store_object : -1, store_xscale : 0, store_yscale : 0, store_angle : 0, store_type : 0, respawn : 0}; //Store xstart and ystart

//If entering a new room for the first time
if current_area != room
{
	//Setting Checkpoints to the starting position
	global.checkpointx = obj_player.xstart;
	global.checkpointy = obj_player.ystart;
	
	current_area = room;
}

//Player spawns at checkpoints
obj_player.x = global.checkpointx;
obj_player.y = global.checkpointy;
obj_camera.x = obj_player.x;
obj_camera.y = obj_player.y;









