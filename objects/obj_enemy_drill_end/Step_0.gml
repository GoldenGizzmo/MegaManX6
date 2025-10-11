/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	if global.animate%2 = 0 and hit_ground = true
	{
		if jitter = false
		{
			y--;
			jitter = true;
		}
		else
		{
			y++;
			jitter = false;
		}
	}
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		scr_make_sound(snd_explosion,1,1,false);
		death = 1;
		
		for (var i = 0; i < 3; i++)
			instance_create_layer(x+random_range(-16,16),y+(16*i)-30,"Explosions",obj_explosion);
	}
}