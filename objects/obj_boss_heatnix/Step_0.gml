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
	if yspeed = 0 and xspeed = 0 and state != "Flare"
		y += dsin((current_time)*0.5)*0.2;
		
	if rumbling = true
	{
		if sprite_index = spr_boss_heatnix_godbird
		{
			if indicator < 0.75
				indicator += 0.025;
		
		}
		
		if !audio_is_playing(snd_heatnix_rumble)
			scr_make_sound(snd_heatnix_rumble,1,1,false);
	}
	else
	{
		if indicator > 0
			indicator -= 0.025;
	
	}
	
	if sprite_index = spr_boss_heatnix_flap and animation_ended = true
	{
		animation_ended = false;
		image_index = 2;
	}
	
	if (sprite_index = spr_boss_heatnix_dive or sprite_index = spr_boss_heatnix_retreat) and global.animate%3 = 0
	{
		afterimage = instance_create_depth(x,y,depth+10,obj_afterimage);
		afterimage.sprite_index = sprite_index;
		afterimage.image_index = image_index;
		afterimage.image_angle = image_angle;
		afterimage.image_blend = make_colour_rgb(152,48,8);
		afterimage.image_xscale = image_xscale;
		afterimage.image_yscale = image_yscale;
	}
	
	//Wing flap sound
	if place_meeting(x,y,obj_camera)
	{
		switch (sprite_index)
		{
			case spr_boss_heatnix_idle:
				if image_index > 3 and wing_flapped = false
				{
					wing_flapped = true;
					scr_make_sound(snd_heatnix_flap,1,1,false);
				}
				else
					wing_flapped = false;
				break;
	
			case spr_boss_heatnix_appear:
				if image_index > 2 and wing_flapped = false
				{
					wing_flapped = true;
					scr_make_sound(snd_heatnix_flap,1,1,false);
				}
				else
					wing_flapped = false;
				break;
		}	
	}
}
else
{
	audio_stop_sound(snd_yammark_wings);
	sprite_index = spr_boss_heatnix_stunned;
	image_angle = 0;
	image_index = 0;
	image_speed = 0;
	
	//Death scream
	if death = -2
	{
		death--;
		scr_make_sound(snd_heatnix_grunt,1,1,false);
	}
}