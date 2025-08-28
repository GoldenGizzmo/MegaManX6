/// @description Insert description here
// You can write your code in this editor

//Lighten the load for the game
if place_meeting(x,y,obj_spawnzone)
{
	pal_swap_set(spr_reploid_palette_main,palette_main,false);
		draw_self();
	pal_swap_set(spr_reploid_palette_skin,palette_skin,false);
		draw_self();	
	pal_swap_set(spr_reploid_palette_secondary,palette_secondary,false);
		draw_self();	
	
	//HELP ME!
	if sprite_index != spr_reploid_warp
	{
		var talk = spr_reploid_help;
		if rescued = true
			talk = spr_reploid_thanks
		draw_sprite_ext(talk,global.animate/10,x,y-(sprite_height/2)-2,1,1,0,c_white,1);
	}
	pal_swap_reset();
}