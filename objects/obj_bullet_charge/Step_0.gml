/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.pause = true
	return;

if sound != 0
{
	if !audio_is_playing(sound)
		scr_make_sound(sound,1,1,false);

}

if instance_exists(target)
{
	if target.life > 0
	{
		x = target.x+target_x;
		y = target.y+target_y;
	}
	else
		instance_destroy();
}
else
	instance_destroy();