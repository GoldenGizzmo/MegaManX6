/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	var wing_sprite = spr_boss_yammark_wings
	switch (sprite_index)
	{
		case spr_boss_yammark_attack: wing_sprite = spr_boss_yammark_attack_wings; break;
		case spr_boss_yammark_fly_away: wing_sprite = spr_boss_yammark_fly_away_wings; break;
		case spr_boss_yammark_fly_upwards_wings: wing_sprite = spr_boss_yammark_fly_upwards_wings; break;
	}
	draw_sprite_ext(wing_sprite,global.animate/2,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}
event_inherited();
/*
draw_set_font(global.fnt_game)
draw_text(x,y-40,"Alarm 0 : "+string(alarm[0]));
draw_text(x,y-30,"Alarm 1 : "+string(alarm[1]));