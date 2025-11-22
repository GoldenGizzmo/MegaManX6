/// @description Insert description here
// You can write your code in this editor

if life > 0 or death < 1
{
	if !(isHit)
	{
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,rotate,image_blend,image_alpha);
		draw_sprite_ext(spr_enemy_spiky_face,global.animate/2,x,y,1,1,0,image_blend,image_alpha);
	}

	if (isHit) 
	{
		gpu_set_fog(true,make_color_rgb(211,232,248),0,0);
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,rotate,image_blend,image_alpha);
		gpu_set_fog(false,make_color_rgb(211,232,248),0,0);
	}
}