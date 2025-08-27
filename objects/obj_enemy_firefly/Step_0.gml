/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	//Float up and down
	y = ystart+dsin((current_time+hover_delay)*0.2)*2;
	
	shoot++;
	if shoot%10 = 0
		event_user(10);
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		scr_make_sound(snd_explosion,1,1,false);
		death = 1;
	}
}