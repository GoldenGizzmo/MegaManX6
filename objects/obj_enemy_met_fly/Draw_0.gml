/// @description Insert description here
// You can write your code in this editor

if life > 0 or death < 1
{
	if !(isHit)
		draw_sprite_ext(spr_enemy_met_fly_propeller,propeller_spin/2,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

	if (isHit) 
	{
		gpu_set_fog(true,make_color_rgb(211,232,248),0,0);
		draw_sprite_ext(spr_enemy_met_fly_propeller,propeller_spin/2,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
		gpu_set_fog(false,make_color_rgb(211,232,248),0,0);
	}
}

// Inherit the parent event
event_inherited();

if isHit = false and sprite_index = spr_enemy_met_fly
{
	var face = 0; //Look forward
	if obj_player.y > y+30 {face = 1;} //Look all the way up	
	else if obj_player.y < y-30 {face = 4;} //Look all the way down	
	else if obj_player.y > y+15 {face = 2;} //Look up
	else if obj_player.y < y-15 {face = 3;} //Look down	

	draw_sprite_ext(spr_enemy_met_fly_face,face,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

}