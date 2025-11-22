// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_get_dialogue() 
{
	var player = "X";
	
	switch (dialogue) 
	{
		case "Magma Furnace Intro":
			left_character = player;
			right_character = "Alia";
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "Blaze Heatnix has been using the Nightmare investigation to hunt down the reploids that were lured into the Magma Furnace!"
			
			if page = 1 {speaking_is_right = false;} //Switch speaker
			text[1] = "What!?"
			text[2] = "'Nightmare Investigators'..."
			text[3] = "All of this was just an excuse to go maverick!";
			
			if page = 4 {speaking_is_right = true;} //Switch speaker
			text[4] = "Your ride chaser has been personally modified by Douglas to deal with the nightmare."
			text[5] = "It's easier to control with jet boosters that allow you to do a mid-air jump, as well as a charge shot."
			text[6] = "Hurry, we may not have much time before Blaze Heatnix turns the place into a slaughterhouse!"
			break;
			
		case "Magma Furnace Reploids":
			left_character = player;
			right_character = "Reploid";
			
			text[0] = "Are you guys alright?!";
			
			if page = 1 {speaking_is_right = true;} //Switch speaker
			text[1] = "That monster has been chasing us for days now...";
			text[2] = "I'm so scared, I don't want to die!";
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "It's okay, I'm here now.";
			text[4] = "I'm X, a maverick hunter.";
			
			if page = 5 {speaking_is_right = true;} //Switch speaker
			text[5] = "Please, help my friend, he's really hurt!";
			text[6] = "I thought we were here to fend off the nightmare, to get rid of it for good so we can go back to our normal lives.";
			text[7] = "I'm not cut out for this...";
			text[8] = "I just want to go home...";
			
			if page = 9 {speaking_is_right = false;} //Switch speaker
			text[9] = "I'll warp you two back to the Maverick Hunter base for recovery, then we'll send you home";
			break;
			
		case "Magma Furnace Reploids 2":
			left_character = player;
			right_character = "Reploid";
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "Oh no!";
			text[1] = "Please, no!";
			
			if page = 2 {speaking_is_right = false;} //Switch speaker
			text[2] = "What's going on!?";
			text[3] = "He's h-";
			break;
		
		case "X vs Heatnix":
			left_character = player;
			right_character = "Heatnix";
			
			text[0] = "..."
			
			if page = 1 {speaking_is_right = true;} //Switch speaker
			text[1] = "Oh ho, I can tell from your expression that you know EXACTLY who I am!"
			
			if page = 2 {speaking_is_right = false;} //Switch speaker
			text[2] = "Long before the Eurasia Crash, there was a catastrophic chain of volcano eruptions."
			text[3] = "You were a part of the team sent as disaster relief to help minimize the damage..."
			
			if page = 4 {speaking_is_right = true;} //Switch speaker
			text[4] = "Ugh, yes, I remember."
			text[5] = "What tedious work THAT was."
			text[6] = "I could've done all the work on my own in a flash"
			text[7] = "But nah,"
			text[8] = "I had to drag around useless team members and follow boring safety protocols that go ooooon, "
			text[9] = "and ooooon.."
			
			if page = 10 {speaking_is_right = false;} //Switch speaker
			text[10] = "The same team members that you left behind to be incinerated by your reckless arrogance."
			text[11] = "They all died from the dangerous situations that you happened to create!"
			
			if page = 12 {speaking_is_right = true;} //Switch speaker
			text[12] = "Oh come ooooon, are you done lecturing me?"
			text[13] = "I'm here to see if the 'legendary Maverick Hunter' title holds weight."
			text[14] = "Ugh, yes, I remember."
			text[15] = "After all, we both have to make tough choices when it comes to the mission,"
			text[16] = "don't we, X?"
			
			if page = 17 {speaking_is_right = false;} //Switch speaker
			text[17] = "I have nothing left to say to you..."
			break;
		
		case "High Max Escape":
			left_character = player;
			right_character = "High Max";
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "As expected... underwhelming."
			
			if page = 1 {speaking_is_right = false;} //Switch speaker
			text[1] = "I couldn't even dent him..."
			text[2] = "His armor plating far exceeds anything I've ever fought before!"
			
			if page = 3 {speaking_is_right = true;} //Switch speaker
			text[3] = "You're in over your head, X."
			
			if page = 4 {speaking_is_right = false;} //Switch speaker
			text[4] = "You know who I am?"
			
			if page = 5 {speaking_is_right = true;} //Switch speaker
			text[5] = "I'm no fool."
			text[6] = "You Maverick Hunters are now relics of the past."
			text[7] = "We will clean up the mess you've made."
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
			text[0] = "The Nightmare Investigation will continue."
			text[1] = "Those caught in the way;"
			text[2] = "New reploids..."
			text[3] = "Legendary reploids..."
			text[4] = "Mavericks..."
			text[5] = "Maverick Hunters..."
			text[6] = "You are all beneath... High Max."
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
			text[5] = "I am High Max,"
			text[6] = "and you are interfering with the investigation of the Zero Nightmare."
			
			if page = 7 {speaking_is_right = false;} //Switch speaker
			text[7] = "Zero Nightmare?"
			text[8] = "What are you talking about?"
			text[9] = "Are you involved with that... that spectre?"
			
			if page = 10 {speaking_is_right = true;} //Switch speaker
			text[10] = "Your endless questions are irritating..."
			text[11] = "I won't warn you a second time."
			text[12] = "Inferior bugs like yourself will be swatted."
			
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
			text[1] = "I must've lost its trail."
			text[2] = "...?"
			
			if page >= 3 {right_character = "Alia";}
			if page = 3 {speaking_is_right = true;} //Switch speaker
			text[3] = "X!"
			text[4] = "Thank goodness, the call went through!"
			text[5] = "There's a massive energy signature approaching!"
			text[6] = "Be careful!"
			
			if page = 7 {speaking_is_right = false;} //Switch speaker
			text[7] = "Huh?"
			text[8] = "Is it another mechaniloid or something like that?"
			
			if page = 9 {speaking_is_right = true;} //Switch speaker
			text[9] = "It's producing a huge amount of energy!!"
			text[10] = "But... it's unlike anything I've ever seen."
			text[11] = "It's..."
			text[12] = "A reploid?"
			break;
		
		case "X vs D1000":
			left_character = player;
			right_character = "Alia";
			
			text[0] = "Alia, I've located the D-1000 Excavator."
			text[1] = "It's moving around in a very strange way,"
			text[2] = "and there's this 'eye' that's been harassing me ever since I arrived." 
			
			if page = 3 {speaking_is_right = true;} //Switch speaker
			text[3] = "...?"
			text[4] = "Sorry, what do you mean?"
			text[5] = "The D-1000 isn't giving off any energy signatures."
			text[6] = "It's just sitting there deactivated, from what I can see."
			text[7] = "Are you referring to something else?"
			
			if page = 8 {speaking_is_right = false;} //Switch speaker
			text[8] = "Wh-what?"
			text[9] = "I'll call you back when I've sorted this out."
			if page >= 10 {right_character = "Nothing";}
			text[10] = "..."
			text[11] = "This 'eye' is too quick to catch."
			text[12] = "I need to destroy whatever it can use as a weapon."
			text[13] = "Though, it seems the D-1000 is too heavy for its own good…"
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
			text[0] = "Mechaniloids have started going maverick all around the crash site,"
			text[1] = "with a massive D-1000 Excavator being the main threat to the clean up crew."
			text[2] = "Once it is neutralized, the restoration can continue."
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "Understood."
			
			if page = 4 {speaking_is_right = true;} //Switch speaker
			text[4] = "I know you've been overworked with all these cases coming one after the other..."
			text[5] = "If you need to take a break, I can call in another team-"
			
			if page = 6 {speaking_is_right = false;} //Switch speaker
			text[6] = "No, it's okay, Alia."
			text[7] = "I had a feeling the effects of Sigma's attacks wouldn't just go away on their own."
			text[8] = "I've got to keep the peace, now more than ever."
			text[9] = "Beginning the mission."
			break;
		
		case "X vs Yammark": 
			left_character = player;
			right_character = "Yammark";

			scr_get_character(right_character);
			text[0] = character_name+", I've come to talk with you about your investigation."
			
			if page = 1 {speaking_is_right = true;} //Switch speaker
			text[1] = "How do you know that?"
			text[2] = "Who are you?"
			text[3] = "What do you want!?"
			
			if page = 4 {speaking_is_right = false;} //Switch speaker
			text[4] = "Release your perimeter, let the reploids caught inside go."
			
			if page = 5 {speaking_is_right = true;} //Switch speaker
			text[5] = "No one comes in!"
			text[6] = "NO ONE LEAVES!"
			text[7] = "My orders are ABSOLUTE until my investigation is complete!"
			
			if page = 8 {speaking_is_right = false;} //Switch speaker
			text[8] = "If that's how it will be, then I suggest you focus all of your mechaniloids on me."
			
			if page = 9 {speaking_is_right = true;} //Switch speaker
			text[9] = "I bet you're here to kill me!"
			text[10] = "You know what? I was the best in my field, and what did that get me?"
			text[11] = "My flight system was sabotaged and I died!"
			text[12] = "Did you also come here to sabotage me?"
			
			if page = 13 {speaking_is_right = false;} //Switch speaker
			text[13] = "Your paranoia is out of contr-"
			
			if page = 14 {speaking_is_right = true;} //Switch speaker
			text[14] = "No, no, no, no!"
			text[15] = "YOU... are out of control!"
			text[16] = "I know you are because you're a liar!"
			text[17] = "I won't be betrayed again-"
			text[18] = "I will delete you before you delete me!"
			text[19] = "FORMATION: RETURN!"
			break;
			
		case "X vs Turtloid": 
			left_character = player;
			right_character = "Turtloid";

			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "I was one of the few reploids authorized to enter and explore restricted 'Level A' pollution zones..."
			text[1] = "My shell was designed to withstand even the harshest of acid rain."	
			
			if page = 2 {speaking_is_right = false;} //Switch speaker
			text[2] = "We could use your help with the Eurasia crash site!"
			text[3] = "Your design is a gift,"
			text[4] = "and I would really appreciate it if you helped us undo the devastation that the crash caused."
			
			if page = 5 {speaking_is_right = true;} //Switch speaker
			text[5] = "A gift?"
			text[6] = "If that's the case..."
			text[7] = "Why was my creator punished when he refused to weaken my defensive capabilities?"
			text[8] = "They were punished all because of me and my 'gift'."
			text[9] = "I couldn't live with myself knowing how much shame I brought to everyone around me,"
			text[10] = "So I lived no more..."
			
			if page = 11 {speaking_is_right = false;} //Switch speaker
			text[11] = "But now you're back!"
			text[12] = "Things can be different now,"
			text[13] = "you and I can stop this nightmare together!"
			
			if page = 14 {speaking_is_right = true;} //Switch speaker
			text[14] = "I..."
			break;
			
		case "X vs Turtloid 2":
			left_character = player;
			right_character = "Turtloid";

			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "No."
			text[1] = "I've heard so many stories about a maverick hunter whose compassion knew no bounds..."	
			text[2] = "I didn't expect to finally meet him, not here."
			text[3] = "Seems my respect was well placed,"
			text[4] = "but it is my duty to prove my loyalty to my creator who has rebuilt me despite everything."
			text[5] = "He has forgiven me for my gift."
			
			scr_get_character(right_character);
			if page = 6 {speaking_is_right = false;} //Switch speaker
			text[6] = character_name+", I don't want to fight you!"
			
			if page = 7 {speaking_is_right = true;} //Switch speaker
			text[7] = "You have no choice but to surpass my gift."
			break;
			
		case "Dr.Light Intro":
			left_character = player;
			right_character = "Dr. Light";
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "I understand your sorrow, X..."
			text[1] = "You risked everything to save the world-"
			text[2] = "and yet, another conflict takes place right afterward."
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "You saved me after my encounter with Sigma..."
			text[4] = "It had to be you."
			text[5] = "After Dr. Cain's passing, you're the only one left who knows the true nature of my design."
			text[6] = "So please, if I can ask just this one thing…"
			text[7] = "Why have you only stepped in now to help me directly?"
			
			if page = 8 {speaking_is_right = true;} //Switch speaker
			text[8] = "I regret to tell you this, but...my power is starting to fade"
			text[9] = "I thought I could assist you until you knew an era of peace, a time where my help would no longer be necessary,"
			text[10] = "but now I'm being stretched too thin..."
			text[11] = "..."
			text[12] = "However, I'm not done yet, and you will need all the help you can get to fend off of the encroaching nightmare."
			text[13] = "..."
			
			//Resume normal dialogue for capsule
			if page = 13 
			{
				dialogue = instance_nearest(obj_player.x,obj_player.y,obj_capsule).dialogue
				page = 0;
				text = array_resize(text,0);
			}
			break;
			
		case "Blade Armour Leg Part":
			left_character = player;
			right_character = "Dr. Light";	
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "Step into this capsule, X."
			text[1] = "You will receive the leg parts for the Blade Armor."
			text[2] = "They will let you perform the damaging Mach Dash, allowing you to air dash in all four cardinal directions."
			text[3] = "It can also be charged in mid-air to deal even more damage."
			
			text[4] = "Guide the people, X."
			text[5] = "Defend them from the horrors that we can only dream of."
			break;
			
		case "Blade Armour Arm Part":
			left_character = player;
			right_character = "Dr. Light";	
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "Step into this capsule, X."
			text[1] = "You will receive the arm parts for the Blade Armor."
			text[2] = "The Blade Buster will fire a special energy blast,"
			text[3] = "emitting a radiation wave on impact which makes nearby enemies more vulnerable to your saber and other melee attacks."
			text[4] = "Your beam saber also has been fully integrated into your armour, making it less cumbersome to swing."

			text[5] = "Guide the people, X."
			text[6] = "Become the blade of hope that they all dream of."
			break;
			
		case "Amazon Ruins Intro":
			left_character = player;
			right_character = "Alia";
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "This is the Amazon Ruins."
			scr_get_character("Yammark");
			text[1] = character_name+" is the Nightmare Investigator in charge of this area." 
			text[2] = "Using his fleet of Yanma Mechaniloids, he has been attacking any Maverick Hunter trying to infiltrate his strict perimeter."
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "I'll try to get his attention so you can organize the reploid rescue operation."
			
			if page = 4 {speaking_is_right = true;} //Switch speaker
			text[4] = "Be careful, though. There are reports that the path ahead is infested with powerful mechaniloids that are said to be unstoppable."
			text[5] = "..."
			text[6] = "Although, my scans don't seem to show anything at all...?"
			
			if page = 7 {speaking_is_right = false;} //Switch speaker
			text[7] = "Must be the work of the Nightmare..."
			text[8] = "I'll be careful-"
			text[9] = "...!"
			text[10] = "Something's coming!"
			break;	
		case "Amazon Ruins Intro: Yammark Appears":
			left_character = player;
			right_character = "Alia";
			
			scr_get_character("Yammark");
			text[0] = "I've spotted "+character_name+"!"
			text[1] = "Beginning pursuit!"
			break;
			
		case "Inami Temple Intro":
			left_character = player;
			right_character = "Alia";
			
			if page = 0 {speaking_is_right = true;} //Switch speaker
			text[0] = "You should now be near the Inami Temple."
			scr_get_character("Turtloid");
			text[1] = "It's an important cultural asset that has been devastated by the Eurasia colony's crash." 
			text[2] = "The investigation into this area is being led by "+character_name+"."
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "How tragic..."
			text[4] = "This place is completely flooded with polluted water."
			
			if page = 5 {speaking_is_right = true;} //Switch speaker
			text[5] = "After the crash, a repair team attempted to set up Weather Analysis machines to keep the site protected from further harm."
			break;	
		case "Inami Temple Intro: Raining":
			left_character = player;
			right_character = "Alia";
			
			if page = 0 {speaking_is_right = false;} //Switch speaker
			text[0] = "...?"
			text[1] = "It just started raining out of nowhere."
			
			if page = 2 {speaking_is_right = true;} //Switch speaker
			text[2] = "Looks like they haven't had much luck with the machines…"
			
			if page = 3 {speaking_is_right = false;} //Switch speaker
			text[3] = "...!"
			text[4] = "Alia, this isn't normal rain!"
			text[5] = "It's acid rain!"
			
			if page = 6 {speaking_is_right = true;} //Switch speaker
			text[6] = "Acid rain?"
			text[7] = "But I'm not detecting any heavy downpour in that area?"
			text[8] = "The nightmare must have caused the Weather Analysis machines to go berserk!"
			text[9] = "I'll get you out of there!"
			
			if page = 10 {speaking_is_right = false;} //Switch speaker
			text[10] = "No, it's okay!"
			text[11] = "As long as I keep myself repaired,"
			text[12] = "I'll be able to destroy those infected machines and cleanse the area of the nightmare's influence!"
			break;
	}
}