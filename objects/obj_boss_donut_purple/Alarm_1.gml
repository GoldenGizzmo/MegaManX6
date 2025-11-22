/// @description Choose Attack

if life > 0
{
	//Choose attack
	switch (state)
	{
		case "First Moving":
		case "Charge":
			state = "Moving"
			direction = 270;
			bounce_amount = 3+irandom(4);
			break;
		case "Moving":
			state = "Charge"
			break
			
		default: state = "First Moving"; break;
	}
	alarm[0] = 1;
}