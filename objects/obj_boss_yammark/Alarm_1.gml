/// @description Choose Attack

if life > 0
{
	zipping = true;
	
	//Choose attack
	switch (state)
	{
		case "Rockets":	state = choose("Bullets","Bombs"); break;
		case "Bullets":	state = choose("Rockets","Bombs"); break;
		case "Bombs": state = choose("Bullets","Rockets"); break;

		default: state = choose("Bullets","Rockets","Bombs"); break;
	}
	alarm[0] = 60;
	
	//Summoning more drones
	if life <= lifemax/1.1 and summon_state = 0
	{
		state = "Reinforcement";
		summon_state++;
		alarm[0] = 30;
	}
	else if life <= lifemax/1.5 and summon_state = 1
	{
		state = "Reinforcement";
		summon_state++;
		alarm[0] = 30;
	}
	else if life <= lifemax/3 and summon_state = 2
	{
		state = "Reinforcement";
		summon_state++;
		alarm[0] = 30;
	}
	else
	{
		//Back up reinforcements so the fight isn't braindead
		if instance_number(obj_boss_yanma_option) < 2
		{
			var count = 2;
			instance_destroy(obj_boss_yanma_option,false);
			for (a = 0; a < count; a++)
			{
				spawn = instance_create_depth(x,y,depth-1,obj_boss_yanma_option);
				spawn.orbit_angle = 0+((360/count)*a);
				spawn.orbit = 0;
				spawn.orbit_speed = 3;
				spawn.orbit_grow = 35;
				
				//Changeable stats
				spawn.life = life_drone;
				spawn.lifemax = spawn.life;
				spawn.bullet_damage = bullet_damage;
				spawn.bullet_damage_2 = bullet_damage_2;
	
				spawn.target = self;
				spawn.order = a;
			}
			instance_create_layer(x,y,"Explosions",obj_particle_reinforcement);
		}
	}
}