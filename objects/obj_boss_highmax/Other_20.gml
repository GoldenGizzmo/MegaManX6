/// @description Hand Blasts

var amount = 1;
if attack_split = 1
{
	if second_hand = true
		amount = 5;	
	else
		amount = 4;
}

for (var i = 0; i < amount; i++)
{
	var offset_x = 54;
	var offset_y = -9;
	if second_hand = true
	{
		offset_x = 47;
		offset_y = -11;
	}

	bullet = instance_create_layer(x+(offset_x*image_xscale),y+offset_y,"Projectiles",obj_bullet_default)
	bullet.direction = point_direction(bullet.x,bullet.y,obj_player.x,obj_player.y);
	bullet.speed = 5;

	bullet.damage = bullet_damage;
	bullet.sprite_index = spr_bullet_highmax_small;
	bullet.explosion = spr_explosion_projectile;

	bullet.villainy = 2;

	if attack_type = 1
	{
		bullet.speed = 2;
		bullet.sprite_index = spr_bullet_highmax_small_yellow;
	}
	if attack_split = 1
	{
		bullet.speed = 3;
		if attack_type = 1
			bullet.speed = 1.5;
		
		if second_hand = true //4 blasts
			bullet.direction = point_direction(bullet.x,bullet.y,obj_player.x,obj_player.y)-60+(30*i);
		else //5 blasts
			bullet.direction = point_direction(bullet.x,bullet.y,obj_player.x,obj_player.y)-45+(30*i);
	}
}

scr_make_sound(snd_highmax_shoot,1,1,false);