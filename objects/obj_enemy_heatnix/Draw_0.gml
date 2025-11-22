/// @description Insert description here
// You can write your code in this editor

gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_boss_heatnix_indicator,0,obj_camera.x,y,10,1,0,c_white,indicator);
gpu_set_blendmode(bm_normal);

// Inherit the parent event
event_inherited();

draw_text(obj_camera.x,obj_camera.y,life);