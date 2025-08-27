/// @description Insert description here
// You can write your code in this editor

if rescued = false
{
	rescued = true;
	alarm[0] = 60;
	
	ds_list_add(global.rescue_list,key); //Store
	
	scr_make_sound(snd_rescue,1,1,false);
}