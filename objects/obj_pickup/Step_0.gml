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
}

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

if airborne = true
	if image_index > animation_falling
		image_index = 0;

if pickup_type = 1 and airborne = false and image_index < animation_sitting
	image_index = animation_sitting;
	

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







