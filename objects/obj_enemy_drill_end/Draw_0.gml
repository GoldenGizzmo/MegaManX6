/// @description Insert description here
// You can write your code in this editor

if instance_exists(owner)
{
	if sprite_index = spr_enemy_drill_end
		image_index = owner.image_index;

	if life > 0 or death < 1
	{
		if !(isHit)
		{
			draw_sprite_ext(spr_enemy_drill_arm,0,x,y-30,image_xscale,-image_yscale*(distance_to_object(owner)+1),0,owner.image_blend,image_alpha)
			draw_sprite_ext(sprite_index,image_index,owner.x,y,owner.image_xscale,owner.image_yscale,image_angle,owner.image_blend,image_alpha);
		}
		if (isHit) 
		{
			gpu_set_fog(true,make_color_rgb(211,232,248),0,0);
			draw_sprite_ext(spr_enemy_drill_arm,0,x,y-30,image_xscale,-image_yscale*(distance_to_object(owner)+1),0,owner.image_blend,image_alpha)
			draw_sprite_ext(sprite_index,image_index,owner.x,y,owner.image_xscale,owner.image_yscale,image_angle,owner.image_blend,image_alpha);
			gpu_set_fog(false,make_color_rgb(211,232,248),0,0);
		}
	}
}