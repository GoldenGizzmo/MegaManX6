/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

life = 4;
lifemax = life;
damage = 4;

shoot = 0;
move_speed = 0.5;

state = "Roaming";
aggro_range = 70;

//Direction based on spawn
direction = 90-(90*image_xscale);
image_xscale = 1;

bubbles = irandom(60);

weight = 0;
colliding = false;