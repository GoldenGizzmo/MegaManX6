/// @description Insert description here
// You can write your code in this editor

//Can be paused
if global.pause = true
	return;

if camera_check = false
{
	camera_check = true;
	
	//Cam check
	spawn_area = instance_place(x,y,obj_camera_freemove);
	if spawn_area = noone
		spawn_area = instance_place(x,y,obj_camera_bossroom);
}

//Check that the spawn area exists
if instance_exists(spawn_area)
{
	//Threshold to stop premature despawning
	var despawn_threshold = (global.view_width/2)+30;
	
	//Issue: Enemies aren't touching the spawnzone for a brief second on spawn
	//Solution: Delay so enemies only 
	
	var enemy_spawning = false;
	if instance_exists(spawn_area)
		if spawn_area.enemy_checks = true
			enemy_spawning = true;
	
	//Check if the player is touching it, enabling it
	if enemy_spawning = true
	{
		//If despawning is enabled, and not meeting the spawning area
		if despawn = true and !place_meeting(x+despawn_threshold,y,obj_spawnzone) and !place_meeting(x-despawn_threshold,y,obj_spawnzone) and !place_meeting(x,y+despawn_threshold,obj_spawnzone) and !place_meeting(x,y-despawn_threshold,obj_spawnzone)
		{
			//If alive, kill
			if life > 0
				life = 0;
			else
				spawn = 1;

			death = 2; //Prevent death event
			if respawn = false //Destroys non respawning enemies if they go offscreen
				instance_destroy();
		}
		//If allowed to respawn
		if respawn = true
		{
			//If touching the spawn area and already despawned
			if place_meeting(x,y,obj_spawnzone) and spawn = 1
				event_perform(ev_create,0); //Respawn
		}
	}
	else
	{
		//Despawn if not in a highlighted spawn area
		if despawn = true
		{
			var check = false;
			if life > 0
				if !(!place_meeting(x+despawn_threshold,y,obj_spawnzone) and !place_meeting(x-despawn_threshold,y,obj_spawnzone) and !place_meeting(x,y+despawn_threshold,obj_spawnzone) and !place_meeting(x,y-despawn_threshold,obj_spawnzone))
					check = true
			
			//If alive and touching the spawn area still
			if check = false
			{
				//If alive, kill
				if life > 0
					life = 0;
				else
					spawn = 1;

				death = 2; //Prevent death event
				if respawn = false //Destroys non respawning enemies if they go offscreen
					instance_destroy();
			}
		}
	}
}
else
{
	//If doesn't exist, kill or despawn or whatever idk
	if despawn = true
	{
		//If alive, kill
		if life > 0
			life = 0;
		else
			spawn = 1;

		death = 2; //Prevent death event
		if respawn = false //Destroys non respawning enemies if they go offscreen
			instance_destroy();
	}
}

if life > 0
{
	if weight > 0
	{
		if yspeed < 6 and airborne = true
			yspeed += weight
		else
			y = round(y); //Align to ground

		if place_meeting(x,y+1,obj_solid)
			y = round(y);
	}
}
else
{	
	if death = 0 and explode = 0 
	{	
		var drop_chance = irandom(1); 
		if drop_chance = 0
		{
			pickup = instance_create_layer(x,y,"Instances",obj_pickup);
			pickup.sprite_index = choose(spr_pickup_health_small,spr_pickup_health_mid,spr_pickup_energy_small,spr_pickup_energy_mid)
			pickup.pickup_expiry = 60*5;
		}
		
		
		if respawn = true
		{
			for (a = 0; a < 500; a++) //Storing death locations for respawn
			{
				//Find a free spot
				if obj_manager.store_respawn[a].store_object = -1
				{
					obj_manager.store_respawn[a].store_x = xstart;
					obj_manager.store_respawn[a].store_y = ystart;
					obj_manager.store_respawn[a].store_depth = depth;
					obj_manager.store_respawn[a].store_object = object_index;
					obj_manager.store_respawn[a].store_xscale = image_xscale;
					obj_manager.store_respawn[a].store_yscale = image_yscale;
					obj_manager.store_respawn[a].store_angle = image_angle;
					obj_manager.store_respawn[a].store_type = enemy_type;
					obj_manager.store_respawn[a].respawn = 0;
					break;
				}
			}
		}		
	}
	
	if death = 1
		instance_destroy();
}









