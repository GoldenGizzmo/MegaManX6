/// @description Insert description here
// You can write your code in this editor

if villainy != other.villainy and breakable = true and piercing = false
{
	alarm[9] = 1;
	
	//Other projectile is destroyed
	with other
		if piercing = false
			alarm[9] = 1;
}

//Armoured projectiles stop all other projectiles
if other.piercing_armour = false and armour = true
{
	with other
		alarm[9] = 1;
	
	scr_point_between(x,y,other.x,other.y,other);
	effect = instance_create_layer(between_x,between_y,"Explosions",obj_explosion);
	effect.sprite_index = spr_explosion_armour;
	if x > other.x
		effect.image_xscale = 1;
	else
		effect.image_xscale = -1;
				
	scr_make_sound(snd_armour,1,1,false);
	other.explosion = 0;
}