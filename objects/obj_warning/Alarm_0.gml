/// @description Insert description here
// You can write your code in this editor

if amount < 3
{
	scr_make_sound(snd_warning,1,pitch,false);
	pitch -= 0.2;
	
	amount++;
	alarm[0] = 90;
}
