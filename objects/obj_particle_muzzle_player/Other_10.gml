/// @description Insert description here
// You can write your code in this editor

var wall_slide_reverse = 1;
if obj_player.wall_slide = true
	wall_slide_reverse = -1;
if image_xscale != obj_player.image_xscale*wall_slide_reverse
	instance_destroy();
	
	
draw_sprite_ext(sprite_index,image_index,obj_player.x+x_pos,obj_player.y+y_pos,image_xscale,1,0,c_white,1);