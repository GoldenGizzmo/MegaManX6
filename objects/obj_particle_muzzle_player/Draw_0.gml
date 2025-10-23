/// @description Insert description here
// You can write your code in this editor

if palette_type != 0
{
	pal_swap_set(palette_type,palette,false);
	event_user(0);
	pal_swap_reset();
}
else
	event_user(0);

