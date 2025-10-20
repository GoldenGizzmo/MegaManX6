/// @description Insert description here
// You can write your code in this editor

if image_xscale != obj_player.image_xscale
	instance_destroy();
draw_sprite_ext(sprite_index,image_index,obj_player.x+x_pos,obj_player.y+y_pos,image_xscale,1,0,c_white,1);