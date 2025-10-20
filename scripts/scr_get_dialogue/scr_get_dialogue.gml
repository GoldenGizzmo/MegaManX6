// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_get_dialogue() 
{
	var player = "X";
	
	switch (dialogue) 
	{
		case "High Max Escape":
			left_character = player;
			right_character = "High Max";
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "As expected...underwhelming"
			
			if page = 1 {speaking_is_right = false;} //Switch speaker
			text[1] = "I didn't even inflict a dent on him"
			text[2] = "His armor plating far exceeds anything I've ever fought before!"
			
			if page = 3 {speaking_is_right = true;} //Switch speaker
			text[3] = "You're in over your head, X"
			
			if page = 4 {speaking_is_right = false;} //Switch speaker
			text[4] = "You know who I am?"
			
			if page = 5 {speaking_is_right = true;} //Switch speaker
			text[5] = "I'm not a fool"
			text[6] = "You Maverick Hunters are now relics of the past"
			text[7] = "We will clean up the mess you've made"
			text[8] = "It is time for your long overdue retirement..."
			
			if page = 9 {speaking_is_right = false;} //Switch speaker
			text[9] = "...!"
			break;
		case "High Max Escape 2":
			left_character = player;
			right_character = "Alia";
			
			text[0] = "Alia!"
			text[1] = "Emergency evacuation!"
			
			if page = 2 {speaking_is_right = true;} //Switch speaker
			text[2] = "On it!"
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "Now, Alia!"
			break;
		case "High Max Escape 3":
			left_character = "Nothing";
			right_character = "High Max";
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "The Nightmare Investigation will continue"
			text[1] = "Those caught in the way:"
			text[2] = "New reploids..."
			text[3] = "Legendary reploids..."
			text[4] = "Mavericks..."
			text[5] = "Maverick Hunters..."
			text[6] = "You are all beneath me...High Max"
			break;

		case "X vs High Max Intro":
			left_character = player;
			right_character = "High Max";
				
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "Seems it has reached even here of all places..."
			
			if page = 1 {speaking_is_right = false;} //Switch speaker
			text[1] = "Hold it!"
			text[2] = "Who are you!?"
			
			if page = 3 {speaking_is_right = true;} //Switch speaker
			text[3] = "Hm...?"
			text[4] = "Did you say something to me, little robot?"
			text[5] = "I am High Max"
			text[6] = "And you are interfering with the investigation of the Zero Nightmare"
			
			if page = 7 {speaking_is_right = false;} //Switch speaker
			text[7] = "Zero Nightmare?"
			text[8] = "What are you talking about?"
			text[9] = "Are you involved with that...that spectre?"
			
			if page = 10 {speaking_is_right = true;} //Switch speaker
			text[10] = "Your endless questions are irritating..."
			text[11] = "I won't give you a second warning"
			text[12] = "Inferior bugs like yourself will be disposed of"
			
			//Hide High Max's name
			if speaking_is_right = true and page < 5
				name_hidden = true;
			else
				name_hidden = false;
			break;
		
		case "High Max Intro":
			left_character = player;
			right_character = "Nothing";
			
			text[0] = "Damn it!"
			text[1] = "It must've gotten away"
			text[2] = "...?"
			
			if page >= 3 {right_character = "Alia";}
			if page = 3 {speaking_is_right = true;} //Switch speaker
			text[3] = "X!"
			text[4] = "I've been having difficulty reaching you"
			text[5] = "There's a massive energy signature approaching!"
			text[6] = "Be careful!"
			
			if page = 7 {speaking_is_right = false;} //Switch speaker
			text[7] = "Huh?"
			text[8] = "Is it another mechaniloid or something like that?"
			
			if page = 9 {speaking_is_right = true;} //Switch speaker
			text[9] = "The energy it's producing is huge!"
			text[10] = "But...it's unlike anything I've ever seen"
			text[11] = "It's..."
			text[12] = "A reploid?"
			break;
		
		case "X vs D1000":
			left_character = player;
			right_character = "Alia";
			
			text[0] = "Alia, I've located the D1000 Excavator"
			text[1] = "It's moving around in a very strange way"
			text[2] = "And there's this 'eye' that's been harrassing me ever since I've arrived here" 
			
			if page = 3 {speaking_is_right = true;} //Switch speaker
			text[3] = "...?"
			text[4] = "What do you mean, sorry?"
			text[5] = "The D1000 isn't giving any energy signatures"
			text[6] = "It's just sitting there, deactivated from what I can see"
			text[7] = "Are you referring to something else?"
			
			if page = 8 {speaking_is_right = false;} //Switch speaker
			text[8] = "W-what?"
			text[9] = "I'll call you back when I've sorted this out"
			if page >= 10 {right_character = "Nothing";}
			text[10] = "..."
			text[11] = "This 'eye' is too quick for me"
			text[12] = "I need to destroy whatever it can use as weapon"
			text[13] = "Though it seems the D1000 is too heavy for it's own good..."
			break;	
			
		case "X vs D1000 Ending":
			left_character = player;
			right_character = "Nothing";
			
			text[0] = "You're kidding..."
			text[1] = "At this point you'll use just about anything!"
			break;	
		case "X vs D1000 Ending 2":
			left_character = player;
			right_character = "Nothing";
			
			text[0] = "Z-Zero!?"
			text[1] = "No..."
			text[2] = "I-it can't be..."
			text[3] = "Hey, come back!"
			break;
			
		case "Intro Intro":
			left_character = player;
			right_character = "Alia";

			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "Mechaniloids have started going maverick all around the Crash Site"
			text[1] = "With a massive D1000 Excavator being the main threat to the clean up crew"
			text[2] = "Once reutralized, the reparations can continue"
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "Understood"
			
			if page = 4 {speaking_is_right = true;} //Switch speaker
			text[4] = "I know you've been overworked as it's been case after case"
			text[5] = "If you need to take a break, I can call in another team-"
			
			if page = 6 {speaking_is_right = false;} //Switch speaker
			text[6] = "No, it's okay, Alia"
			text[7] = "I had a feeling the effects of Sigma wouldn't just go away"
			text[8] = "I've got to keep the peace, more now than ever"
			text[9] = "Beginning mission"
			break;
		
		case "X vs Yammark": 
			left_character = player;
			right_character = "Yammark";

			scr_get_character(right_character);
			text[0] = character_name+", I've come to talk with you about your investigation"
			
			if page = 1 {speaking_is_right = true;} //Switch speaker
			text[1] = "How do you know that?"
			text[2] = "Who are you?"
			text[3] = "What do you want!?"
			
			if page = 4 {speaking_is_right = false;} //Switch speaker
			text[4] = "Release your perimeter, let the reploids caught inside go"
			
			if page = 5 {speaking_is_right = true;} //Switch speaker
			text[5] = "No one comes in!"
			text[6] = "NO ONE LEAVES!"
			text[7] = "My orders are ABSOLUTE until my investigation is complete!"
			
			if page = 8 {speaking_is_right = false;} //Switch speaker
			text[8] = "If that's how it will be, then I suggest you focus all your mechaniloids on me"
			
			if page = 9 {speaking_is_right = true;} //Switch speaker
			text[9] = "Are you here to kill me!?"
			text[10] = "I was the best in my field!"
			text[11] = "And what? My flight system was sabotaged and I died!"
			text[12] = "Did you come here to sabotage me again?"
			
			if page = 13 {speaking_is_right = false;} //Switch speaker
			text[13] = "Your paranoia is out of contr-"
			
			if page = 14 {speaking_is_right = true;} //Switch speaker
			text[14] = "No, no, no, no!"
			text[15] = "YOU...are out of control"
			text[16] = "I know because you're a liar!"
			text[17] = "I won't be betrayed again"
			text[18] = "I will delete you before you delete me!"
			text[19] = "FORMATION: RETURN!"
			break;
			
		case "X vs Turtloid": 
			left_character = player;
			right_character = "Turtloid";

			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "I was one of the few reploids authorized to enter and explore restricted 'Level A' pollution zones"
			text[1] = "My shell was designed to withstand even the harshest of acid rain"	
			
			if page = 2 {speaking_is_right = false;} //Switch speaker
			text[2] = "We could use your help with the Eurasia Crashsite"
			text[3] = "Your design is a gift"
			text[4] = "And I would really appreciate it if you helped us repair the devistated land"
			
			if page = 5 {speaking_is_right = true;} //Switch speaker
			text[5] = "A gift?"
			text[6] = "If that's the case..."
			text[7] = "Why was my creator punished when he refused to weaken my defensive capabilities?"
			text[8] = "They were punished all because of me and my 'gift'"
			text[9] = "I couldn't live with myself knowing how much shame I brought to everyone around me"
			text[10] = "So I lived no more..."
			
			if page = 11 {speaking_is_right = false;} //Switch speaker
			text[11] = "But now you're back"
			text[12] = "Things can be different now."
			text[13] = "You and I can stop this nightmare together"
			
			if page = 14 {speaking_is_right = true;} //Switch speaker
			text[14] = "I..."
			break;
			
		case "X vs Turtloid 2":
			left_character = player;
			right_character = "Turtloid";

			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "No..."
			text[1] = "I've heard so many stories about a maverick hunter whose compassion knew no bounds"	
			text[2] = "I didn’t expect to finally meet him, not here"
			text[3] = "Seems my respect was well placed"
			text[4] = "But it is my duty to prove my loyalty to my creator who has rebuilt me despite everything"
			text[5] = "He forgives me for my gift"
			
			scr_get_character(right_character);
			if page = 6 {speaking_is_right = false;} //Switch speaker
			text[6] = character_name+", I don’t want to fight you!"
			
			if page = 7 {speaking_is_right = true;} //Switch speaker
			text[7] = "You have no choice but to surpass my gift"
			break;
			
		case "Blade Armour Leg Part":
			left_character = player;
			right_character = "Dr. Light";
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "I understand your sorrow...X"
			text[1] = "You risked everything to save the world-"
			text[2] = "But yet, another conflict takes place right after"
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "You saved me after my encounter with Sigma..."
			text[4] = "After Dr. Cain's passing, it leaves only you to know the nature of my design"
			text[5] = "It had to be you"
			text[6] = "So please, if I can ask this one thing..."
			text[7] = "Why have you only stepped in just now to help me directly?"
			
			if page = 8 {speaking_is_right = true;} //Switch speaker
			text[8] = "I regret to tell you this, but...my power is starting to fade"
			text[9] = "I thought I could assist you until you knew an era of peace, a time where my help would no longer be necessary"
			text[10] = "But now, I'm being stretched thin"
			text[11] = "..."
			text[12] = "However, I'm not done yet and you will need all the help you can get to fend off of the encroaching nightmare"
			
			text[13] = "Step into this capsule, X"
			text[14] = "You will receive the leg parts for the Blade Armour"
			text[15] = "You will be able to perform the damaging Mach Dash, allowing you to air dash in all four cardinal directions"
			text[16] = "It can be charged in mid-air to deal even more damage"
			
			text[17] = "Guide the people, X"
			text[18] = "Defend them from the horrors that we can only dream of"
			/*
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
			text[13] = "Defend them from the horrors we can only dream of"*/
			break;
			
		case "Amazon Ruins Intro":
			left_character = player;
			right_character = "Alia";
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "This is the Amazon Ruins"
			scr_get_character("Yammark");
			text[1] = "The Nightmare Investigator, "+character_name+" is in charge of the area" 
			text[2] = "Using his fleet of Yanma Mechaniloids, he's been attacking any Maverick Hunter trying to infiltrate his strict perimeter."
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "I'll try to catch his attention so you can organise the reploid rescue operation"
			
			if page = 4 {speaking_is_right = true;} //Switch speaker
			text[4] = "Though be warned. There are reports that the path ahead is infested with powerful mechaniloids that are said to be unstoppable"
			text[5] = "..."
			text[6] = "Although, my scans don't seem reveal anything at all?"
			
			if page = 7 {speaking_is_right = false;} //Switch speaker
			text[7] = "Must be the work of the Nightmare..."
			text[8] = "I'll be careful"
			text[9] = "...!"
			text[10] = "Something's coming!"
			break;	
		case "Amazon Ruins Intro: Yammark Appears":
			left_character = player;
			right_character = "Alia";
			
			scr_get_character("Yammark");
			text[0] = "I've spotted "+character_name+"!"
			text[1] = "Engaging in pursuit"
			break;
			
		case "Inami Temple Intro":
			left_character = player;
			right_character = "Alia";
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "You should now be near the Inami Temple"
			scr_get_character("Turtloid");
			text[1] = "It's an important cultural asset that's been devastated by the Colony Crash" 
			text[2] = "The investigation into this area is being led by "+character_name
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "How tragic..."
			text[4] = "This place is completely flooded with polluted water"
			
			if page = 5 {speaking_is_right = true;} //Switch speaker
			text[5] = "After the Crash, a repair team attempted to set up Weather Analysis machines to keep the site protected from further harm"
			break;	
		case "Inami Temple Intro: Raining":
			left_character = player;
			right_character = "Alia";
			
			if page = 0 {speaking_is_right = false;} //Switch speaker
			text[0] = "...?"
			text[1] = "It just starting raining out of nowhere"
			
			if page = 2 {speaking_is_right = true;} //Switch speaker
			text[2] = "looks like they had little luck with the machines..."
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "...!"
			text[4] = "Alia, this isn't normal rain!"
			text[5] = "It's Acid Rain!"
			
			if page = 6 {speaking_is_right = true;} //Switch speaker
			text[6] = "Acid Rain?"
			text[7] = "But I'm not detecting any weather in that area?"
			text[8] = "The nightmare must have caused the Weather Analysis machines to go berserk!"
			text[9] = "I'll get you of there"
			
			if page = 10 {speaking_is_right = false;} //Switch speaker
			text[10] = "No, it's okay!"
			text[11] = "As long as I keep myself repaired-"
			text[12] = "I'll be able to destroy those infected machines and clear the area of the nightmare"
			break;
	}
}