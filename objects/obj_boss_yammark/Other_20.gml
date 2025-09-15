/// @description Spawn Yanma Option

//Removes existing
instance_destroy(obj_boss_yanma_option,false);
var count = summon_count;
for (var a = 0; a < count; a++)
{
	spawn = instance_create_depth(x,y,depth-1,obj_boss_yanma_option);
	spawn.orbit_angle = 0+((360/count)*a);
	spawn.orbit = 0;
	spawn.orbit_speed = 3;
	spawn.orbit_grow = 35;
	spawn.target = self;
	spawn.order = a;
	
	//Changeable stats
	spawn.life = life_drone;
	spawn.lifemax = spawn.life;
	spawn.bullet_damage = bullet_damage;
	spawn.bullet_damage_2 = bullet_damage_2;
	
	//If spawned during the giga attack
	if state = "Giga"
		spawn.sprite_index = spr_yanma_option_giga;
}

scr_make_sound(snd_yammark_reinforcement,1.5,1,false);
instance_create_layer(x,y,"Explosions",obj_particle_reinforcement);