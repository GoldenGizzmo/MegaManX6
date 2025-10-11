/// @description Insert description here
// You can write your code in this editor

//draw_sprite_tiled_ext(spr_acid_rain,global.animate/4,0,0,1,1,c_white,rain_alpha);

draw_sprite_tiled_ext(spr_acid_rain,global.animate/4,lerp(0,camera_get_view_x(view_camera[0])-(global.view_width/2),1),camera_get_view_y(view_camera[0]),1,1,c_white,rain_alpha-submerged);