/// @description Insert description here
// You can write your code in this editor

//Homing towards the player with a wide arch
var a = point_direction(x,y,target.x,target.y);
direction += sign(dsin(a-direction))*(speed);
alarm[0] = 10;