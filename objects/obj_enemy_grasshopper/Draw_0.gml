/// @description Insert description here
// You can write your code in this editor


//Prevents flashing white when "killed"
if state = "Reviving"
{
	pal_swap_set(spr_enemy_grasshopper_palette,palette,false);
	if flicker = true
		draw_sprite_ext(spr_enemy_grasshopper_idle,0,x,y,image_xscale,image_yscale,0,c_white,1);
	
	draw_self();
	pal_swap_reset();
}
else
{
	if isHit = false
	{
		//Back jets and where they are based on the pose
		var x_offset = -1;
		var y_offset = 0;
		switch (sprite_index)
		{
			case spr_enemy_grasshopper_swipe:
			case spr_enemy_grasshopper_swipe_alt:
				if image_index > 1 and image_index < 5
					x_offset = -5;
				else if image_index > 6
					x_offset = -1;
				break;
			
			case spr_enemy_grasshopper_spawn:
				if (image_index > 1 and image_index < 2) or (image_index > 6 and image_index < 7)
					x_offset = -5;
				if image_index > 2 and image_index < 6
				{
					x_offset = -10;
					y_offset = -6;
				}
				break;
				
			case spr_enemy_grasshopper_idle_alt:
				if image_index > 2 and image_index < 4
					y_offset = 1;
				break;
		}
		draw_sprite_ext(spr_enemy_grasshopper_jets,(global.animate/5)*jet_anim_speed,x+(x_offset*image_xscale),y+y_offset,image_xscale,image_yscale,0,c_white,image_alpha);
		
		pal_swap_set(spr_enemy_grasshopper_palette,palette,false);
		event_inherited();
		pal_swap_reset();
	}
	else
		event_inherited();
}