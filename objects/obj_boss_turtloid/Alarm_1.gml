/// @description Choose Attack
if life > 0
{
	sprite_index = spr_boss_turtloid_idle;
	image_speed = 1;
	
	//Choose attack
	switch (state)
	{
		case "Rockets": state = "Rolling"; break;
		case "Rolling": state = "Stomp"; break;
		case "Stomp": state = "Bounce"; break;
		case "Bounce": state = "Rockets"; break;
		
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
}