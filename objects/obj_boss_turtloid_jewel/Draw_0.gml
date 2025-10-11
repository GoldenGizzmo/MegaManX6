/// @description Insert description here
// You can write your code in this edit
/// @description Insert description here
// You can write your code in this editor

var owner = obj_boss_turtloid;

if jewel_top = true
{
	switch (owner.sprite_index)
	{
		case spr_boss_turtloid_idle: sprite_index = spr_boss_turtloid_idle_jewel_top; break;
		case spr_boss_turtloid_stomp: sprite_index = spr_boss_turtloid_stomp_jewel_top; break;
		case spr_boss_turtloid_shielding: 
		case spr_boss_turtloid_spinning: 
			sprite_index = spr_boss_turtloid_shielding_jewel_top
			break;
	}
}
else
{
	switch (owner.sprite_index)
	{
		case spr_boss_turtloid_idle: sprite_index = spr_boss_turtloid_idle_jewel_bottom; break;
		case spr_boss_turtloid_stomp: sprite_index = spr_boss_turtloid_stomp_jewel_bottom; break;
		case spr_boss_turtloid_shielding: 
		case spr_boss_turtloid_spinning: 
			sprite_index = spr_boss_turtloid_shielding_jewel_bottom
			break;
	}
}

if owner.sprite_index = spr_boss_turtloid_spinning
	image_index = 4; 
else
	image_index = owner.image_index;

if life > 0 or death < 1
{
	if !(isHit)
		draw_sprite_ext(sprite_index,image_index,owner.x,owner.y,owner.image_xscale,owner.image_yscale,owner.rotate,owner.image_blend,image_alpha);

	if (isHit) 
	{
		gpu_set_fog(true,make_color_rgb(211,232,248),0,0);
		draw_sprite_ext(sprite_index,image_index,owner.x,owner.y,owner.image_xscale,owner.image_yscale,owner.rotate,owner.image_blend,image_alpha);
		gpu_set_fog(false,make_color_rgb(211,232,248),0,0);
	}
}


//Shine and fade out
if appearing = false
{
	if appearing_shine > 0
	{
		gpu_set_fog(true,make_color_rgb(211,232,248),0,0);
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,appearing_shine);
		gpu_set_fog(false,make_color_rgb(211,232,248),0,0);
		
		appearing_shine -= 0.02;
	}
}




