/// @description Choose Attack

if life > 0
{
	event_user(3);
	alarm[0] = 30;
	if done_giga = true
		alarm[0] = 10;
	
	//Choose attack
	switch (state)
	{
		case "Openning": 
			state = "Magma Stream" 
			next_state = "Shooting";
			break;
		
		case "Fly Around": //After flying for a bit
			switch (next_state)
			{
				case "Shooting": state = "Dive"; break;
				case "Dive": state = "Shooting"; break;
			}
			alarm[0] = 15;
			if done_giga = true
				alarm[0] = 5;
			
			next_state = state; //Prevent happening twice in a row
			break;
			
		case "Shooting":
		case "Dive":
			state = choose("Fly Around","Flare","God Bird");
			break;
			
		default: state = "Fly Around"; break;
	}
	
	//Magma stream at half health
	if magma_stream_trigger = 0 and life <= lifemax/2
	{
		magma_stream_trigger++;
		state = "Magma Stream";
	}
	
	
		
		
			/*
			case "Fly Around":
				state = next_state;
				break;
			
			switch (next_state)
			{
				//After small moves
				case "Shooting": next_state = choose("Dive","Flare","God Bird"); break;
				case "Dive": next_state = choose("Shooting","Flare","God Bird") break;
				
				//After big moves
				case "God Bird": next_state = choose("Dive","Shooting"); break;
				case "Flare": next_state = choose("Dive","Shooting"); break;
				
				default: next_state = choose("Dive","Flare","God Bird","Shooting"); break;
			}
			
			
			
			//First attack is Magma Stream
			if state = "Openning"
				state = "Magma Stream"
			else
				state = "Fly Around";*/ 

	
}