/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Create position to travel to
if target_x = 0
{
	target_x = target.x+random_range(-target_offset,target_offset);
	target_y = target.y+random_range(-target_offset,target_offset);
}

//Create lingering smoke
if trail != 0 and global.animate%5 = 0
{
	effect = instance_create_layer(x,y,"Explosions",obj_explosion);
	effect.sprite_index = trail;
}

image_angle = direction;

if distance_to_point(target_x,target_y) < speed
	alarm[9] = 1;