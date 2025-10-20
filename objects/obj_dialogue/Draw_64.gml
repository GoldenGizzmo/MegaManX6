/// @description Insert description here
// You can write your code in this editor

//Skip text
if global.input_start_pressed
	finish = true;
	
//Text
draw_set_font(fnt_heading);
scr_get_dialogue();
//How many messages are in the array
page_end = array_length_1d(text);
	
var scale = global.ui_scale/1.5;
	
var text_colour = c_white;
var x_pos = display_get_gui_width()/2
var y_pos = (display_get_gui_height()/2)+(27*scale);
	
	
	
//Dialogue box
if animation_y = 1
{
	var right_alpha = 1;
	if right_character = "Dr. Light" and dr_light_flicker = true
	{
		draw_sprite_ext(spr_mugshot_drlight_flicker,0,x_pos+(118*scale),y_pos-(75*scale),scale,scale,0,c_white,1);
		right_alpha = 0.5;
	}
	
	if left_character != "Nothing"
	{
		scr_get_character(left_character);
		draw_sprite_ext(mugshot,left_blink,x_pos-(118*scale),y_pos-(75*scale),-scale,scale,0,c_white,1);
		if mugshot_talk != 0 and left_talking > 1 //Talking
			draw_sprite_ext(mugshot_talk,left_talking/3,x_pos-(118*scale),y_pos-(75*scale),-scale,scale,0,c_white,1);
	}
	else
		draw_sprite_ext(spr_mugshot_closing,global.animate,x_pos-(118*scale),y_pos,-scale,scale,0,c_white,right_alpha);
	
	scr_get_character(right_character);
	if right_character != "Nothing"
	{
		draw_sprite_ext(mugshot,right_blink,x_pos+(118*scale),y_pos-(75*scale),scale,scale,0,c_white,right_alpha);
		if mugshot_talk != 0 and right_talking > 1 //Talking
			draw_sprite_ext(mugshot_talk,right_talking/3,x_pos+(118*scale),y_pos-(75*scale),scale,scale,0,c_white,right_alpha);	
	}
	else
		draw_sprite_ext(spr_mugshot_closing,global.animate,x_pos+(118*scale),y_pos,scale,scale,0,c_white,right_alpha);
}
	
draw_sprite_ext(spr_mugshot_closing,global.animate,x_pos-(118*scale),y_pos,-scale,scale*animation_y,0,c_white,animation_static);
draw_sprite_ext(spr_mugshot_closing,global.animate,x_pos+(118*scale),y_pos,scale,scale*animation_y,0,c_white,animation_static);
		
var speaking = left_character;
var not_speaking = right_character;
if speaking_is_right = true
{
	speaking = right_character;
	not_speaking = left_character;
}
	
scr_get_character(not_speaking);
draw_sprite_ext(spr_dialogue_box,!speaking_is_right,x_pos,y_pos,scale,scale*animation_y,0,character_colour,1);
draw_sprite_ext(spr_dialogue_box,!speaking_is_right+2,x_pos,y_pos,scale,scale*animation_y,0,c_white,1);
scr_get_character(speaking);
draw_sprite_ext(spr_dialogue_box,speaking_is_right,x_pos,y_pos,scale,scale*animation_y,0,character_colour,1);
draw_sprite_ext(spr_dialogue_box,speaking_is_right+2,x_pos,y_pos,scale,scale*animation_y,0,c_white,1);
	


//Decide who's talking
scr_get_character(speaking);

