/// @description Insert description here
// You can write your code in this editor

if state = 2 or state = 3
{
	if global.animate%5 = 0
	{
		streak = instance_create_depth(0,0,0,obj_ready_streak)
		streak.draw_y = display_get_gui_height()/2+(random_range(-20,20)*global.ui_scale);
		streak.draw_x = 0;
	
		streak.move_direction = choose(-1,1);
		if streak.move_direction = -1
			streak.draw_x = display_get_gui_width();
	}
}