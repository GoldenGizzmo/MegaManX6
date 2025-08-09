/// @description Insert description here
// You can write your code in this editor

if other.villainy != 2 and life > 0 and other.damage > 0
{
	if invul = false and isHit = false and boss_iframes <= 0
	{
		if other.melee = true //Saber slash
		{
			global.pause_delay = 5;
			global.pause = true;
		
			var offset_x = random_range(-3,3);
			var offset_y = random_range(-3,3);
			effect = instance_create_layer(x+offset_x,y+offset_y,"Explosions",obj_explosion);
			effect.sprite_index = spr_effect_saber_hit;
			effect.image_angle = irandom(359);
		
			cut = instance_create_layer(x+offset_x,y+offset_y,"Explosions",obj_particle_cut);
			cut.image_angle = effect.image_angle+45;
		
			event_user(2);
			isHit = true;
			alarm[9] = other.melee_frames;
		}
		else if other.tick = false //Normal damage
		{
			event_user(2);
			isHit = true;
			alarm[9] = 5;
		} 
		else if other.tick = true and isHit = false //Piercing or DoT projectiles
		{
			event_user(2);
			isHit = true;
			alarm[9] = 9;
		}
	}

	//Remove other projectile
	if other.piercing = false
		other.alarm[9] = 1;
}












