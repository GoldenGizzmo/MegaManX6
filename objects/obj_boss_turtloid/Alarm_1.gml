/// @description Choose Attack
if life > 0
{
	sprite_index = spr_boss_turtloid_idle;
	image_speed = 1;
	
	var change = irandom(2);
	
	//Choose attack
	switch (state)
	{
		case "Rockets": 
			state = "Rolling"; 
			if change = 0
				state = "Bounce";
			break;
		case "Rolling": 
			state = "Stomp"; 
			if change = 0
				state = "Rockets";
			break;
		case "Stomp": 
			state = "Bounce"; 
			if change = 0
				state = "Rockets";
			break;
		case "Bounce": 
			state = "Rockets";
			if change = 0
				state = "Rolling";
			break;
		
		default: state = "Rockets"; break;
	}
	
	alarm[0] = 60;
	
	//Giga attack at less than half health 
	if life <= lifemax/2 and done_giga = false
	{
		done_giga = true;
		state = "Giga";
		
		alarm[0] = 1;
	}
	
	if done_giga = true
		alarm[0] = 30; //Attack faster
}