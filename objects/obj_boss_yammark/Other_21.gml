/// @description Drop Bombs

var zone_size = 175;
var safe_zone_size = 100;
var safe_zone = random_range(-zone_size,zone_size-safe_zone_size);

//Number of bombs based on the amount of drones
var count = instance_number(obj_boss_yanma_option);
for (var a = 0; a < count; a++)
{
	//Has a safe zone where no bombs can drop
	var bullet_x = safe_zone+1;
	while (bullet_x > safe_zone and bullet_x < safe_zone+safe_zone_size)
		bullet_x = random_range(-zone_size,zone_size);
	
	bullet = instance_create_layer(obj_camera.x+bullet_x,y-random_range(0,-20),"Projectiles",obj_bullet_default);
	bullet.image_angle = 270;
	bullet.direction = 90;
	bullet.speed = 2;
	bullet.gravity = 0.1; 
	
	bullet.damage = bullet_damage_2;
	bullet.villainy = 2;
	bullet.sprite_index = spr_bullet_bomb;
	bullet.breakable = true;
	
	bullet.explosive = true;
	bullet.explosion = spr_explosion_yanma;
	bullet.explosion_sound = snd_explosion_large;
	
	//if a = 0
	//	bullet.x = obj_player.x;
	
	scr_make_sound(snd_yammark_shoot,1,1,false);
	
	effect = instance_create_layer(obj_camera.x+bullet_x,y-random_range(0,-20),"Explosions",obj_explosion);
	effect.sprite_index = spr_effect_smoke;
}