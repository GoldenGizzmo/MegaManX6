/// @description Choose Attack

if life > 0
{
	event_user(3);
	
	//Choose attack
	switch (state)
	{
		case "Charge": state = "Shoot"; break;
		case "Crush": state = "Shoot"; break;
		case "Shoot": state = choose("Charge","Crush","Crush"); break;
		
		case "Falling": state = "Shoot"; break;
		default: state = "Charge"; break;
	}
	alarm[0] = 30;
	
	//Giga attack at less than half health 
	if life <= lifemax/2 and done_giga = false
	{
		done_giga = true;
		state = "Giga";
	}
}