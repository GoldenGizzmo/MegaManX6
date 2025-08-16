/// @description Insert description here
// You can write your code in this editor

draw_self()
draw_sprite_ext(spr_water_top,global.animate/20,x,y,image_xscale,1,0,image_blend,1);

var water = id;
if place_meeting(x,y-8,obj_player)
{
	with obj_player
	{
		if y < water.y+15
		{
			if xspeed = 0
				draw_sprite(spr_water_ripple,global.animate/10,x,water.y)
			else
				draw_sprite_ext(spr_water_ripple_move,global.animate/5,x,water.y,image_xscale,1,0,c_white,1);
		}
		else if y > water.y+30 //Deeper in the water
		{
			//Underwater bubbles
			if global.animate%120 = 0
			{
				effect = instance_create_depth(x+(10*image_xscale),y-10,depth-15,obj_explosion)
				effect.sprite_index = spr_effect_bubbles;
			}
		}
	}
	
}