/// @description Insert description here
// You can write your code in this editor

if animation_loop = false
{
	image_speed = 0;
	image_index = -1;
}

if animation_next != 0
{
	if sprite_index != animation_next
	{
		image_index = 0;
		sprite_index = animation_next;
	}
}