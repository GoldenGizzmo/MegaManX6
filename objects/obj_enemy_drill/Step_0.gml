/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{	
	with drill
		x = owner.x;
	
	//Returning to the side facing pose
	if image_speed < 0 and image_index < 1
	{
		image_speed = 0;
		image_index = 0;
	}
	
	//If the drill is destroyed, run away
	if flee = false and !instance_exists(drill)
	{
		flee = true;
		
		//Cancel events
		alarm[0] = -1;
		xspeed = 0;
		image_speed = 0;
		
		alarm[1] = 60;
		animation_ended = false;
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
		
		for (var i = 0; i < 3; i++)
		{
			debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
			debris.sprite_index = spr_enemy_drill_debris;
			debris.image_index = i;
		}
	}
	
	with drill
		life = 0;
}