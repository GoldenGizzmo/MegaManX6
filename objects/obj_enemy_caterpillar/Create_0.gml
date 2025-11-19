/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

life = 12;
lifemax = life;
damage = 4;

state = "Moving";
action = 0;
alarm[0] = 1;

animation_ended = false;

turn_delay = false;
weight = 0.15;

coll_list = ds_list_create();
axis = AXIS_HORIZONTAL