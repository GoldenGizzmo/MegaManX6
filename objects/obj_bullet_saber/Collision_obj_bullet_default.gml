/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if villainy != other.villainy and other.breakable = true and other.armour = false
{
	global.pause_delay = 5;
	global.pause = true;
		
	effect = instance_create_layer(other.x,other.y,"Explosions",obj_explosion);
	effect.sprite_index = spr_effect_saber_hit;
	effect.image_angle = irandom(359);
				
	scr_make_sound(snd_player_x_saber_hit,1,1,false);
		
	if melee_slash = true
	{
		cut = instance_create_layer(other.x,other.y,"Explosions",obj_particle_cut);
		cut.image_angle = effect.image_angle+45;
	}
	
	//Make bombs harmless
	if other.explosive = true
		other.damage = 0;
}