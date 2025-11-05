/// @description Insert description here
// You can write your code in this editor

//Can be paused
if global.pause = true
	return;

if expiry != -1	
{
	if expiry > 0
		expiry--;
	else
		alarm[9] = 1;
}

if !place_meeting(x,y,obj_spawnzone) and despawn = true
	alarm[9] = 1;

if afterimage_toggle = true
{
	if global.animate%3 = 0
	{
		afterimage = instance_create_depth(x,y,depth+1,obj_afterimage);
		afterimage.image_index = image_index;
		afterimage.sprite_index = sprite_index;
		afterimage.image_xscale = image_xscale;
	
		afterimage.image_blend = afterimage_blend;
		afterimage.fade_speed = afterimage_fade;
	}
}