if animation_y = 1 and finish = false
{
	/*
	//Name of the speaker
	draw_set_halign(fa_center);
		draw_text_transformed_color(x_pos,y_pos+(8*scale),string_upper(character_name),scale,scale,0,c_white,c_white,c_white,c_white,1-animation_static);
	draw_set_halign(fa_left);
	//Name underline
	draw_sprite_ext(spr_dialogue_box_underline,0,x_pos-(scale*(string_width(character_name)-2)/2),y_pos+(26*scale),scale*(string_width(character_name)-3),scale,0,c_white,1-animation_static);
	draw_sprite_ext(spr_dialogue_box_underline,1,x_pos-(scale*(string_width(character_name))/2),y_pos+(26*scale),scale,scale,0,c_white,1-animation_static);
	draw_set_font(global.fnt_game);*/
	//Name of the speaker
	if name_hidden = true //Who is this guy?
		character_name = "???"
	draw_text_transformed_color(x_pos-(120*scale),y_pos+(8*scale),string_upper(character_name),scale,scale,0,c_white,c_white,c_white,c_white,1-animation_static);
	//Name underline
	draw_sprite_ext(spr_dialogue_box_underline,0,x_pos-(scale*120),y_pos+(26*scale),scale*(string_width(character_name)-3),scale,0,c_white,1-animation_static);
	draw_sprite_ext(spr_dialogue_box_underline,1,x_pos-(scale*120),y_pos+(26*scale),scale,scale,0,c_white,1-animation_static);
	draw_set_font(global.fnt_game);
	
	
	if page_end > 0
	{
		var char_width = 6*scale;
		var line_end = 45;
		var line = 0;
		var space = 0;
		var i = 1;
		delay = 0;
		
		//Next message
		if global.input_jump_pressed
		{
			//if state = 1
			//	scr_make_sound(snd_menu_dialogue_next);
			
			//If we still have some more messages, go to the next one
			if page < page_end-1
			{
				page++;
				cutoff = 0;
			}
			else //If not, finish
				finish = true;
		}
		
		if text_delay = 0
		{
			//Text position
			var text_center = string_length(text[page])*(9);
			if string_length(text[page]) >= line_end
				text_center = line_end*(9);
				
			var text_x = x_pos-(scale*120)
			var text_y = y_pos+(33*scale);
			
			//Draw text
			modifier = 0;
			while i <= string_length(text[page]) and i <= cutoff
			{
				//Check for modifier
				if (string_char_at(text[page],i) = "#")
				{
					modifier = real(string_char_at(text[page],i+1))
					i += 2;
				}

				//Go to next line
				var length = 0;
				while string_char_at(text[page],i) != " " and i <= string_length(text[page])
				{
					i++;
					length++;
				}
			
				if space+length > line_end
				{
					space = 0;
					line += 3.5; //Space between lines
				}
				i -= length;
			
				//Text
				delay = 0; //4; //Accurate to X series
				
				text_colour = character_colour;
				draw_text_transformed_color(text_x+(space*char_width)+(6*global.ui_scale),text_y+(13*line),string_char_at(text[page],i),scale,scale,0,text_colour,text_colour,text_colour,text_colour,1);
				/*
				switch (modifier)
				{
					case 0: //Normal
						draw_text_transformed_color(text_x+(space*char_width),text_y+(13*line),string_char_at(text[page],i),global.ui_scale/2,global.ui_scale/2,0,text_colour,text_colour,text_colour,text_colour,1);
						break;
					
					case 1: //Shaky
						draw_text_transformed_color(text_x+(space*char_width)+random_range(-2,2),text_y+(13*line)+random_range(-2,2),string_char_at(text[page],i),global.ui_scale/2,global.ui_scale/2,0,text_colour,text_colour,text_colour,text_colour,1);	
						break;
					
					case 2: //Coloured
						var modifier_colour = global.ui_highlight;
						if text_colour != c_white
							modifier_colour = c_white;
				
						draw_text_transformed_color(text_x+(space*char_width),text_y+(13*line),string_char_at(text[page],i),global.ui_scale/2,global.ui_scale/2,0,modifier_colour,modifier_colour,modifier_colour,modifier_colour,1);
						break;
					
					case 3: //Slow
						delay = 3;
						draw_text_transformed_color(text_x+(space*char_width),text_y+(13*line),string_char_at(text[page],i),global.ui_scale/2,global.ui_scale/2,0,text_colour,text_colour,text_colour,text_colour,1);
						break;
					
					case 4: //Big
						draw_set_font(fnt_heading);
						char_width = 12*global.ui_scale/1.5;
						draw_text_transformed_color(text_x+(space*char_width),text_y+(13*line),string_upper(string_char_at(text[page],i)),global.ui_scale/1.5,global.ui_scale/1.5,0,text_colour,text_colour,text_colour,text_colour,1);
						break;
					
					case 5: //Big and Shaky
						draw_set_font(fnt_heading);
						char_width = 12*global.ui_scale/1.5;
						draw_text_transformed_color(text_x+(space*char_width)+random_range(-2,2),text_y+(13*line)+random_range(-2,2),string_upper(string_char_at(text[page],i)),global.ui_scale/1.5,global.ui_scale/1.5,0,text_colour,text_colour,text_colour,text_colour,1);
						break;
					
					case 6: //Bounce
						bounce = 0
						if global.animate%2 = 0
						{
							bounce = 2;				
							if global.animate%4 = 0
								bounce = -2;
						}
						draw_text_transformed_color(text_x+(space*char_width),text_y+(13*line)+bounce,string_char_at(text[page],i),global.ui_scale/2,global.ui_scale/2,0,text_colour,text_colour,text_colour,text_colour,1);
						break;
						
					case 7: //Very Slow and Coloured
						delay = 8;
						var modifier_colour = global.ui_highlight;
						if text_colour != c_white
							modifier_colour = c_white;
						
						draw_text_transformed_color(text_x+(space*char_width),text_y+(13*line),string_char_at(text[page],i),global.ui_scale/2,global.ui_scale/2,0,modifier_colour,modifier_colour,modifier_colour,modifier_colour,1);
						break;
						
					case 8: //Coloured Characters
						scr_get_character(mention_colour);
						modifier_colour = boss_colour;
						
						draw_text_transformed_color(text_x+(space*char_width),text_y+(13*line),string_char_at(text[page],i),global.ui_scale/2,global.ui_scale/2,0,modifier_colour,modifier_colour,modifier_colour,modifier_colour,1);
						break;
						
					case 9: //Spooky
						delay = 5;
						char_width = 8*global.ui_scale/3;
						draw_text_transformed_color(text_x+(space*char_width)+random_range(-1,1),text_y+(13*line)+random_range(-1,1),string_char_at(text[page],i),global.ui_scale/3,global.ui_scale/3,0,text_colour,text_colour,text_colour,text_colour,1);
						audio_pause_sound(global.music);
						break;
				}
				*/
				
				space++;
				i++;
			
			
			}
		
			//Typewriter
			if cutoff < string_length(text[page])
			{
				if timer >= delay
				{
					//if string_char_at(text[page],i) != " "
					if cutoff%4 = 0
						scr_make_sound(snd_text_scroll,1,1,false);
				
					cutoff++;
					timer = 0;
				}
				else
					timer++;
			}
		
			//Continue arrow
			if !(i = string_length(text[page]) or i = cutoff) and space > 1
			{
				left_talking = 0;
				right_talking = 0;
				
				//	draw_sprite_ext(spr_dialogue_arrow,0,text_x+(133*global.ui_scale),text_y+(21*global.ui_scale),global.ui_scale,global.ui_scale,0,text_colour,flash);
			}
			else
			{
				if speaking_is_right = false
				{
					left_talking++;
					right_talking = 0;
				}
				else
				{
					left_talking = 0;
					right_talking++;
				}
			}
		}
	}
}
	
if animation_y < 0.2
	draw_sprite_ext(spr_dialogue_box,4,x_pos,y_pos,scale*animation_x,scale,0,c_white,1)