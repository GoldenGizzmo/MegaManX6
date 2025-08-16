/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	scr_collision();
	//Float up and down
	if (y > ystart)
		yspeed -= 0.0025;
	else if (y < ystart)
		yspeed += 0.0025;
	
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
		death = 1;
	}
}