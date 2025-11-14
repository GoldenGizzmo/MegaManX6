// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_armour()
{
	if obj_player.armour_down = false
	{
		var xscale = image_xscale
		if obj_player.bike = true
			xscale = 1;
		
		if global.x_armour_leg = "Blade Leg"
		{
			var armour_legs = asset_get_index(sprite_get_name(sprite_index)+"_bladelegs")
			if armour_legs != -1
				draw_sprite_ext(armour_legs,image_index,x,y,xscale,image_yscale,image_angle,image_blend,image_alpha);
		}
	}
}