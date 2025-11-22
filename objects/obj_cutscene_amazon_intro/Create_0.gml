/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

actor = instance_create_layer(224,414,"Instances",obj_actor)
actor.sprite_index = spr_actor_yammark;
actor.image_angle = -30;

var count = 3;
for (var a = 0; a < count; a++)
{
	spawn = instance_create_depth(actor.x,actor.y,actor.depth-1,obj_boss_yanma_option);
	spawn.orbit = 0;
	spawn.orbit_grow = 0;
	spawn.target = actor;
	spawn.order = a;
	spawn.follow = true;
}

obj_player.armour_down = true;