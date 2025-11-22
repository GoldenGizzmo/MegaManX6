/// @description Insert description here
// You can write your code in this editor

//Restart
image_alpha = 1;
image_index = 0;
sprite_index = spr_fireburst;

//Make sounds when on screen
if place_meeting(x,y,obj_spawnzone)
	scr_make_sound(snd_fire,1,1,false);