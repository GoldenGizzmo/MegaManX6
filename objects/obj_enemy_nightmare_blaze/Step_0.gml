/// @description Insert description here
// You can write your code in this editor

//Can be paused
if global.pause = true
	return;

// Inherit the parent event
event_inherited();

if life > 0
{
	//Once killed by traditional means, it won't actually die and instead become invulnerable
	if state = "Reviving"
	{
		//If pickup is collect, die
		if !instance_exists(pickup)
		{
			death = 1;
			life = 0;
			
			return;
		}
		
		
		//For ride bikes
		x = pickup.x;
		y = pickup.y;
		
		//Revive
		if revive_countdown = 0
		{
			//Set stats
			life = lifemax;
			damage = damage_store;
			movement_freeze = false;
			
			event_user(3);
			scr_make_sound(snd_nightmare_transform,1,1,false);
			
			//Reset animation variables
			image_alpha = 1;
			image_speed = 1;
			image_index = 0;
			sprite_index = spr_enemy_nightmare_blaze_revive;
			animation_ended = false;
			
			//Make explosion
			event_user(11);
			
			//Destroy pickup early
			with (pickup)
				instance_destroy();

			//Restart AI
			alarm[0] = 1;
			state = "Appear";
		}
		else
		{
			revive_countdown--; 
			image_alpha = 0;
			
			//Pickup flickers purple
			with pickup
			{
				if pickup_expiry < 180
				{
					image_alpha = 1;
					if pickup_expiry%4 = 0
					{
						if sprite_index = spr_pickup_soul_mid
							sprite_index = spr_pickup_soul_glow;
						else
							sprite_index = spr_pickup_soul_mid
					}
					
					//Afterimages
					afterimage_colour = c_purple;
				}
			}
		}	
	}
	else
	{
		//Afterimages
		if global.animate%10 = 0 and image_alpha > 0
		{
			offset_x = 0;
			offset_y = 0;
			var offset_chance = irandom(3)
			if offset_chance = 0
			{
				var offset_range = 4;
				offset_x = random_range(-offset_range,offset_range);
				offset_y = random_range(-offset_range,offset_range);
			}
		
			afterimage = instance_create_depth(x+offset_x,y+offset_y,depth+10,obj_afterimage);
			afterimage.image_blend = choose(c_purple,c_red);
			afterimage.sprite_index = sprite_index;
			afterimage.image_index = image_index;
			afterimage.image_xscale = image_xscale;
		}
	}
}
else
{
	speed = 0;
	if death = 0 and global.pause = false //Lock for alarm
	{
		//death = 1;
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		scr_make_sound(snd_explosion,1,1,false);

		//Don't actually die and instead stay at 1 Hp
		life = 1;
		damage_store = damage;
		damage = 0;
	
		shoot = 0;
		action = 0;
		alarm[0] = -1;
	
		state = "Reviving";
		revive_countdown = 60*4;
	}
}