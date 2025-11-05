/// @description Insert description here
// You can write your code in this editor

var scale = global.ui_scale/1.25; //Menu size
draw_sprite_ext(spr_white_space,0,x,y,room_width,room_height,0,c_black,1); //Backdrop

//Coloured background
draw_sprite_ext(spr_white_space,0,x,y,room_width,room_height,0,boss_colour,colour_fade);
draw_sprite_ext(spr_white_space,0,x,y,room_width,room_height,0,c_black,0.5)

//Big DNA strand
with obj_dna_strand
	event_user(0)

//Pattern
gpu_set_blendmode(bm_add)
draw_sprite_tiled_ext(spr_investigator_grid,0,obj_menu_paused.pause_animate*3,obj_menu_paused.pause_animate*3,scale,scale,boss_colour,0.3);
gpu_set_blendmode(bm_normal)

//Gradient, swaps from white to black after the flash
if action < 5
{
	draw_sprite_ext(spr_stageselect_gradient,1,display_get_gui_width()/2,display_get_gui_height()/2,global.ui_scale*2,global.ui_scale,0,c_white,middle_fade);
	draw_sprite_ext(spr_stageselect_gradient,1,display_get_gui_width()/2,display_get_gui_height()/2,global.ui_scale*2,-global.ui_scale,0,c_white,middle_fade);
}
else
{
	draw_sprite_ext(spr_pause_gradient,0,display_get_gui_width()/2,display_get_gui_height()/2,global.ui_scale*2,global.ui_scale,0,c_white,1);
	draw_sprite_ext(spr_pause_gradient,0,display_get_gui_width()/2,display_get_gui_height()/2,global.ui_scale*2,-global.ui_scale,0,c_white,1);
}

//Small strands
with obj_dna_strand_small
	event_user(0)

//Draw aferimages for the boss appearing
with obj_afterimage_gui
	draw_self();

//Reveal investigator	
if action >= 2
{
	//If Commander Yammark (Draw drones and wings)
	if boss_sprite = spr_boss_yammark_complete
	{
		if action = 2
			sprite_index = spr_boss_yammark_idle;
		
		var wing_sprite = spr_boss_yammark_wings
		var animate = obj_menu_paused.pause_animate;
		if action >= 5 //Stop animation
		{
			animate = 0;
			with obj_actor_yanma_option
			{
				orbit_freeze = true;
				image_speed = 0;
			}
		}
		
		switch (sprite_index)
		{
			case spr_boss_yammark_attack: wing_sprite = spr_boss_yammark_attack_wings; break;
			case spr_boss_yammark_fly_away: wing_sprite = spr_boss_yammark_fly_away_wings; break;
			case spr_boss_yammark_fly_upwards_wings: wing_sprite = spr_boss_yammark_fly_upwards_wings; break;
		}
		draw_sprite_ext(wing_sprite,animate/2,display_get_gui_width()/2,display_get_gui_height()/2-(10*scale),scale,scale,0,c_white,1);
		draw_sprite_ext(wing_sprite,animate/2,display_get_gui_width()/2,display_get_gui_height()/2-(10*scale),scale,scale,0,c_black,boss_fadein);
	}
	
	//Draw boss
	draw_sprite_ext(sprite_index,image_index,display_get_gui_width()/2,display_get_gui_height()/2-(10*scale),scale,scale,0,c_white,1);
	draw_sprite_ext(sprite_index,image_index,display_get_gui_width()/2,display_get_gui_height()/2-(10*scale),scale,scale,0,c_black,boss_fadein);
	
	
	with obj_actor_yanma_option
		draw_self();
	
	//Reveal name
	if action >= 5
		draw_sprite_ext(spr_investigator_name,obj_menu_paused.menu_position,display_get_gui_width()/2,display_get_gui_height()/2+(40*scale),scale,scale,0,boss_colour,1);
}