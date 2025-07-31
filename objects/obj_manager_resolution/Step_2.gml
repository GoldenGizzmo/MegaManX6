/// @description Insert description here
// You can write your code in this editor

#macro view view_camera[0]
camera_set_view_size(view,global.view_width,global.view_height);

if instance_exists(obj_spawnzone)
	camera_set_view_pos(view,obj_spawnzone.x-global.view_width/2,obj_spawnzone.y-global.view_height/2);