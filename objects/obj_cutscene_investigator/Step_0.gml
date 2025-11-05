/// @description Insert description here
// You can write your code in this editor

//Move from one side to another
if strand_move < 120
{
	strand_move++

	strand.x += 13;
	strand_2.x -= 13;
}

if global.input_start_pressed and action < 7
{
	instance_create_depth(0,0,0,obj_fade_out);
	action_ending = 1;

	action = 7;
	alarm[0] = 1;
}

if action_ending = 1
{
	if obj_fade_out.alpha >= 2
		action_ending++
}
else if action_ending = 2
{
	global.pause = false;
	global.pause_screen = false;
	global.pause_screen_state = 0;
		
	scr_get_level(obj_menu_paused.menu_position);
	room_goto(obj_menu_paused.level_destination);
}