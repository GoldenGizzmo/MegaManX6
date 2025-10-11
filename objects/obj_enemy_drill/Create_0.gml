/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

life = 4;
lifemax = life;
damage = 3;

action = 0;
alarm[0] = 1;

weight = 0;
colliding = true;

aggro_range = 120;

image_speed = 0;
image_index = 0;

drill = instance_create_depth(x,y+30,depth+1,obj_enemy_drill_end);
drill.owner = id;

flee = false;