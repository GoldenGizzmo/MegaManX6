/// @description Choose Attack

if life > 0
{
	//Choose attack
	switch (state)
	{
		case "Moving": 
			state = "Summon";
			alarm[2] = -1;	
		
			shoot = 0;
			flamethrower = 0;
			break;
		case "Summon": 
			state = "Moving"; 
			alarm[2] = 360; //Flame thrower
			break;
			
		default: 
			state = "Moving"; 
			alarm[2] = 360; //Flame thrower
			break;
	}
	alarm[0] = 30;
}