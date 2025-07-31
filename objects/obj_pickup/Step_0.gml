/// @description Insert description here
// You can write your code in this editor

switch (sprite_index)
{
	case spr_pickup_health_small:
		animation_falling = 1;
		animation_sitting = 4;
		pickup_type = 0; //Healing
		pickup_power = 5;
		break;
	case spr_pickup_health_mid:
		animation_falling = 3;
		animation_sitting = 7;
		pickup_type = 0; //Healing
		pickup_power = 15;
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
}

if !place_meeting(x,y,obj_spawnzone)
	instance_destroy();







