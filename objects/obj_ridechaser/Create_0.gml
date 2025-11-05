/// @description Insert description here
// You can write your code in this editor

ridechaser_speed = 10;
ridechaser_moving = 0;
ridechaser_delay = 60;
ridechaser_break = false;

layer = layer_get_id("Tileset_Main");

action = 0;
alarm[0] = 1;



instance_create_depth(0,0,0,obj_ridechaser_foreground);