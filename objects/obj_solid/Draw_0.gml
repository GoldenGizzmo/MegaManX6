/// @description Insert description here
// You can write your code in this editor

if slope = false
{
	for (var i = 0; i < image_xscale; i++)
	{
		draw_sprite(spr_solid_block,0,x+(16*i),y);
		for (var a = 0; a < image_yscale; a++)
			draw_sprite(spr_solid_block,0,x+(16*i),y+(16*a));
	}
}