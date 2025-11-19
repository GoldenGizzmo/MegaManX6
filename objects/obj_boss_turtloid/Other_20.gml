/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < 2; i++)
{
	var offset_y = -25;
	if i = 0
		offset_y = 20;
	bullet = instance_create_layer(x-25*image_xscale,y+offset_y,"Projectiles",obj_bullet_turtloid_rocket);
	bullet.damage = bullet_damage;
	bullet.direction = 90+(90*image_xscale)+random_range(-40,40);
	if image_xscale = 1
		bullet.image_angle = 180;
	bullet.speed = 2;

	bullet.villainy = 2;
	bullet.target = obj_player
	bullet.explosion_sound = snd_explosion;
}

scr_make_sound(snd_turtloid_rocket,1,1,false);