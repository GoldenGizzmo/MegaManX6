/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_snake)
bullet.speed = 4;
bullet.damage = bullet_damage;
bullet.sprite_index = spr_bullet_nightmare;

bullet.villainy = 2;
bullet.despawn = false;

var vertical = choose(false,true)
if vertical = true
{
	bullet.moving_vertical = false;
	bullet.direction = choose(90,270);
}
else
{
	bullet.moving_vertical = true
	bullet.direction = choose(0,180);
}

scr_make_sound(snd_shoot_nightmare,1,1,false);


