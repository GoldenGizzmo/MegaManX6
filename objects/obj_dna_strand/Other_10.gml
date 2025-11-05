/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < 15; i++)
{
	draw_sprite_ext(spr_investigator_dna_connect,0,x,y+(distance*i*image_xscale),image_xscale*(move[i]/(3*image_xscale)),image_yscale,0,image_blend,image_alpha)

	draw_sprite_ext(spr_investigator_dna,0,x+move[i],y+(distance*i*image_xscale),image_xscale,image_yscale,0,image_blend,image_alpha)
	draw_sprite_ext(spr_investigator_dna,0,x-move[i],y+(distance*i*image_xscale),image_xscale,image_yscale,0,image_blend,image_alpha)
}