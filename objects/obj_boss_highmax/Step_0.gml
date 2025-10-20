/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.pause = true
	return;

//Being openning appearance
if state = "Appearance" and action = 0
{
	action++;
	alarm[0] = 1;
}

if life > 0
{	
	//Float up and down
	if yspeed = 0 and xspeed = 0
		y += dsin((current_time)*0.5)*0.2;
	
	//Yellow afterimages
	if global.animate%3 = 0
	{
		afterimage = instance_create_depth(x,y,depth+10,obj_afterimage)
		afterimage.sprite_index = sprite_index;
		afterimage.image_index = image_index;
		afterimage.image_alpha = image_alpha;
		afterimage.image_xscale = image_xscale;
		afterimage.image_blend = make_color_rgb(255,242,0);
	}
}
else
{
	//sprite_index = spr_boss_yammark_death;
	image_speed = 0;
	
	//Death scream
	if death = -2
	{
		death--;
		scr_make_sound(snd_d1000_losepower,1,1,false);
	}
}