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
		
		if state = "Rolling" and rotate_speed != 0 and airborne = false
		{
			//Rumble sound
			if !audio_is_playing(snd_heatnix_rumble)
				scr_make_sound(snd_heatnix_rumble,1,1,true);
			
			if !instance_exists(obj_shake)
			{
				shake = instance_create_depth(0,0,0,obj_shake);
				shake.style = 1;
				shake.intensity = 0.5;
				shake.length = 10;
			}
			
			//Rocks when spinning
			if global.animate%3 = 0 
			{
				repeat(2)
				{
					particle = instance_create_layer(x+random_range(-30,30),y+55,"Projectiles",obj_particle_rubble)
					particle.speed = random_range(3,4);
					particle.gravity = 0.1; 
					if xspeed > 0
						particle.direction = 90+random_range(0,30)
					else
						particle.direction = 90-random_range(0,30);
					particle.image_xscale = choose(-1,1);
					particle.image_index = irandom(1);
				}
				
				//particle.sprite_index = choose(spr_bullet_rubble,spr_effect_rubble,spr_effect_rubble)
			}
		}
		else
			audio_stop_sound(snd_heatnix_rumble)
		
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
			afterimage.image_blend = make_colour_rgb(41,51,153);
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
				jewel_respawn_top = 60*8;
				jewel_respawn_bottom = 60*8;
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
	
	if surface_exists(surface)
		surface_free(surface);
	
	//Death scream
	if death = -2
	{
		death--;
		
		rotate = 0;
		audio_stop_sound(snd_turtloid_buzzsaw);
		scr_make_sound(snd_turtloid_death,1,1,false);
	}
}