/// @description Insert description here
// You can write your code in this editor

event_inherited();

life = 10;
lifemax = life;
damage = 4;
damage_store = damage;
bullet_damage = 4;

state = choose("Shooting","Follow");
action = 0;
alarm[0] = 60;

shoot = 0;
shoot_max = 4;

//Is a nightmare
nightmare = 1;

weight = 0;
colliding = false;

aggro_range = 120;

fade_in = 0;
if room = rm_intro
{
	image_alpha = 0;
	fade_in = 40;
	damage = 0;
	
	alarm[0] = -1;
	alarm[1] = 1;
}






