/// @description Insert description here
// You can write your code in this editor

//Projectiles
for (var i = 0; i < 2; i++)
{
	bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_pheonix);
	bullet.speed = 5;
	bullet.direction = 45+(90*i);
	bullet.image_angle = bullet.direction;

	bullet.target = obj_player;
	bullet.despawn = false;
	bullet.damage = bullet_damage;
	bullet.villainy = 2;
}



//Explosion
bullet = instance_create_layer(x,y,"Explosions",obj_bullet_default);
bullet.damage = bullet_damage_2;
bullet.expiry = 1;
bullet.villainy = 2;

bullet.explosive = true
bullet.explosion = spr_explosion_large_fire;

scr_make_sound(snd_heatnix_flare,1,1,false);
scr_make_sound(snd_heatnix_screech,1,1,false);

