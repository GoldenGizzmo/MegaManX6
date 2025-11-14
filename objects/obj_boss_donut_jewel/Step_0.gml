/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{	
	switch (jewel_position)
	{
		case 0:
			x_pos = -51;
			y_pos = -55;
			break;
		case 1:
			x_pos = -36;
			y_pos = 56;
			break;
		case 2:
			x_pos = 58;
			y_pos = 42;
			break;
		case 3:
			x_pos = 53;
			y_pos = -53;
			break;
	}
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		scr_make_sound(snd_explosion,1,1,false);
		instance_create_layer(x+x_pos,y+y_pos,"Explosions",obj_explosion);
		
		death = 1;
	}
}