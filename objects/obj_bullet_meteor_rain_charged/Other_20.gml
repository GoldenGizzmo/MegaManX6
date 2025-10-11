/// @description Insert description here
// You can write your code in this editor

var _damage = damage;

with obj_enemy_parent
{
	if place_meeting(x,y,obj_camera) and invul = false
	{
		bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_default);
		bullet.damage = _damage;
		bullet.image_alpha = 0;
		bullet.piercing_armour = true;
	}
}