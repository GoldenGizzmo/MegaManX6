/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.pause_screen = true
	audio_stop_sound(snd_turtloid_buzzsaw);

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
	//Rotating moves
	if spinning = true
	{
		//Doesn't use actual image angle to not mess with hitboxes
		rotate += rotate_speed;
		
		//Rotation must be kept ridgid
		if rotate%180 = 0 and image_index = 0
			scr_make_sound(snd_turtloid_spin,1,1,false);
			
		//Buzzsaw noise
		if image_index > 0
		{
			if !audio_is_playing(snd_turtloid_buzzsaw)
				scr_make_sound(snd_turtloid_buzzsaw,0.5,1,true);
		}
		else
			audio_stop_sound(snd_turtloid_buzzsaw);
		
		//Speed up rotating while bouncing around
		if state = "Bounce"
		{
			if rotate_speed < 10
				rotate_speed += 0.5;
		}
		
		//Giga attack movement
		if zip_x != 0
		{
			x += (zip_x-x)*0.05;
			y += (zip_y-y)*0.05;
			
			var offset_range = 2;
			offset_x = random_range(-offset_range,offset_range);
			offset_y = random_range(-offset_range,offset_range);
			afterimage = instance_create_depth(x+offset_x,y+offset_y,depth+10,obj_afterimage);
			afterimage.sprite_index = sprite_index;
			afterimage.image_index = image_index;
			afterimage.image_angle = rotate;
			afterimage.image_blend = c_aqua;
		}
	}
	else
	{
		rotate = 0;
		audio_stop_sound(snd_turtloid_buzzsaw);
	}
	
	//Check if the jewel mechanic is activated
	if jewel_activated = true
	{
		//Check if jewels are alive, if not, disable armour
		var jewel_alive = 0
		with obj_boss_turtloid_jewel
			if invul = false
				jewel_alive++;
			
		if jewel_alive = 0
		{
			//Set a jewel respawn when both are destroyed
			if armour = true
			{
				jewel_respawn_top = 60*10;
				jewel_respawn_bottom = 60*10;
			}		
		
			armour = false;
		}
		else
			armour = true;
	
		//Respawning jewels
		if jewel_respawn_top > 0
		{
			jewel_respawn_top--;
			if jewel_respawn_top = 0
				instance_create_depth(x,y,depth-1,obj_boss_turtloid_jewel);
						
		}
		if jewel_respawn_bottom > 0
		{
			jewel_respawn_bottom--;
			if jewel_respawn_bottom = 0
			{
				jewel = instance_create_depth(x,y,depth-1,obj_boss_turtloid_jewel);
				jewel.jewel_top = false;
			}
		}
	}
}
else
{
	sprite_index = spr_boss_turtloid_death;
	image_alpha = 1;
	rotate = 0;
	
	//Death scream
	if death = -2
	{
		death--;
		
		rotate = 0;
		audio_stop_sound(snd_turtloid_buzzsaw);
		scr_make_sound(snd_turtloid_death,1,1,false);
	}
}