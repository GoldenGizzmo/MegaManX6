/// @description Insert description here
// You can write your code in this editor

effect = instance_create_layer(x,y,"Explosions",obj_explosion);
effect.sprite_index = spr_effect_bladeshot;

//if place_meeting(x,y,obj_camera)
scr_make_sound(snd_bladeshot_wave,1,1,false);

var emitter = self;
with obj_enemy_hostile
	if life > 0 and invul = false and distance_to_object(emitter) < emitter.marked_range
		blade_marked = emitter.marked_max;