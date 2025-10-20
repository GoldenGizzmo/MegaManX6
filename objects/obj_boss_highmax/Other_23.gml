/// @description Overcharge Blasts

bullet = instance_create_layer(x-(3*image_xscale),y-2,"Projectiles",obj_bullet_highmax)
bullet.direction = point_direction(x,y,obj_player.x,obj_player.y);
bullet.speed = 3;

bullet.damage = bullet_damage;
bullet.sprite_index = spr_bullet_highmax_small_yellow;
bullet.explosion = spr_explosion_projectile;

bullet.villainy = 2;

/*

var amount = 8;
var offset = choose(0,45); // point_direction(x,y,obj_player.x,obj_player.y);

for (var i = 0; i < amount; i++)
{
	bullet = instance_create_layer(x-(3*image_xscale),y-2,"Projectiles",obj_bullet_highmax)
	bullet.direction = ((360/amount)*i)+offset;
	bullet.speed = 3;

	bullet.damage = bullet_damage;
	bullet.sprite_index = spr_bullet_highmax_small_yellow;
	bullet.explosion = spr_explosion_projectile;

	bullet.villainy = 2;
}*/

scr_make_sound(snd_highmax_shoot,1,1,false);