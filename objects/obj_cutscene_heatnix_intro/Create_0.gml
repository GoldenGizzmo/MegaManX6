/// @description Insert description here
// You can write your code in this editor

action = 0;
action_player = 0;
alarm[0] = 30;

xspeed = 0;
camera = 0;

global.hud_toggle = true;
with obj_player
{
	obj_cutscene_heatnix_intro.camera = instance_place(x,y,obj_camera_bossroom);
	
	bike = true;
	x -= 200;
	//y += 2;
	
	colliding = false;
	sprite_index = spr_port_x_bike_reel;
}
instance_create_depth(0,0,0,obj_ridechaser);

global.hud_toggle = false;