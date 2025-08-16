/// @description Insert description here
// You can write your code in this editor

//Can be paused
if global.pause = true
	return;

switch (sprite_index)
{
	case spr_pickup_health_small:
		animation_falling = 1;
		animation_sitting = 4;
		pickup_type = 0; //Healing
		pickup_power = 4;
		break;
	case spr_pickup_health_mid:
		animation_falling = 3;
		animation_sitting = 7;
		pickup_type = 0; //Healing
		pickup_power = 16;
		break;

	case spr_pickup_energy_small:
		pickup_type = 1; //Ammo
		pickup_power = 4;
		animation_falling = 4;
		animation_sitting = 5;
		break;
	case spr_pickup_energy_mid:
		pickup_type = 1; //Ammo
		pickup_power = 16;
		animation_falling = 4;
		animation_sitting = 5;
		break;
		
	case spr_pickup_hearttank:
		pickup_type = 2; //Heart Tank
		pickup_power = 1;
		animation_falling = 999;
		animation_sitting = 0;
		pickup_expiry = -1; //Doesn't expire
		break;
		
	case spr_pickup_subtank_1:
		pickup_type = 3; //Sub Tank #1
		pickup_power = 1;
		animation_falling = 999;
		animation_sitting = 0;
		pickup_expiry = -1; //Doesn't expire
		break;
	case spr_pickup_subtank_2:
		pickup_type = 4; //Sub Tank #2
		pickup_power = 1;
		animation_falling = 999;
		animation_sitting = 0;
		pickup_expiry = -1; //Doesn't expire
		break;
	case spr_pickup_weapontank:
		pickup_type = 5; //Weapon Tank
		pickup_power = 1;
		animation_falling = 999;
		animation_sitting = 0;
		pickup_expiry = -1; //Doesn't expire
		break;
	case spr_pickup_powertank:
		pickup_type = 6; //Power Tank
		pickup_power = 1;
		animation_falling = 999;
		animation_sitting = 0;
		pickup_expiry = -1; //Doesn't expire
		break;
		
	case spr_pickup_soul_small:
		pickup_type = 7; //Nightmare Soul
		pickup_power = 2;
		animation_falling = 999;
		animation_sitting = 0;
		if afterimage_colour = c_white //Lock to happen once
			vspeed = -1/8;
		afterimage_colour = make_color_rgb(140,8,26);
		break;
	case spr_pickup_soul_mid:
		pickup_type = 7; //Nightmare Soul
		pickup_power = 5;
		animation_falling = 999;
		animation_sitting = 0;
		if afterimage_colour = c_white //Lock to happen once
			vspeed = -1/8;
		afterimage_colour = make_color_rgb(8,8,140);
		break;
	case spr_pickup_soul_large:
		pickup_type = 7; //Nightmare Soul
		pickup_power = 200;
		animation_falling = 999;
		animation_sitting = 0;
		if afterimage_colour = c_white //Lock to happen once
			vspeed = -1/8;
		afterimage_colour = make_color_rgb(0,48,16);
		pickup_expiry = -1; //Doesn't expire
		if large_soul_state = 0
			large_soul_state = 1;
		break;
}

//Not a nightmare soul
if pickup_type != 7
{
	scr_collision(obj_solid);

	if weight > 0
	{
		if yspeed < 6 and airborne = true
			yspeed += weight
		else
			y = round(y); //Align to ground

		if place_meeting(x,y+1,obj_solid)
			y = round(y);
	}
	
	if image_index > animation_falling
		image_index = 0;

	if pickup_type = 1 and airborne = false and image_index < animation_sitting
		image_index = animation_sitting;
}
else
{
	//Afterimages
	if global.animate%3 = 0
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
		afterimage.image_blend = afterimage_colour;
		afterimage.sprite_index = sprite_index;
		afterimage.image_index = image_index;
		afterimage.image_xscale = image_xscale;
	}
	
	airborne = true;
	
	if large_soul_state < 2
	{
		//Float up and down
		if (y > ystart)
			vspeed -= 0.0025;
		else if (y < ystart)
			vspeed += 0.0025;
	}
	
	//Large soul
	if sprite_index = spr_pickup_soul_large
	{
		if large_soul_state = 1
		{
			if global.animate%5 = 0
			{
				line = instance_create_depth(x,y,9,obj_explosion_death_line);
				line.image_angle = irandom(359);	
				line.rotate = 1;
				line.shrink = 0.05;
			}
			direction = 90;
		}
		else
		{
			//Pursue the player at increasing speeds
			speed += 0.05;
			
			var a = point_direction(x,y,obj_player.x,obj_player.y);
			direction += sign(dsin(a-direction))*(speed);
		}
	}
}

if pickup_expiry > -1
{
	pickup_expiry--;
	
	if pickup_expiry < 120
	{
		if pickup_expiry%2 = 0
		{
			if image_alpha = 1
				image_alpha = 0;
			else
				image_alpha = 1;
		}
	}
	if pickup_expiry = 0
		instance_destroy();
	
	//Despawn
	//if !place_meeting(x,y,obj_spawnzone)
	//	instance_destroy();
}







