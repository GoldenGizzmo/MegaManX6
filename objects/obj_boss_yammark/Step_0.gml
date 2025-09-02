/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Being openning appearance
if state = "Appearance" and action = 0
{
	action++;
	alarm[0] = 1;
}

if life > 0
{	
	if place_meeting(x,y,obj_camera) and !audio_is_playing(snd_yammark_wings) and wing_sound = true
		scr_make_sound(snd_yammark_wings,1,1,false);
		
	aim_direction = point_direction(x,y,obj_player.x,obj_player.y);
		
	//Very quickly moving towards a coordinate
	if zipping = true
	{
		movement_freeze = true;
		xspeed = 0;
		yspeed = 0;
		
		event_user(3); //Face player
		
		//Pose for which vertical direction they are moving
		if y > zip_y+1 
			sprite_index = spr_boss_yammark_move_upwards;
		else if y < zip_y-1
			sprite_index = spr_boss_yammark_move_downwards;
		else
			sprite_index = spr_boss_yammark_idle;
		
		//While moving with zipping
		if y > zip_y+1 or y < zip_y-1
		{	
			afterimage = instance_create_depth(x,y,depth+1,obj_afterimage)
			afterimage.sprite_index = sprite_index;
			afterimage.image_index = image_index;
			afterimage.blank = false;
			afterimage.image_alpha = image_alpha;
			
			//Flickering effect
			if global.animate%2 = 0
			{
				if flicker = false
					flicker = true;
				else
					flicker = false;
			}
			image_alpha = 0.7;
			if flicker = true
				image_alpha = 0.3;
		}
		else
			image_alpha = 1;
		
		x += (zip_x-x)*zip_speed;
		y += (zip_y-y)*zip_speed;
	}
	else
		movement_freeze = false;
	
	//Drones orbit faster or slower
	if orbit_change = "Faster"
	{
		with obj_boss_yanma_option
			if orbit_speed < 10
				orbit_speed += 0.2;
	}
	else if orbit_change = "Slower"
	{
		with obj_boss_yanma_option
			if orbit_speed > 3
				orbit_speed -= 0.2;
	}
}
else
{
	audio_stop_sound(snd_yammark_wings);
	sprite_index = spr_boss_yammark_death;
	image_alpha = 1;
	image_angle = 0;
	
	with obj_boss_yanma_option
		life = 0;
	
	//Death scream
	if death = -2
	{
		death--;
		scr_make_sound(snd_yammark_death,1,1,false);
	}
}