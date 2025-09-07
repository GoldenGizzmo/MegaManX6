/// @description Insert description here
// You can write your code in this editor

if image_speed > 0
	image_index = image_number-1;
else
	image_index = 0;
image_speed = 0;

if open_state = 1
{
	open_state++;
	scr_make_sound(snd_door_move,1,1,false);
}












