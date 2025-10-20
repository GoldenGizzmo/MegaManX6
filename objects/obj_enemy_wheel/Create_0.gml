/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

life = 16;
lifemax = life;
damage = 0;

rotate = 0;
armour = true;

respawn = false;
despawn = false;

weight = 0;
colliding = false;

box = noone;

/*
box = instance_create_layer(x-32,y-32,"Collision",obj_solid);
box.image_xscale = 4;
box.image_yscale = 4;

weight = 0;
colliding = false;

