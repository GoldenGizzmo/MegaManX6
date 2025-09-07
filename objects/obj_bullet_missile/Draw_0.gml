/// @description Insert description here
// You can write your code in this editor

if sprite_index = spr_bullet_missile
{
	draw_sprite_ext(spr_yanma_option_reticle,global.animate/5,target_x,target_y,1,1,0,c_white,0.75);
	draw_sprite_ext(spr_yanma_option_reticle_2,global.animate/5,target_x,target_y,1,1,-global.animate*4,c_white,0.75);
	draw_sprite_ext(spr_yanma_option_reticle_3,global.animate/5,target_x,target_y,1,1,global.animate*4,c_white,0.75);
}
else
	draw_sprite(spr_bullet_missile_reticle,global.animate/10,target_x,target_y);

draw_self();