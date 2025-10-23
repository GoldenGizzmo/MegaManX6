/// @description Insert description here
// You can write your code in this editor

if palette_type != 0
{
	pal_swap_set(palette_type,palette,false);
	draw_self();
	pal_swap_reset();
}
else
	draw_self();