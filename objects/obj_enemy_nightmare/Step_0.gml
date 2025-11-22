/// @description Insert description here
// You can write your code in this editor

//Can be paused
if global.pause = true
	return;

// Inherit the parent event
event_inherited();

if life > 0
{
	//Afterimages
	if global.animate%10 = 0 and fade_in = 0 and image_alpha > 0
	{
		offset_x = 0;
		offset_y = 0;
		var offset_chance = irandom(3)
		if offset_chance = 0
		{
			var offset_range = 4;
			offset_x = random_range(-offset_range,offset_range);
			offset_y = random_range(-offset_range,offset_range);
		}
		
		afterimage = instance_create_depth(x+offset_x,y+offset_y,depth+10,obj_afterimage);
		afterimage.image_blend = choose(c_blue,c_red);
		afterimage.sprite_index = sprite_index;
		afterimage.image_index = image_index;
		afterimage.image_xscale = image_xscale;
	}
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		scr_make_sound(snd_explosion,1,1,false);
		death = 1;
	}
}