/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	//Once killed by traditional means, it won't actually die and instead become invulnerable
	if state = "Reviving"
	{
		alarm[1] = -1;
		image_speed = 1;
		if revive_countdown > 0
		{
			sprite_index = spr_enemy_grasshopper_death_alt;
			if variable_instance_exists(id,"afterimage")
				afterimage.image_blend = make_color_rgb(123,57,0);
		}
	}
	else
	{
		event_user(0);
			
		if state = "Roaming"
		{
			//Animation match walking speed
			sprite_index = spr_enemy_grasshopper_idle_alt;
			if xspeed > 0
				image_speed = xspeed;
			else
				image_speed = -xspeed;
			
			//If not too far above or below
			var spot_distance = 120;
			if obj_player.y < y+50 and obj_player.y > y-50// and lunge_cooldown = 0
			{
				//If facing the player and within distance
				if (obj_player.x < x+spot_distance and obj_player.x > x and image_xscale = 1) or (obj_player.x > x-spot_distance and obj_player.x < x and image_xscale = -1) or isHit = true
				{
					state = "Attacking"
					alarm[0] = 30;
					alarm[1] = 180; //Give up
					
					event_user(3);
					scr_make_sound(snd_grasshopper_alert,1,1,false);
					
					xspeed = 0;
					image_speed = 0;
				}	
			}
		}
	}
}