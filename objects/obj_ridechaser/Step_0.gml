/// @description Insert description here
// You can write your code in this editor

if global.pause_screen = true
	audio_stop_sound(snd_bike)
if global.pause = true
	return;

//Increase variable
ridechaser_moving -= ridechaser_speed;

obj_background.bg_scrolling = ridechaser_moving/40;

with obj_afterimage
	x -= (obj_ridechaser.ridechaser_speed/5)
	
if !audio_is_playing(snd_bike)
	scr_make_sound(snd_bike,0.5,1,true);
	
with obj_pickup
{
	if colliding = true
	{
		if airborne = false
			x -= obj_ridechaser.ridechaser_speed/2;
	}
	else
		x -= obj_ridechaser.ridechaser_speed/10;

}

function scr_ridechaser_spawn(enemy,enemy_x,enemy_y,enemy_edit)
{
	spawn = instance_create_layer(obj_camera.x+(16*enemy_x),obj_camera.y+(16*enemy_y),"Instances",enemy);
	spawn.despawn = false;
	spawn.respawn = false;

	if enemy = obj_enemy_spiky
		spawn.bounce_height = enemy_edit;
	else if enemy = obj_enemy_nightmare or enemy = obj_enemy_nightmare_small or enemy = obj_enemy_nightmare_blaze
	{
		with spawn
		{
			state = "Ride Chaser";
			alarm[0] = 1;
			
			damage = 0;
			image_alpha = 0;
		}
	}
}

var skip = false
with obj_spawnzone
	if !place_meeting(x,y,obj_enemy_hostile)
		skip = true;
		
if skip = true and ridechaser_break = false
	alarm[0] = 1;