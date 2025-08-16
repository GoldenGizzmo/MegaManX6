/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case "Shooting": //Projectiles that return like a boomerang
		bullet = instance_create_layer(x+24*image_xscale,y,"Projectiles",obj_bullet_slash)
		bullet.direction = point_direction(x,y,obj_player.x,obj_player.y);
		bullet.speed = 4;
		bullet.damage = bullet_damage;

		bullet.villainy = 2;
		break;
		
	case "Spawning": //Little minions that float down and walk around
		spawn = instance_create_layer(x+14*image_xscale,y-13,"Projectiles",obj_enemy_larvae);
		spawn.damage = bullet_damage_2;
		spawn.image_xscale = image_xscale;
		spawn.owner = id;
		break;
}












