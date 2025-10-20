/// @description Rubble

var zone_size = 175;
var safe_zone_size = 100;
var safe_zone = random_range(-zone_size,zone_size-safe_zone_size);

//Has a safe zone where no bombs can drop
var bullet_x = safe_zone+1;
while (bullet_x > safe_zone and bullet_x < safe_zone+safe_zone_size)
	bullet_x = random_range(-zone_size,zone_size);
	
for (var i = 0; i < 1; i++)
{
	bullet = instance_create_layer(obj_camera.x+random_range(-zone_size,zone_size),obj_camera.y-200-random_range(0,-20),"Projectiles",obj_bullet_default);
	bullet.direction = 90;
	bullet.speed = 2;
	bullet.gravity = 0.075; 
	bullet.image_xscale = choose(-1,1);
	
	bullet.damage = bullet_damage;
	bullet.villainy = 2;
	bullet.sprite_index = spr_bullet_rubble_1;
	bullet.breakable = true;
	
	bullet.explosion = spr_explosion_death;
	bullet.explosion_sound = snd_explosion;
}

for (var i = 0; i < 3; i++)
{
	particle = instance_create_layer(obj_camera.x+random_range(-zone_size,zone_size),obj_camera.y-180,"Projectiles",obj_particle_rubble);
	particle.direction = 90;
	particle.speed = random_range(2,3);
	particle.gravity = 0.075; 
	particle.image_xscale = choose(-1,1);
	
	particle.image_index = irandom(1);
	particle.sprite_index = spr_effect_rubble_1;
}