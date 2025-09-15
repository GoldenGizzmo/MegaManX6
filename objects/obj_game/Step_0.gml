/// @description Insert description here
// You can write your code in this editor

//Stop drawn animations
if global.pause = false
	global.animate++;
	
//Music
if global.music != "Off" //If turned on
{
	//Select track based on room
	if global.music = "Level"
	{
		switch (room)
		{
			case rm_yammark: global.music = snd_music_yammark; break;
			case rm_weapon_get: global.music = snd_music_weapon_get; break;
			default: global.music = "Off"; return;
		}
	}	
	
	//Play music
	if !audio_is_playing(global.music) //Loop when finished
		scr_make_sound(global.music,1,1,true);
}

if global.death = false and global.life <= 0
{
	global.death = true;
	alarm[0] = 15;
	
	scr_make_sound(snd_player_death,1,1,false);
	scr_player_voicelines("Death");
	
	//var in_pit = false;
	with obj_player
	{
		sprite_index = spr_player_x_hurt
		image_speed = 0;
		image_index = 0;
		
		//Halt all movement
		movement_freeze = true;
		
		//if place_meeting(x,y,obj_pit)
		//	in_pit = true;
	}
	/*
	//If fallen into a pit, skip the death animation
	if in_pit = true
	{
		alarm[0] = 60;
		death_animation = 3;
	}*/
}

if global.death = true
{
	if death_animation > 0 and death_animation < 3
	{
		particle = instance_create_layer(obj_player.x,obj_player.y,"Explosions",obj_particle_animated);
		particle.sprite_index = spr_effect_death;
		particle.speed = random_range(4,5);
		particle.direction = irandom(359);
		particle.image_index = irandom(particle.image_number-1);
		particle.depth += 1;
	}
	
	with obj_fade_out
		if alpha = 1
			room_restart();
}

#region Respawning Enemies
with obj_spawnzone
{
	//Threshold to stop premature despawning
	var despawn_threshold = global.view_width/4;
	var array = obj_manager.store_respawn;
	
	for (var a = 0; a < 500; a++) //Storing death locations for respawn
	{
		if array[a].store_object != -1
		{
			var x_collision = (array[a].store_x > x-(sprite_width/2)-despawn_threshold and array[a].store_x < x+(sprite_width/2)+despawn_threshold);
			var y_collision = (array[a].store_y > y-(sprite_height/2)+30 and array[a].store_y < y+(sprite_height/2)-30);
		
			//Find a free spot
			if x_collision and y_collision
			{	
				if array[a].respawn == 1 or array[a].respawn == 242
				{
					spawn = instance_create_depth(array[a].store_x,array[a].store_y,array[a].store_depth,array[a].store_object);
					spawn.image_xscale = array[a].store_xscale;
					spawn.image_yscale = array[a].store_yscale;
					spawn.image_angle = array[a].store_angle;
					spawn.enemy_type = array[a].store_type;
					
					array[a].store_x = 0;
					array[a].store_y = 0;
					array[a].store_depth = 0;
					array[a].store_object = -1;
					array[a].store_xscale = 0;
					array[a].store_yscale = 0;
					array[a].store_angle = 0;
					array[a].store_type = 0;
					array[a].respawn = 0;
					a = 500; //End
				}
			}
			else
				array[a].respawn = 1;
		}
	}
}
#endregion


global.lifemax = base_life+(global.hearttank*2);

//Nightmare Souls Counter
if souls_timer > 0 //Counter appears
{
	souls_timer--;
	souls_alpha -= 0.01;
	
	souls_y_target = 0;
}
else
{
	souls_collected = 0;
	souls_alpha = 1.5;
	
	souls_y_target = 125;
}
souls_y += (souls_y_target-souls_y)*0.1;

