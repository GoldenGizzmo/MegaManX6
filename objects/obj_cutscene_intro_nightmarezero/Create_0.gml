/// @description Insert description here
// You can write your code in this editor

action = 0;
alarm[0] = 300;


//Set actors
d1000 = instance_create_layer(14866,1232,"Instances",obj_boss_d1000_corpse);
d1000.image_xscale = -1;
d1000.image_speed = 0;

with obj_player
{
	x = 14620;
	image_xscale = 1;
}

global.hud_toggle = false;