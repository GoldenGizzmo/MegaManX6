/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	if action = 0
	{
		if place_meeting(x,y,obj_camera)
		{
			action++;
			alarm[1] = 1;
		}
		else
			alarm[1] = 1;
	}
	else
	{
		if fade_in > 0
		{
			if fade_in = 40
				scr_make_sound(snd_nightmare_teleport,1,0.5,false);
			
			fade_in -= 2;
			if image_alpha < 1
				image_alpha += 0.05;
			
			invul = true;
			alarm[1] = 1;
			
			//Afterimages
			offset_x = 0;
			offset_y = 0;
		
			var offset_range = fade_in;
			offset_x = random_range(-offset_range,offset_range);
			offset_y = random_range(-offset_range,offset_range);
		
			afterimage = instance_create_depth(x+offset_x,y+offset_y,depth+10,obj_afterimage);
			afterimage.image_blend = choose(c_blue,c_red);
			afterimage.sprite_index = sprite_index;
			afterimage.image_index = image_index;
			afterimage.image_xscale = image_xscale;
		}
		else
		{
			action = 0;
			alarm[0] = 60;
			
			invul = false;
			damage = damage_store;
		}
	}
}