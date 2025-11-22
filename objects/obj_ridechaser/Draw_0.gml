/// @description Insert description here
// You can write your code in this editor

draw_sprite_tiled_ext(spr_heatnix_road_bg,0,camera_get_view_x(view_camera[0])+(ridechaser_moving),camera_get_view_y(view_camera[0]),1,1,c_white,1);

draw_sprite_tiled_ext(spr_heatnix_road,0,camera_get_view_x(view_camera[0])+ridechaser_moving,camera_get_view_y(view_camera[0]),1,1,c_white,1);

//draw_sprite_tiled_ext(spr_weapon_lines,1,ridechaser_moving*2,0,-1,1,c_white,0.5);