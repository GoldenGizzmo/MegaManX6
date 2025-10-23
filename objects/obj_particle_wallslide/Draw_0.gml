/// @description Insert description here
// You can write your code in this editor

if obj_player.wall_slide = true and sprite_index != spr_effect_wallslide_end
{
	x_pos = obj_player.x+20*image_xscale;
	y_pos = obj_player.y+23
}
		
draw_sprite_ext(sprite_index,image_index,x_pos,y_pos,image_xscale,1,0,c_white,1);