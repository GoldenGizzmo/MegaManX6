/// @description Insert description here
// You can write your code in this editor

if other.melee = true
	armour = false;

// Inherit the parent event
event_inherited();

//Roll away
if isHit = true
{
	if xspeed < 1 and xspeed > -1
		scr_make_sound(snd_fish_bite,1,1,false);
	
	if other.x < x
		xspeed = 2;
	else if other.x > x
		xspeed = -2;
		
	with box
		instance_destroy();
		
	weight = 0.2;
	colliding = true;
}

armour = true;