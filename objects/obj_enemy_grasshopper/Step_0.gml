/// @description Insert description here
// You can write your code in this editor

if global.pause = true
	return;

// Inherit the parent event
event_inherited();

if life > 0
{
	//Once killed by traditional means, it won't actually die and instead become invulnerable
	if state = "Reviving"
	{
		//Revive
		if revive_countdown = 0
		{
			//Set stats
			life = lifemax;
			damage = damage_store;
			movement_freeze = false;
			depth -= 10;
			event_user(3);
			
			//Turn off effects
			flickering = 0;
			flicker = false;
			
			scr_make_sound(snd_yammark_reinforcement,1,1,false);
			instance_create_layer(x,y,"Explosions",obj_particle_reinforcement);
			//revive_effect.palette = 1;
			//if object_index = obj_enemy_grasshopper_alt
			//	revive_effect.palette = 2;
			
			//Restart AI
			event_user(11);
		}
		else
		{
			revive_countdown--; 
			sprite_index = spr_enemy_grasshopper_death;
			
			//Start flickering when ready to revive
			if revive_countdown < 60
			{
				flickering++;
				if flickering%2 = 0
				{
					if flicker = false
						flicker = true;
					else
						flicker = false;
				}
			}
			
			//Afterimages
			if global.animate%3 = 0
			{
				var offset_range = revive_countdown/8;
				offset_x = random_range(-offset_range,offset_range);
				offset_y = random_range(-offset_range,offset_range);
		
				afterimage = instance_create_depth(x+offset_x,y+offset_y,depth+10,obj_afterimage);
				afterimage.sprite_index = sprite_index;
				afterimage.image_xscale = image_xscale;
				afterimage.image_blend = make_color_rgb(15,124,38);
			}
		}
	}
}
else
{
	speed = 0;
	if death = 0 and global.pause = false //Lock for alarm
	{
		//death = 1;
		//Death event
		repeat(3)
		{
			var range = 30;
			var x_range = random_range(-range,range);
			var y_range = random_range(-range,range);
			instance_create_layer(x+x_range,y+y_range,"Explosions",obj_explosion);
		}
		for (i = 0; i < 4; i++)
		{
			debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
			debris.sprite_index = spr_enemy_grasshopper_debris;
			debris.image_index = i;
			if object_index = obj_enemy_grasshopper_alt
				debris.palette = 1;
		}
		
		scr_make_sound(snd_explosion,1,1,false);

		//Don't actually die and instead stay at 1 Hp
		life = 1;
		damage_store = damage;
		damage = 0;
		depth += 10;
	
		action = 0;
		alarm[0] = -1;
	
		state = "Reviving";
		revive_countdown = 60*4;
	}
}