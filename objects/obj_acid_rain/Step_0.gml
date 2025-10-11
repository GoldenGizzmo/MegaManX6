/// @description Insert description here
// You can write your code in this editor

if global.pause_screen = true
	audio_stop_sound(snd_raining);

if global.pause = true
	return;

var tick_rate = -1; //Inactive
if rain_active = true
{
	//Rain fade in
	if rain_alpha < rain_alpha_max
		rain_alpha += 0.01;
	else
	{
		//Rain at full power
		tick_rate = global.animate%180;			
	}
}
else
{
	//Rain fade out
	if rain_alpha > 0
		rain_alpha -= 0.01;
}

//If touching acid rain water
with obj_water
{
	if place_meeting(x,y,obj_player)
	{
		if toxic = true
			tick_rate = global.animate%15;
		else
			tick_rate = global.animate%90;
	}
}

//Taking damage from acid
if tick_rate = 0 and global.life > 0 and obj_player.movement = true
{
	global.life--;
	acid_effect = 5;
	scr_make_sound(snd_acid,1,1,false);
}
//Visual effect
if acid_effect > 0
{
	acid_effect--;
	obj_player.image_blend = c_lime;
}





audio_sound_gain(snd_raining,rain_alpha*2,500);
audio_sound_pitch(snd_raining,1-(submerged/2));
if !audio_is_playing(snd_raining)
{
	scr_make_sound(snd_raining,1,1,true);
	audio_sound_gain(snd_raining,0,0);
}



