/// @description Insert description here
// You can write your code in this editor

if isHit = false
{
	pal_swap_set(spr_enemy_worm_palette,palette,false);
	event_inherited();
	pal_swap_reset();
}
else
	event_inherited();
