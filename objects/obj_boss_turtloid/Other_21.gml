/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(obj_player.x,y-200,"Projectiles",obj_bullet_default);
bullet.damage = bullet_damage_2;
bullet.direction = 270;
bullet.speed = 6;
//bullet.gravity = 0.1;

bullet.villainy = 2;
bullet.sprite_index = spr_bullet_meteor_rain;
bullet.explosion = spr_explosion_projectile;
bullet.phasing = true;

scr_make_sound(snd_shoot_meteorrain,1,1,false);

if raindrop < raindrop_amount
{
	raindrop++;
	alarm[2] = 15;
}
else
	raindrop = 1;