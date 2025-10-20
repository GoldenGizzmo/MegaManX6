/// @description Death Ball

bullet = instance_create_layer(x-(3*image_xscale),y-2,"Projectiles",obj_bullet_highmax)
bullet.direction = 270;
bullet.speed = choose(3,4,5);
bullet.image_xscale = image_xscale;

bullet.damage = bullet_damage_2;
bullet.sprite_index = spr_boss_highmax_charge;
bullet.sound = snd_highmax_charge;

bullet.phasing = true;
bullet.piercing = true;

bullet.villainy = 2;

bullet.behaviour = 1; //Go along the ground

scr_make_sound(snd_highmax_deathball,1,1,false);

if state = "Overcharge"
{
	bullet.direction = point_direction(x,y,obj_player.x,obj_player.y);
	bullet.behaviour = 0;	
	bullet.speed = 5;
	
	//Fully formed
	bullet.sprite_index = spr_bullet_highmax_large;
	if attack_type = 1
		bullet.sprite_index = spr_bullet_highmax_large_yellow;
}
else
{
	//Yellow version
	if attack_type = 1
	{
		bullet.sprite_index = spr_boss_highmax_charge_yellow;
		bullet.behaviour = 4; //Go along the ground
	
		bullet.direction = 90-(90*image_xscale);
	}

	//Split apart randomly
	if attack_split = 1
		bullet.rupture = 60;
}