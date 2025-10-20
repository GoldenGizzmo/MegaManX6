// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_level(level)
{
	level_name = "Unknown";
	level_description = "???";
	level_background = "Nothing";
	level_destination = "Nothing";
	level_colour = c_white;
	
	level_map_x = 0;
	level_map_y = 0;
	
	switch (level)
	{
		case 0:
			level_name = "Amazon Ruins";
			level_background = spr_bg_yammark_temples;
			level_destination = rm_yammark;
			level_map_x = 47;
			level_map_y = 12;
			
			scr_get_character("Yammark");
			level_colour = character_colour;
			
			level_description = "Investigator:\n"+character_name+"\n\nNightmare:\nRegenerating Mechaniloids";
			break;
	
		case 1:
			level_name = "Inami Temple";
			level_background = spr_bg_turtloid;
			level_destination = rm_turtloid;
			level_map_x = -11;
			level_map_y = -10;
			
			scr_get_character("Turtloid");
			level_colour = character_colour;
			
			level_description = "Investigator:\n"+character_name+"\n\nNightmare:\nAcid Rain";
			break;
	}
}