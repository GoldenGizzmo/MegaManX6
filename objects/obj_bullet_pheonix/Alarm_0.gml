/// @description Insert description here
// You can write your code in this editor

if instance_exists(target)
{
	//Homing towards the player with a wide arch
	var a = point_direction(x,y,target.x,target.y);
	direction += sign(dsin(a-direction))*(speed);
	alarm[0] = 2;
}