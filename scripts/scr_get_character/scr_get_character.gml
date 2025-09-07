// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_get_character(character)
{
	character_colour = c_white;
	character_name = character;
	pause_hue = 0;
	switch (character)
	{
		case "X":
			character_colour = make_color_rgb(0,144,255);
			mugshot = spr_mugshot_x;
			mugshot_talk = spr_mugshot_x_talk;
			pause_hue = 0;
			break;
		
		case "Yammark":
			character_colour = make_color_rgb(66,181,0);
			character_name = "Commander Yammark"; //If I were to change the name
			mugshot = spr_mugshot_yammark;
			mugshot_talk = 0;
			break;
			
		case "Dr. Light":
			character_colour = make_color_rgb(171,232,255);
			mugshot = spr_mugshot_drlight;
			mugshot_talk = spr_mugshot_drlight_talk;
			break;
			
		case "Alia":
			character_colour = make_color_rgb(255,102,102);
			mugshot = spr_mugshot_alia;
			mugshot_talk = spr_mugshot_alia_talk;
			break;
	}
}