/// @description Insert description here
// You can write your code in this editor

//Can be paused
if global.pause = true
	return;

// Inherit the parent event
event_inherited();

if life > 0
{
	if !instance_exists(shielding)
		instance_destroy();
		
	if shielding_flicker > 0
		shielding_flicker -= 0.02;
	
	propeller_spin++;
	
	//Afterimages
	if global.animate%10 = 0
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
		afterimage.image_blend = choose(c_aqua,make_color_rgb(255,80,0));
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

		for (var i = 0; i < 3; i++)
		{
			pickup = instance_create_layer(x,y,"Instances",obj_pickup);
			pickup.pickup_expiry = 60*5;
			pickup.direction  = irandom(359);
			pickup.speed = random_range(2,2.5);
			pickup.sprite_index = spr_pickup_soul_small;
		}
	}
}