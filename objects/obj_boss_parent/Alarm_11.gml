/// @description Insert description here
// You can write your code in this editor

if exploding > 0
{
	if exploding_sound = 0
	{
		exploding_sound = 1;
		scr_make_sound(snd_explosion_boss,1,1,false);
	}
	else
	{
		exploding_sound = 0;
		scr_make_sound(snd_explosion_boss_2,1,1,false);
	}
	
	alarm[11] = random_range(5,25);
}