// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_get_dialogue() 
{
	var player = "X";
	
	switch (dialogue) 
	{
		case "X vs Yammark": 
			left_character = player;
			right_character = "Yammark";

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
			
		case "Blade Armour Leg Part":
			left_character = player;
			right_character = "Dr. Light";
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "I understand your sorrow...X"
			text[1] = "You risked everything to save the world-"
			text[2] = "But yet, another conflict takes place right after"
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "I know..."
			text[4] = "But the world is in a vulnerable state right now"
			text[5] = "And I must protect the terrified people being preyed apon by those who would take advantage"
			
			if page = 6 {speaking_is_right = true;} //Switch speaker
			text[6] = "The world must have the time to heal"
			text[7] = "And put an end to this nightmare..."
			
			text[8] = "Step into this capsule X"
			text[9] = "You will recieve the leg parts for the Blade Armour"
			text[10] = "You will be able to perform the damaging Mach Dash, allowing you to air dash in all four cardinal directions"
			text[11] = "It can be charged in mid-air to deal even more damage"
			
			text[12] = "Guide the people, X"
			text[13] = "Defend them from the horrors we can only dream of"
			break;
			
		case "Amazon Ruins Intro":
			left_character = player;
			right_character = "Alia";
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "This is the Amazon Ruins"
			scr_get_character("Yammark");
			text[1] = "The Nightmare Investigator, "+character_name+" is in charge of the area" 
			text[2] = "He has been attacking any Maverick Hunter that has tried to infiltrate his strict perimeter."
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "I'll try to catch his attention so you can organise the reploid rescue operation"
			
			if page = 4 {speaking_is_right = true;} //Switch speaker
			text[4] = "Though be warned. There are reports that the path ahead is infested with powerful mechaniloids"
			text[5] = "..."
			text[6] = "Although my scans don't seem reveal anything of the sort?"
			
			if page = 7 {speaking_is_right = false;} //Switch speaker
			text[7] = "Must be the work of the Nightmare..."
			text[8] = "I'll be careful"
			text[9] = "...!"
			break;	
		case "Amazon Ruins Intro: Yammark Appears":
			left_character = player;
			right_character = "Alia";
			
			text[0] = "I've spotted Commander Yammark!"
			text[1] = "Engaging in pursuit"
			break;
	}
}