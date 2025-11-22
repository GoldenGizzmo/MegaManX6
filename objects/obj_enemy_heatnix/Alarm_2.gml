/// @description Insert description here
// You can write your code in this editor

action++;
alarm[0] = 1;
					
scr_make_sound(snd_bike_dash,1,1,false);
scr_make_sound(snd_heatnix_death,2,1,false);
					
obj_player.xspeed = 10;
actor.speed = obj_player.xspeed;