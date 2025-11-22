/// @description Insert description here
// You can write your code in this editor

if instance_exists(obj_fire)
{
	if action > 2
		fire.x += 5;
	else if action > 0
		fire.x += 0.5;
}

if action = 7
	with obj_player
		obj_spawnzone.x = x+xspeed;