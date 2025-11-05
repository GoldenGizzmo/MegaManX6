/// @description Insert description here
// You can write your code in this editor

if explosive = true
{
	explosive = false
	image_index = 0;
	sprite_index = explosion;
	
	alarm[9] = 1;
}
else
{
	if explosion != 0
	{
		end_sprite = instance_create_layer(x,y,"Explosions",obj_explosion)
		end_sprite.sprite_index = explosion;
		end_sprite.image_xscale = image_xscale;
		end_sprite.image_angle = explosion_angle;
		end_sprite.image_alpha = image_alpha;
	
		if place_meeting(x,y,obj_spawnzone) and explosion_sound != 0
			scr_make_sound(explosion_sound,1,1,false);
	}

	instance_destroy();
}












