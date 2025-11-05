/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < 3; i++)
{
	bullet = instance_create_layer(x,y-5,"Projectiles",obj_bullet_default);
	bullet.damage = damage;
	bullet.sprite_index = spr_bullet_magma_small;	
	bullet.explosion = spr_explosion_death;
	bullet.explosion_sound = snd_heatnix_magma;
	
	bullet.breakable = true;
	
	bullet.gravity = gravity;
	bullet.speed = 5;
	switch (i)
	{
		case 0: bullet.direction = 90+45; break;
		case 1: bullet.direction = 90-45; break;
		case 2: bullet.direction = random_range(90-30,90+30); break;
	}
	
	bullet.villainy = villainy;
}