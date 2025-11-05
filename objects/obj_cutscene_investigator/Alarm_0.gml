/// @description Intro 

var scale = global.ui_scale/1.25; //Menu size

switch (action)
{
	case -1: //Colour fade in from black
		alarm[0] = 1;
		if colour_fade < 1	
			colour_fade += 0.1;
		else
		{
			action++;
			alarm[0] = 1;
		}
		break;
	
	case 0: //White light shining through
		alarm[0] = 1;
		if middle_fade < 1	
			middle_fade += 0.02;
		else
		{
			action++;
			alarm[0] = 60;
		}
		break;

	case 1: //Afterimage of the boss appears
		alarm[0] = 1;
		
		if afterimage_appear > 0
			afterimage_appear -= 2;
		else
			action++;
		
		//Afterimages
		var offset_range = afterimage_appear;
		var offset_x = random_range(-offset_range,offset_range);
		var offset_y = random_range(-offset_range,offset_range);
		
		afterimage = instance_create_depth(display_get_gui_width()/2+(offset_x*scale),display_get_gui_height()/2+(offset_y*scale)-(10*scale),depth,obj_afterimage_gui);
		afterimage.image_blend = c_black;
		afterimage.sprite_index = sprite_index;
		afterimage.image_index = image_index;
		afterimage.image_xscale = scale;
		afterimage.image_yscale = scale;
		break;
		
	case 2: //Boss fades in to view
		if boss_fadein > 0
		{
			boss_fadein -= 0.02;
			alarm[0] = 1;
		}
		else
		{
			alarm[1] = 1;
			action++
		}
		break;
		
	case 3: //Finish their animation
		
		break;
		
	case 4: //Flash bang
		alarm[0] = 1;
		action++
		
		
		//Swap colours
		with obj_dna_strand_small
		{
			if image_blend = c_black
				image_blend = c_white;
			else
				image_blend = c_black;
		}
		
		fade = instance_create_depth(0,0,0,obj_fade_in);
		fade.image_blend = c_white;
		fade.fade_speed = 0.02;
		scr_make_sound(snd_menu_boom,1,0.5,false);
		break;
		
	case 5: //Freeze frame
		action++;
		alarm[0] = 180;
		break;
		
	case 6: //Fade out
		action_ending = 1;
		fade = instance_create_depth(0,0,0,obj_fade_out);
		fade.fade_speed = 0.01;
		break;
}

/*
switch (action)
{
	case 0:
		alarm[0] = 1;
		if slide < 300
			slide += 2;
		else
		{
			action++;
			alarm[0] = 60;
		}
		break;

	case 1:
		alarm[0] = 1;
		if slide_face < 400
			slide_face += 3;
		break;
}