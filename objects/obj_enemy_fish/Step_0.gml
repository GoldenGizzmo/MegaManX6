/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	//Afterimage
	if biting = true
	{
		if global.animate%3 = 0
		{
			afterimage = instance_create_depth(x,y,depth+10,obj_afterimage);
			afterimage.sprite_index = sprite_index;
			afterimage.image_xscale = image_xscale;
			afterimage.image_blend = make_color_rgb(137,0,0);
		}
	}
	
	if biting_cooldown > 0
		biting_cooldown--;
	
	//Visual effect
	bubbles++;
	if bubbles%120 = 0
	{
		effect = instance_create_depth(x,y,depth-15,obj_explosion)
		effect.sprite_index = spr_effect_bubbles;
	}
	
	//Die on land
	if !place_meeting(x,y,obj_water)
		life = 0;
		
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		scr_make_sound(snd_explosion,1,1,false);
		death = 1;
		
		for (var i = 0; i < 5; i++)
		{
			debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
			debris.sprite_index = spr_enemy_fish_debris;
			debris.image_index = i;
		}
	}
}