/// @description Insert description here
// You can write your code in this editor

if sprite_index = spr_fireburst
{
	if shoot < shoot_amount
	{
		shoot++;
		//Make sounds when on screen
		if place_meeting(x,y,obj_spawnzone)
			scr_make_sound(snd_fire,1,1,false);
	}
	else
	{
		image_speed = 0;
		image_index = -1;
	
		shoot = 0;
		alarm[1] = 30;
	}
}
