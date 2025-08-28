// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_get_character(character)
{
	character_colour = c_white;
	character_name = character;
	switch (character)
	{
		case "X":
			character_colour = make_color_rgb(0,144,255);
			mugshot = spr_mugshot_x;
			mugshot_talk = spr_mugshot_x_talk;
			break;
		
		case "Yanmark":
			character_colour = make_color_rgb(66,181,0);
			character_name = "Commander Yanmark"; //If I were to change the name
			mugshot = spr_mugshot_yanmark;
			mugshot_talk = 0;
			break;
	}
}