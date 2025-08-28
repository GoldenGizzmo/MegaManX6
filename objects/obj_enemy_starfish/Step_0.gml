/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		death = 1;
	}
}