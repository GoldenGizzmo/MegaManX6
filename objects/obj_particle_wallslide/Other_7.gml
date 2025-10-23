/// @description Insert description here
// You can write your code in this editor

if sprite_index = spr_effect_wallslide_start
{
	image_index = 0;
	sprite_index = spr_effect_wallslide;
}
else if sprite_index = spr_effect_wallslide and obj_player.wall_slide = false
	sprite_index = spr_effect_wallslide_end;
else if sprite_index = spr_effect_wallslide_end
	instance_destroy();