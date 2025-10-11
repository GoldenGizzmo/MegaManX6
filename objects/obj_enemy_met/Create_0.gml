/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

life = 3;
lifemax = life;
damage = 1;
bullet_damage = 2;

state = "Moving";
action = 0;
weight = 0.1;

//Only walk around in the weapon get screen
if room != rm_weapon_get
	alarm[0] = 1;

aggro_range = 80;
event_user(3); //Face player

shielding = false;
guard_break = false;

