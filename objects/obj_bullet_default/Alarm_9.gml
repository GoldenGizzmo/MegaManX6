/// @description Insert description here
// You can write your code in this editor

if explosion != 0
{
	end_sprite = instance_create_layer(x,y,"Explosions",obj_explosion)
	end_sprite.sprite_index = explosion;
	end_sprite.image_xscale = image_xscale;
	
	if place_meeting(x,y,obj_spawnzone) and explosion_sound != 0
		scr_make_sound(explosion_sound,1,1,false);
}

instance_destroy();












