/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.pause = true
	return;


//Being openning appearance
if state = "Appearance" and action = 0
{
	action++;
	alarm[0] = 1;
}

if life > 0
{	
	//Rotating gets fixed
	rotate += rotate_speed;
	
	//Check if the jewel mechanic is activated
	if jewel_activated = true
	{
		//Check if jewels are alive, if not, DIE
		var get_life = 0;
		with obj_boss_donut_jewel
			get_life += life;
			
		life = get_life;

	}
	
	//Afterimages
	if global.animate%10 = 0 and image_alpha >= 1
	{
		offset_x = 0;
		offset_y = 0;
		
		var offset_chance = irandom(3);
		var offset_range = 4;
		if offset_chance = 0
		{
			offset_x = random_range(-offset_range,offset_range);
			offset_y = random_range(-offset_range,offset_range);
		}
		
		afterimage = instance_create_depth(x+offset_x,y+offset_y,depth+10,obj_afterimage);
		afterimage.image_blend = choose(c_green,c_red);
		afterimage.sprite_index = sprite_index;
		afterimage.image_index = image_index;
		afterimage.image_xscale = 1;
		afterimage.image_angle = rotate;
	}
	
	//Moving around the arena
	if state = "Moving"
	{
		//Actived flamethrower attack
		if flamethrower > 0
		{
			flamethrower--;
			
			//Sound for it
			if !audio_is_playing(snd_fire_2)
				scr_make_sound(snd_fire_2,1,1,false);
			
			//Stop the shooting phase, add a buffer after finishing attack
			shoot = -30;
			with obj_boss_donut_jewel {image_speed = 1;}
			
			//Flamethrowers become large and threatening
			if flamethrower < flamethrower_length-120
			{
				with obj_boss_donut_fire 
				{
					if state = 0
					{
						scr_make_sound(snd_heatnix_flare,1,1,false);
						state = 1;
					}
				}
				
			}
		}
		else
		{
			//Destroy them
			with obj_boss_donut_fire {state = 2;}
			
			//Shoot projectiles
			if shoot < shoot_delay*instance_number(obj_boss_donut_jewel)
			{
				shoot++;
			
				//Blink faster when close to shooting
				if shoot > (shoot_delay*instance_number(obj_boss_donut_jewel))-30
					with obj_boss_donut_jewel {image_speed = 3;}
				else
					with obj_boss_donut_jewel {image_speed = 1;}
			}
			else
			{
				shoot = 0;
				with obj_boss_donut_jewel //Fire projectiles
					event_user(10);
			}
		}
	}
}
else
{
	with obj_boss_donut_fire
		instance_destroy();

	//Remove energy
	if variable_instance_exists(id,"energy")
		if instance_exists(energy)
			instance_destroy();
}

if state = "Appearance"
{
	var range = 250;
	if action > 0 and image_index < 5 and sprite_index = spr_boss_donut_spawn and global.animate%2 = 0
	{
		var side = choose(true,false);
		if side = true
			instance_create_depth(x+choose(-range,range),y+random_range(-range,range),depth+1,obj_boss_donut_spawn);
		else
			instance_create_depth(x+random_range(-range,range),y+choose(-range,range),depth+1,obj_boss_donut_spawn);
				
	
		if !audio_is_playing(snd_heatnix_rumble)
			scr_make_sound(snd_heatnix_rumble,1,1.5,true);
	}
}