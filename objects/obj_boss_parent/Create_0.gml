/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

boss = true;
invul = false;

state = 0;
action = 0;
death = -1;

boss_flicker = false;
boss_flicker_speed = 4;
boss_iframes = 0;

life = 99999;
lifemax = life;

despawn = false;
damage = 0;

exploding = 0;
exploding_sound = 0;

faction = 0; //Boss icon