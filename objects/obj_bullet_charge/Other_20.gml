/// @description Split

for (var i = 0; i < 4; i++)
{
	bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_highmax)
	bullet.direction += (90*i);
	bullet.speed = 6;

	bullet.damage = round(damage/2);
	bullet.sprite_index = spr_bullet_highmax_split;
	bullet.explosion = spr_explosion_projectile;
	bullet.phasing = true;

	bullet.villainy = 2;
	bullet.behaviour = 2;
	bullet.split_delay = (20*i);
	
	if target.attack_type = 1
	{
		bullet.behaviour = 3;
		bullet.sprite_index = spr_bullet_highmax_split_yellow;
	}
}

scr_make_sound(snd_highmax_split,1,1,false);

