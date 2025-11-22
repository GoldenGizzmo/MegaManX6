/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Spawned enemies from the ride chaser event will despawn after appearing on screen and leaving
if instance_exists(obj_ridechaser) and despawn = false and place_meeting(x,y,obj_camera) and boss = false
	despawn = true;

//Blade buster mark effect
if life > 0
{
	if blade_marked > 0
		blade_marked--;
}
else
	blade_marked = 0;