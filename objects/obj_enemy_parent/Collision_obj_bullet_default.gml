/// @description Insert description here
// You can write your code in this editor

if other.villainy != 2 and life > 0 and other.damage > 0
{
	if invul = false and isHit = false and boss_iframes <= 0
	{
		if armour = false or other.piercing_armour = true
		{
			if other.melee = true //Saber slash
			{
				global.pause_delay = 5;
				global.pause = true;
		
				var offset_x = random_range(-3,3);
				var offset_y = random_range(-3,3);
				scr_point_between(x,y,other.x,other.y,other);
				effect = instance_create_layer(between_x+offset_x,between_y+offset_y,"Explosions",obj_explosion);
				effect.sprite_index = spr_effect_saber_hit;
				effect.image_angle = irandom(359);
				
				scr_make_sound(snd_player_x_saber_hit,1,1,false);
		
				if other.melee_slash = true
				{
					cut = instance_create_layer(x+offset_x,y+offset_y,"Explosions",obj_particle_cut);
					cut.image_angle = effect.image_angle+45;
				}
		
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
		else
		{
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
	}

	//Remove other projectile
	if other.piercing = false
		other.alarm[9] = 1;
}












