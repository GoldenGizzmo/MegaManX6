/// @description Insert description here
// You can write your code in this editor

background = 0;
switch (room)
{
	case rm_intro: background = spr_bg_intro_crash; break;
	case rm_yammark: background = spr_bg_yammark_temples; break;
	case rm_turtloid: background = spr_bg_turtloid; break;
}

bg_colour = c_grey;
bg_alpha = 1;

ambience = "Level";
ambience_changed = false;

var _depth = layer_get_depth(layer_get_id("Background"));
depth = _depth-10;