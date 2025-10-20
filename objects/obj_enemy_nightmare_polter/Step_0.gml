/// @description Insert description here
// You can write your code in this editor

if possess_target != noone
{
	respawn = false;
	despawn = false;
}

// Inherit the parent event
event_inherited();

if global.pause_screen = true
	audio_stop_sound(snd_polter_beam);

if global.pause = true
	return;

if life > 0
{
	respawn = false;
	despawn = false;
	
	event_user(3); //Face player
	
	//Afterimages
	if global.animate%10 = 0 or fade_away > 0
	{
		offset_x = 0;
		offset_y = 0;
		
		var offset_chance = irandom(3);
		var offset_range = 4;
		
		if fade_away > 0
		{
			offset_chance = 0;
			offset_range = fade_away;
		}
		if offset_chance = 0
		{
			offset_x = random_range(-offset_range,offset_range);
			offset_y = random_range(-offset_range,offset_range);
		}
		
		afterimage = instance_create_depth(x+offset_x,y+offset_y,depth+10,obj_afterimage);
		afterimage.image_blend = choose(c_blue,c_red);
		afterimage.sprite_index = sprite_index;
		afterimage.image_index = image_index;
		afterimage.image_xscale = image_xscale;
	}
	
	if fade_away > 0
	{
		if fade_in = true //Reversed action
		{
			fade_away -= 2;
			if image_alpha < 1
				image_alpha += 0.05;
		}
		else
		{
			if fade_away = 1
				scr_make_sound(snd_polter_teleport,1,1,false);
		
			fade_away += 2;
			if image_alpha > 0
				image_alpha -= 0.05;
			else
				instance_destroy();
		}
	}
	else
	{
		fade_in = false;
		
		if distance_to_object(obj_player) < 100 and !instance_exists(possess_target)
			fade_away = 1;
			
		//If possessing something	
		if instance_exists(possess_target)
		{
			//Check if on screen
			var on_screen = false
			with possess_target
				if place_meeting(x,y,obj_spawnzone)
					on_screen = true
			
			if on_screen = true
			{
				//Roll towards the player
				if possess_target.object_index = obj_enemy_wheel
				{
					if possess_target.xspeed < 0.5
					{
						with possess_target
							damage = 5;
						
						if xspeed > -2
							xspeed -= 0.1;
						possess_target.xspeed = xspeed;
					}
					else
						xspeed = possess_target.xspeed;
				}	
	
				//Tractor beam
				if global.animate%10 = 0
				{
					var offset = 4;
					if image_xscale = -1
						offset = -14;
					beam = instance_create_depth(x+offset,y,depth-1,obj_enemy_nightmare_polter_possess)
					beam.target = possess_target;
					beam.speed = 6;
				}
			
				//Sound effect
				if !audio_is_playing(snd_polter_beam)
				{
					if quiet = true
						scr_make_sound(snd_polter_beam,0.2,1,false);
					else
						scr_make_sound(snd_polter_beam,0.5,1,false);
				}
	
				//Give them the possessed look
				with possess_target
				{
					//Afterimages
					if global.animate%10 = 0
					{
						offset_x = 0;
						offset_y = 0;
		
						var offset_chance = irandom(3);
						var offset_range = 4;
						if offset_chance = 0
						{
							offset_x = random_range(-offset_range,offset_range);
							offset_y = random_range(-offset_range,offset_range);
						}
		
						afterimage = instance_create_depth(x+offset_x,y+offset_y,depth+10,obj_afterimage);
						afterimage.image_blend = choose(c_blue,c_red);
						afterimage.sprite_index = sprite_index;
						afterimage.image_index = image_index;
						afterimage.image_xscale = image_xscale;
					}
					/*
					if global.animate%5 = 0
					{
						if image_blend = c_white
							image_blend = choose(c_blue,c_red);
						else 
							image_blend = c_white
					}*/
				}
			}
			
			//Stay above the player
			if possess_target.object_index = obj_enemy_bigdrill
			{
				with possess_target
				{
					if life > 0
					{
						faster = true;
						respawn = false;
						despawn = false;
					}
				}
				
				//Faster beam to keep up
				with obj_enemy_nightmare_polter_possess
					speed = 9;
					
				//If within range and not falling down or rising
				if obj_player.x < possess_target.x-5 and !(possess_target.y > ystart)
				{
					move_direction = 1;
					if possess_target.xspeed > -6 //Max speed
						possess_target.xspeed -= 0.1;
				}
				else if obj_player.x > possess_target.x+5 and !(possess_target.y > ystart)
				{
					move_direction = -1;
					if possess_target.xspeed < 6 //Max speed
						possess_target.xspeed += 0.1;
				}
				else //Slow down
					possess_target.xspeed /= 4;
					
				//Have the nightmare stay away from the player
				x += ((possess_target.x+(100*move_direction))-x)*0.1;
			}
		}
		else
		{
			xspeed = 0;
			
		}
	}
			
	
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		scr_make_sound(snd_explosion,1,1,false);
		death = 1;
		
		//Nightmare zero intro soul steal
		for (var i = 0; i < 5; i++)
		{
			pickup = instance_create_layer(x,y,"Instances",obj_pickup);
			pickup.pickup_expiry = 60*5;
			pickup.large_soul_state = 10;
			pickup.direction  = irandom(359);
			pickup.speed = random_range(2,4);
	
			//Player doesn't need to collect them (fixes them being in walls)
			pickup.auto_pickup = "Appear";

			pickup.sprite_index = spr_pickup_soul_mid;
			pickup.soul_steal = obj_actor_nightmarezero
		}
	}
}