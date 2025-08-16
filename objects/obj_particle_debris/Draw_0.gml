/// @description Insert description here
// You can write your code in this editor

if sprite_index = spr_enemy_grasshopper_debris
{
	pal_swap_set(spr_enemy_grasshopper_palette,palette,false);
	draw_self();
	pal_swap_reset();
}
else	
	draw_self();