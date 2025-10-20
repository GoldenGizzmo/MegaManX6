/// @description Insert description here
// You can write your code in this editor

//If warp beam is higher than the player start position
if warp_y+warp_speed > 0
	warp_y -= warp_speed;
else
{	
	if warping_in = true
	{
		warping_in = false;
	
		image_alpha = 1
		image_speed = 1;
		sprite_index = spr_boss_nightmarezero_warp_in;
	}
	
	var amount = 10
	if sprite_index = spr_boss_nightmarezero_dash
		amount = 3;
	
	if global.animate%amount = 0
	{
		offset_x = random_range(-1,1);
		offset_y = random_range(-1,1);
		
		var offset_chance = irandom(3);
		var offset_range = 4;
		if offset_chance = 0
		{
			offset_x += random_range(-offset_range,offset_range);
			offset_y += random_range(-offset_range,offset_range);
		}
		
		afterimage = instance_create_depth(x+offset_x,y+offset_y,depth+10,obj_afterimage);
		afterimage.image_blend = choose(make_color_rgb(156,105,189),make_color_rgb(99,195,231));
		afterimage.sprite_index = sprite_index;
		afterimage.image_index = image_index;
		afterimage.image_xscale = image_xscale;
	}
}

