/// @description Choose Attack

if life > 0
{
	event_user(3);
	
	//Choose attack
	switch (state)
	{
		case "Shooting": state = "God Bird"; break;
		case "God Bird": state = "Shooting"; break;
		
		default: state = "Shooting"; break;
	}
	alarm[0] = 30;
	
	state = "Defeated";
	
	if defeated = true
	{
		state = "Defeated";
		alarm[0] = 1;
	}
}