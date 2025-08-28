// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_get_dialogue() 
{
	var player = "X";
	
	switch (dialogue) 
	{
		case "X vs Yanmark": 
			left_character = player;
			right_character = "Yanmark";

			text[0] = "You're the Nightmare Investigator-"
			scr_get_character(right_character);
			text[1] = character_name+"?"
			
			if page = 2 {speaking_is_right = true;} //Switch speaker
			text[2] = "How do you know that?"
			text[3] = "Who are you?"
			text[4] = "What do you want!?"
			
			if page = 5 {speaking_is_right = false;} //Switch speaker
			text[5] = "I just want to ask about the nightma-"
			
			if page = 6 {speaking_is_right = true;} //Switch speaker
			text[6] = "Are you here to kill me!?"
			text[7] = "I was the best in my field!"
			text[8] = "And what, my flight system was sabotaged and I died!"
			text[9] = "Did you come here to sabotage me again?"
			
			if page = 10 {speaking_is_right = false;} //Switch speaker
			text[10] = "You're paranoia is out of control"
			
			if page = 11 {speaking_is_right = true;} //Switch speaker
			text[11] = "No, no, no, no!"
			text[12] = "You're out of control"
			text[13] = "I know because you're a liar!"
			text[14] = "I won't be betrayed again"
			text[15] = "I will delete you before you delete me!"
			break;
	}
}