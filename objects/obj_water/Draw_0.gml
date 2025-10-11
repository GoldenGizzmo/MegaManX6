/// @description Insert description here
// You can write your code in this editor

draw_self()
draw_sprite_ext(spr_water_top,global.animate/20,x,y,image_xscale,1,0,image_blend,1);

/*
//Visual effect
gpu_set_blendenable(false)
gpu_set_colorwriteenable(false,false,false,true);
draw_set_alpha(0);
draw_rectangle(0,0,room_width,room_height,false);

draw_set_alpha(1);
draw_self();
draw_sprite_ext(spr_water_top,global.animate/20,x,y,image_xscale,1,0,image_blend,1);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);

gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
draw_self()
draw_sprite_ext(spr_water_top,global.animate/20,x,y,image_xscale,1,0,image_blend,1);
draw_sprite_tiled_ext(spr_water_acid,global.animate/4,x,y-global.animate/4,1,1,c_white,1);
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);
*/

if place_meeting(x,y-8,obj_player)
{
	with obj_player
	{
		water = instance_place(x,y-8,obj_water);
		if water!= noone
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
}

if place_meeting(x,y-8,obj_enemy_seahorse)
{
	with obj_enemy_seahorse
	{
		if life > 0
		{
			water = instance_place(x,y-8,obj_water);
			if water!= noone
			{
				if y < water.y+15
				{
					if xspeed = 0
						draw_sprite(spr_water_ripple,global.animate/10,x,water.y)
					else
						draw_sprite_ext(spr_water_ripple_move,global.animate/5,x,water.y,image_xscale,1,0,c_white,1);
				}
			}
		}
	}
}