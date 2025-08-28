/// @description Insert description here
// You can write your code in this editor

/*
if speed > -store_speed and return_direction = 1
	speed -= 0.05;
else if speed < -store_speed and return_direction = -1	
	speed += 0.05;*/
	
if speed > -store_speed
	speed -= 0.05;
	
alarm[0] = 1;

/*
if state = 0 //Stop in mid-air
{
	state++;
	alarm[0] = 120;
	
	store_speed = speed;
	if speed < 0
		store_speed *= -1;
	speed = 0;
}
else if state = 1 //Move towards the player
{
	direction = point_direction(x,y,obj_player.x,obj_player.y);
	speed = store_speed;
}