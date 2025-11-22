/// @description Insert description here
// You can write your code in this editor

if image_index > 2 and state = 0
	image_index = 0
else if image_index > 8 and state = 1
	image_index = 6;
	
if owner.life > 0
{
	x = owner.x+x_pos;
	y = owner.y+y_pos;
}