/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if place_meeting(x+hspeed,y,obj_solid) and !place_meeting(x,y+1,obj_solid)
{
	hspeed = -hspeed;
	image_xscale = -image_xscale;
}

switch (state)
{
	case 0:
		if place_meeting(x,y+1,obj_solid)
		{
			state = 1;
			speed = 0;
			gravity = 0;
	
			sprite_index = spr_bullet_pillar_beam;
			image_index = 0;
	
			scr_make_sound(snd_pillar,1,1,false);
			if hop < 3
				event_user(0);
			/*
			if obj_player.x > x
				hspeed = 0.2;
			else
				hspeed = -0.2;*/
		}
		break;
		
	case 1:
		if duration > 0
			duration--;
		else
		{
			state = 2;
		
			image_index = 3;
			image_speed = -1;
		}
		break;
		
	case 2:
		damage = 0;
		if image_index < 1
			alarm[9] = 1;
		break;
}