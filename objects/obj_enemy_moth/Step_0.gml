/// @description Insert description here
// You can write your code in this editor

path_speed = 0.8;
if global.pause = true
	path_speed = 0;

// Inherit the parent event
event_inherited();

if life > 0
{
	
}
else
{
	path_end(); //Stop path movement
	
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		scr_make_sound(snd_explosion,1,1,false);
		death = 1;
	}
}