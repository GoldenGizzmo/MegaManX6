/// @description Insert description here
// You can write your code in this editor

event_inherited();

if global.pause = true
{
	audio_stop_sound(snd_raining);
	return;
}

var tick_rate = -1; //Inactive
if rain_active = true
{
	//Rain fade in
	if rain_alpha < rain_alpha_max
		rain_alpha += 0.01;
	else
	{
		//Rain at full power
		tick_rate = global.animate%60;			
	}
}
else
{
	//Rain fade out
	if rain_alpha > 0
		rain_alpha -= 0.01;
	else
		instance_destroy();
}

if !audio_is_playing(snd_raining)
	scr_make_sound(snd_raining,1,1,true);
audio_sound_gain(snd_raining,rain_alpha*2,500);

//Damage the player
if villainy != 0
{
	var shelter_check = false;
	if turtloid = true
	{
		if rain_active = true
			tick_rate = global.animate%15;	
		
		//if collision_line(obj_player.x,obj_player.y,obj_player.x,obj_player.y-500,obj_boss_turtloid,true,false)
		if (obj_player.x < obj_boss_turtloid.x+45) and (obj_player.x > obj_boss_turtloid.x-45) and obj_player.y > obj_boss_turtloid.y
			shelter_check = true;
	}
	
	//Taking damage from acid
	if tick_rate = 0 and global.life > 0 and obj_player.movement = true and shelter_check = false
	{
		global.life -= damage;
		acid_effect = 5;
		scr_make_sound(snd_acid,1,1,false);
	}
	
	//Visual effect
	if acid_effect > 0
	{
		acid_effect--;
		obj_player.image_blend = c_blue;
	}
}

//Damage enemies
if villainy != 2
	event_user(10);



if !audio_is_playing(snd_raining)
	scr_make_sound(snd_raining,1,1,true);
audio_sound_gain(snd_raining,rain_alpha*2,500);


