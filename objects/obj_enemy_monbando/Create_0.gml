/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

life = 32;
lifemax = life;
damage = 6;
bullet_damage = 4;

state = "Blocking";
action = 0;
alarm[0] = 120;

animation_ended = false;
event_user(3); //Face player

aggro_range = 100;

flickering = 0;
flicker = false;