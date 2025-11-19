/// @description Insert description here
// You can write your code in this editor

event_inherited()

movement_freeze = false;
xspeed = 0;
yspeed = 0;

walled = false;
airborne = false;
colliding = true;
fall_speed = 6;

weight = 0.2;
collision_list = ds_list_create();

ignore_coll_size = 0;
ignore_coll = ds_list_create();