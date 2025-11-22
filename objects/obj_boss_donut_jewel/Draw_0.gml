/// @description Insert description here
// You can write your code in this edit
/// @description Insert description here
// You can write your code in this editor


var owner = instance_nearest(x,y,obj_boss_donut);

if (life > 0 or death < 1) and owner.sprite_index = spr_boss_donut
{
	if !(isHit)
		draw_sprite_ext(sprite_index,image_index,owner.x,owner.y,1,1,owner.rotate,owner.image_blend,image_alpha);

	if (isHit) 
	{
		gpu_set_fog(true,make_color_rgb(211,232,248),0,0);
		draw_sprite_ext(sprite_index,image_index,owner.x,owner.y,1,1,owner.rotate,owner.image_blend,image_alpha);
		gpu_set_fog(false,make_color_rgb(211,232,248),0,0);
	}
}


