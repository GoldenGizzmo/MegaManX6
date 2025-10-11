/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	if state = "Moving"
	{
		xspeed = 0.25*image_xscale;
		/*
		//If shooting nearby
		if distance_to_object(obj_player) < aggro_range*1.5 and obj_player.shooting > 0
		{
			action = 0;
			alarm[0] = 1;
			
			state = "Hide";			
			xspeed = 0;
		}*/
		
		//Jumping off ledges
		event_user(0);
	}
	
	
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		scr_make_sound(snd_explosion,1,1,false);
		
		if guard_break = true
		{
			scr_make_sound(snd_spin_away,0.5,1,false);
			
			particle = instance_create_depth(x,y,depth-1,obj_particle_met);
			particle.gravity = 0.2;
			particle.speed = 9;
			particle.image_xscale = image_xscale;
			particle.direction = 90+(25*image_xscale);
		}
		else
		{
			for (var i = 0; i < 4; i++)
			{
				debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
				debris.sprite_index = spr_enemy_met_debris;
				debris.image_index = i;
			}
		}
		
		death = 1;
	}
}